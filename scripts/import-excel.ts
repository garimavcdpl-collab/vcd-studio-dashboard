import * as fs from 'fs'
import * as path from 'path'
import XLSX from 'xlsx'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const DATA_DIR = path.resolve(__dirname, '..', 'data')
const OUTPUT_FILE = path.resolve(__dirname, '..', 'supabase', 'seed-from-excel.sql')

function escapeSQL(str: string): string {
  return str.replace(/'/g, "''")
}

function parseFlexDate(value: any): string | null {
  if (!value) return null
  if (typeof value === 'number') {
    const d = XLSX.SSF.parse_date_code(value)
    if (d) return `${d.y}-${String(d.m).padStart(2, '0')}-${String(d.d).padStart(2, '0')}`
  }
  if (typeof value === 'string') {
    const s = value.trim()
    // Try "1st March, 2019" / "26th Aug, 2013" etc.
    const cleaned = s.replace(/(st|nd|rd|th)\s/i, ' ')
    const d = new Date(cleaned)
    if (!isNaN(d.getTime())) return d.toISOString().split('T')[0]
  }
  return null
}

interface StageRow {
  stageName: string
  stageNumber: number
  lumpsumAmount: number
  invoiceNumber: string | null
  invoiceDate: string | null
  amountPaid: number
  paymentReceivedDate: string | null
  paymentStatus: 'paid' | 'partial' | 'invoiced' | 'pending'
}

interface ProjectData {
  projectName: string
  clientName: string
  totalContractValue: number
  status: string
  stages: StageRow[]
}

function derivePaymentStatus(amount: number, paid: number): 'paid' | 'partial' | 'invoiced' | 'pending' {
  if (paid >= amount && amount > 0) return 'paid'
  if (paid > 0) return 'partial'
  if (amount > 0) return 'invoiced'
  return 'pending'
}

function main() {
  const files = fs.readdirSync(DATA_DIR).filter((f) => /\.xlsx?$/i.test(f))
  if (files.length === 0) {
    console.error('No Excel files found in /data/ folder')
    process.exit(1)
  }

  // Accumulate projects keyed by (sheetName, projectName)
  const projectMap = new Map<string, ProjectData>()

  for (const file of files) {
    const filePath = path.join(DATA_DIR, file)
    console.log(`\nParsing: ${file}`)
    const workbook = XLSX.readFile(filePath)

    for (const sheetName of workbook.SheetNames) {
      console.log(`  Sheet: ${sheetName}`)
      const sheet = workbook.Sheets[sheetName]!

      let data: Record<string, any>[]

      // VCDPL has header offset at row 2
      if (sheetName.toUpperCase().includes('VCDPL')) {
        data = XLSX.utils.sheet_to_json<Record<string, any>>(sheet, { range: 1 })
      } else {
        data = XLSX.utils.sheet_to_json<Record<string, any>>(sheet, { defval: '' })
      }

      if (data.length === 0) {
        console.log('    (empty sheet)')
        continue
      }

      const headers = Object.keys(data[0])
      console.log(`    Columns: ${headers.filter(h => !h.startsWith('__EMPTY')).join(', ')}`)
      console.log(`    Rows: ${data.length}`)

      // Determine which company this sheet belongs to
      const companyCode = sheetName.toUpperCase().includes('VCDPL') ? 'VCDPL' : 'VCDLLP'

      for (const row of data) {
        // Get project name
        const projectName = String(row['Project'] ?? row['project '] ?? row['project'] ?? '').trim()
        if (!projectName) continue

        // Get stage info
        const stageName = String(row['Stage'] ?? row['stage'] ?? '').trim()
        if (!stageName) continue

        // Get amounts — use receivable amount (post deductions) as lumpsum, not base
        const receivable = Number(
          row[' Amount to be Received post Deductions '] ??
          row['Amount to be received after taxations'] ?? 0
        ) || 0
        const baseAmount = Number(row['Amount'] ?? row['Base'] ?? 0) || 0
        const totalValue = Number(row['Total Value'] ?? 0) || 0
        const lumpsumAmount = receivable || baseAmount || 0

        // Invoice info
        const invoiceNum = row['Invoice #'] ?? row['invoice #']
        const invoiceNumber = invoiceNum ? String(invoiceNum) : null
        const invoiceDate = parseFlexDate(row['Date Raised'] ?? row['date raised '] ?? row['date raised'])

        // Payment info
        const amountReceived = Number(row[' Amount Received '] ?? row['money received'] ?? 0) || 0
        const paymentDate = parseFlexDate(row['Money Received On'] ?? row['money received on '] ?? row['money received on'])

        // Status
        const statusRaw = String(row['Status'] ?? row['__EMPTY'] ?? '').trim().toLowerCase()
        const projectStatus = statusRaw === 'completed' ? 'completed'
          : statusRaw === 'on-hold' || statusRaw === 'on hold' ? 'on-hold'
          : statusRaw === 'cancelled' ? 'cancelled'
          : 'active'

        // Client name: for VCDPL rows, project name often contains client
        const clientName = String(row['contact person'] ?? 'Unknown').trim() || 'Unknown'

        // Unique key: company + project name
        const key = `${companyCode}::${projectName}`

        if (!projectMap.has(key)) {
          projectMap.set(key, {
            projectName,
            clientName,
            totalContractValue: totalValue,
            status: projectStatus,
            stages: [],
          })
        }

        const project = projectMap.get(key)!
        // Update total contract value if this row has it and current is 0
        if (totalValue > 0 && project.totalContractValue === 0) {
          project.totalContractValue = totalValue
        }
        // Update status: if any row says completed and we currently say active, keep completed
        if (projectStatus === 'completed') {
          project.status = 'completed'
        }

        const stageNumber = project.stages.length + 1
        const paymentStatus = derivePaymentStatus(lumpsumAmount, amountReceived)

        project.stages.push({
          stageName,
          stageNumber,
          lumpsumAmount,
          invoiceNumber,
          invoiceDate,
          amountPaid: amountReceived,
          paymentReceivedDate: paymentDate,
          paymentStatus,
        })
      }
    }
  }

  // Generate SQL
  let sql = '-- Auto-generated seed data from Excel import\n'
  sql += '-- Review before running!\n\n'

  // First, ensure we have both companies
  sql += `-- Ensure companies exist\n`
  sql += `INSERT INTO companies (name) VALUES ('VCDLLP') ON CONFLICT DO NOTHING;\n`
  sql += `INSERT INTO companies (name) VALUES ('VCDPL') ON CONFLICT DO NOTHING;\n\n`

  let totalProjects = 0
  let totalStages = 0

  for (const [key, project] of projectMap) {
    const companyCode = key.split('::')[0]
    totalProjects++

    sql += `-- Project: ${project.projectName} (${companyCode}) — ${project.stages.length} stages\n`
    sql += `INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)\n`
    sql += `  SELECT c.id, '${escapeSQL(project.projectName)}', '${escapeSQL(project.clientName)}', ${project.totalContractValue}, '${project.status}'\n`
    sql += `  FROM companies c WHERE c.name = '${companyCode}' LIMIT 1;\n\n`

    for (const stage of project.stages) {
      totalStages++
      sql += `INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)\n`
      sql += `  SELECT p.id, '${escapeSQL(stage.stageName)}', ${stage.stageNumber}, ${stage.lumpsumAmount}, ${stage.invoiceNumber ? `'${escapeSQL(stage.invoiceNumber)}'` : 'NULL'}, ${stage.invoiceDate ? `'${stage.invoiceDate}'` : 'NULL'}, ${stage.amountPaid}, ${stage.paymentReceivedDate ? `'${stage.paymentReceivedDate}'` : 'NULL'}, '${stage.paymentStatus}'\n`
      sql += `  FROM projects p\n`
      sql += `  JOIN companies c ON c.id = p.company_id AND c.name = '${companyCode}'\n`
      sql += `  WHERE p.project_name = '${escapeSQL(project.projectName)}' LIMIT 1;\n`
    }
    sql += '\n'
  }

  fs.writeFileSync(OUTPUT_FILE, sql)
  console.log(`\n✓ Generated: ${OUTPUT_FILE}`)
  console.log(`  Unique projects: ${totalProjects}`)
  console.log(`  Total stages/invoices: ${totalStages}`)
  console.log(`\nReview the file before running: npx ts-node scripts/run-seed.ts`)
}

main()
