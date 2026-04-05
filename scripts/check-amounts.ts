import XLSX from 'xlsx'
import * as path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)
const filePath = path.resolve(__dirname, '..', 'data', 'Invoice Statement for VC&D LLP.xlsx')
const workbook = XLSX.readFile(filePath)

// Check VCDLLP
const sheet = workbook.Sheets['VCDLLP']!
const data = XLSX.utils.sheet_to_json<Record<string, any>>(sheet, { defval: '' })
let count = 0
console.log('=== VCDLLP - First 5 rows with payments ===')
for (const row of data) {
  if (count >= 5) break
  const received = Number(row[' Amount Received '] || 0)
  if (received > 0) {
    console.log({
      project: row['Project'],
      stage: row['Stage'],
      baseAmount: row['Amount'],
      amtToReceivePostDeductions: row[' Amount to be Received post Deductions '],
      amountReceived: row[' Amount Received '],
    })
    count++
  }
}

// Check VCDPL
const sheet2 = workbook.Sheets['VCDPL']!
const data2 = XLSX.utils.sheet_to_json<Record<string, any>>(sheet2, { range: 1 })
count = 0
console.log('\n=== VCDPL - First 5 rows with payments ===')
for (const row of data2) {
  if (count >= 5) break
  const received = Number(row['money received'] || 0)
  if (received > 0) {
    console.log({
      project: row['project '],
      stage: row['stage'],
      baseAmount: row['Base'],
      amtToReceiveAfterTax: row['Amount to be received after taxations'],
      moneyReceived: row['money received'],
      amountPending: row['amount pending'],
    })
    count++
  }
}
