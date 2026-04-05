import { useState, useCallback } from 'react'
import { useMutation } from '@tanstack/react-query'
import { Upload, FileSpreadsheet, AlertTriangle, CheckCircle2 } from 'lucide-react'
import * as XLSX from 'xlsx'
import { supabase } from '@/lib/supabase'
import { parseIndianAmount } from '@/lib/format'
import { logAudit } from '@/lib/audit'
import { useCompany } from '@/hooks/useCompany'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'

interface ParsedProject {
  project_name: string
  client_name: string
  total_contract_value: number
  contract_tenure_start: string | null
  contract_tenure_end: string | null
  status: string
  areas_under_design: string[]
  stages: Array<{
    stage_name: string
    stage_number: number
    percentage_of_total: number
    lumpsum_amount: number
    payment_status: string
  }>
  warnings: string[]
}

function fuzzyMatch(header: string, targets: string[]): boolean {
  const h = header.toLowerCase().trim()
  return targets.some((t) => h.includes(t.toLowerCase()))
}

function parseExcelDate(value: any): string | null {
  if (!value) return null
  if (typeof value === 'number') {
    const date = XLSX.SSF.parse_date_code(value)
    if (date) return `${date.y}-${String(date.m).padStart(2, '0')}-${String(date.d).padStart(2, '0')}`
  }
  if (typeof value === 'string') {
    const d = new Date(value)
    if (!isNaN(d.getTime())) return d.toISOString().split('T')[0]
  }
  return null
}

function parseSheet(sheet: XLSX.WorkSheet): ParsedProject[] {
  const data = XLSX.utils.sheet_to_json<Record<string, any>>(sheet, { defval: '' })
  if (data.length === 0) return []

  const headers = Object.keys(data[0])
  const colMap: Record<string, string> = {}

  for (const h of headers) {
    if (fuzzyMatch(h, ['project name', 'proj name', 'project'])) colMap.project_name = h
    else if (fuzzyMatch(h, ['client name', 'client'])) colMap.client_name = h
    else if (fuzzyMatch(h, ['contract value', 'total fee', 'lumpsum', 'total value', 'fee']))
      colMap.total_contract_value = h
    else if (fuzzyMatch(h, ['start date', 'commencement', 'from', 'start']))
      colMap.contract_tenure_start = h
    else if (fuzzyMatch(h, ['end date', 'completion', 'to', 'end']))
      colMap.contract_tenure_end = h
    else if (fuzzyMatch(h, ['status'])) colMap.status = h
    else if (fuzzyMatch(h, ['area', 'scope', 'design area'])) colMap.areas = h
  }

  const stageHeaders = headers.filter(
    (h) =>
      (h.toLowerCase().includes('stage') || h.includes('%')) &&
      !Object.values(colMap).includes(h),
  )

  const projects: ParsedProject[] = []
  for (const row of data) {
    const pName = String(row[colMap.project_name] ?? '').trim()
    if (!pName) continue

    const warnings: string[] = []
    const contractValue = parseIndianAmount(String(row[colMap.total_contract_value] ?? '0'))
    const startDate = parseExcelDate(row[colMap.contract_tenure_start])
    const endDate = parseExcelDate(row[colMap.contract_tenure_end])

    if (!startDate && colMap.contract_tenure_start)
      warnings.push('Could not parse start date')
    if (!endDate && colMap.contract_tenure_end) warnings.push('Could not parse end date')

    const areas = colMap.areas
      ? String(row[colMap.areas])
          .split(/[,;]/)
          .map((a) => a.trim())
          .filter(Boolean)
      : []

    const statusRaw = String(row[colMap.status] ?? 'active').toLowerCase()
    const status = ['active', 'on-hold', 'completed', 'cancelled'].includes(statusRaw)
      ? statusRaw
      : 'active'

    const stages: ParsedProject['stages'] = []
    let stageNum = 1
    for (const sh of stageHeaders) {
      const val = row[sh]
      if (val === '' || val == null) continue
      const pct = typeof val === 'number' ? val : parseFloat(String(val).replace('%', ''))
      if (isNaN(pct)) continue
      stages.push({
        stage_name: sh.replace(/[%\d]/g, '').trim() || `Stage ${stageNum}`,
        stage_number: stageNum,
        percentage_of_total: pct > 1 ? pct : pct * 100,
        lumpsum_amount: contractValue * (pct > 1 ? pct / 100 : pct),
        payment_status: 'pending',
      })
      stageNum++
    }

    projects.push({
      project_name: pName,
      client_name: String(row[colMap.client_name] ?? 'Unknown Client').trim(),
      total_contract_value: contractValue,
      contract_tenure_start: startDate,
      contract_tenure_end: endDate,
      status,
      areas_under_design: areas,
      stages,
      warnings,
    })
  }

  return projects
}

export function ImportExcelPage() {
  const { selectedCompanyId } = useCompany()
  const [parsed, setParsed] = useState<ParsedProject[]>([])
  const [fileName, setFileName] = useState('')
  const [importResult, setImportResult] = useState<{
    success: number
    errors: number
  } | null>(null)

  const handleFile = useCallback((file: File) => {
    setFileName(file.name)
    setImportResult(null)
    const reader = new FileReader()
    reader.onload = (e) => {
      const data = new Uint8Array(e.target!.result as ArrayBuffer)
      const workbook = XLSX.read(data, { type: 'array' })
      const allProjects: ParsedProject[] = []
      for (const sheetName of workbook.SheetNames) {
        const sheet = workbook.Sheets[sheetName]
        allProjects.push(...parseSheet(sheet))
      }
      setParsed(allProjects)
    }
    reader.readAsArrayBuffer(file)
  }, [])

  const handleDrop = useCallback(
    (e: React.DragEvent) => {
      e.preventDefault()
      const file = e.dataTransfer.files[0]
      if (file) handleFile(file)
    },
    [handleFile],
  )

  const importMutation = useMutation({
    mutationFn: async () => {
      let success = 0
      let errors = 0

      for (const project of parsed) {
        try {
          const { data: inserted, error: pErr } = await supabase
            .from('projects')
            .insert({
              company_id: selectedCompanyId!,
              project_name: project.project_name,
              client_name: project.client_name,
              total_contract_value: project.total_contract_value,
              contract_tenure_start: project.contract_tenure_start,
              contract_tenure_end: project.contract_tenure_end,
              status: project.status as any,
              areas_under_design: project.areas_under_design,
            })
            .select('id')
            .single()

          if (pErr || !inserted) {
            errors++
            continue
          }

          if (project.stages.length > 0) {
            const stageRows = project.stages.map((s) => ({
              project_id: inserted.id,
              stage_name: s.stage_name,
              stage_number: s.stage_number,
              percentage_of_total: s.percentage_of_total,
              lumpsum_amount: s.lumpsum_amount,
              payment_status: s.payment_status as any,
            }))
            await supabase.from('fee_stages').insert(stageRows)
          }
          success++
        } catch {
          errors++
        }
      }

      await logAudit({
        action: 'excel_import_completed',
        details: { fileName, projectCount: success, errorCount: errors },
      })

      return { success, errors }
    },
    onSuccess: (result) => {
      setImportResult(result)
    },
  })

  const totalWarnings = parsed.reduce((sum, p) => sum + p.warnings.length, 0)
  const totalStages = parsed.reduce((sum, p) => sum + p.stages.length, 0)

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Import Excel Data</h1>
        <p className="text-sm text-muted-foreground mt-1">
          One-time legacy data migration from Excel spreadsheets
        </p>
      </div>

      <Card className="border-amber-200 dark:border-amber-800 bg-amber-50 dark:bg-amber-950/20">
        <CardContent className="p-4 flex items-start gap-3">
          <AlertTriangle className="h-5 w-5 text-amber-600 shrink-0 mt-0.5" />
          <div className="text-sm">
            <p className="font-medium text-amber-800 dark:text-amber-200">
              This is a one-time migration tool
            </p>
            <p className="text-amber-700 dark:text-amber-300 mt-1">
              Running this again will create duplicate records. Only use this for the initial
              data import from your legacy Excel files.
            </p>
          </div>
        </CardContent>
      </Card>

      {!parsed.length && (
        <Card>
          <CardContent className="p-0">
            <div
              className="border-2 border-dashed rounded-lg p-16 text-center cursor-pointer hover:bg-muted/50 transition-colors"
              onDrop={handleDrop}
              onDragOver={(e) => e.preventDefault()}
              onClick={() => {
                const input = document.createElement('input')
                input.type = 'file'
                input.accept = '.xlsx,.xls'
                input.onchange = (e) => {
                  const file = (e.target as HTMLInputElement).files?.[0]
                  if (file) handleFile(file)
                }
                input.click()
              }}
            >
              <Upload className="h-12 w-12 mx-auto mb-4 text-muted-foreground" />
              <p className="text-lg font-medium">Drop your Excel file here</p>
              <p className="text-sm text-muted-foreground mt-1">
                or click to browse — supports .xlsx and .xls
              </p>
            </div>
          </CardContent>
        </Card>
      )}

      {parsed.length > 0 && !importResult && (
        <>
          <Card>
            <CardHeader>
              <div className="flex items-center justify-between">
                <div>
                  <CardTitle className="flex items-center gap-2">
                    <FileSpreadsheet className="h-5 w-5" />
                    Preview: {fileName}
                  </CardTitle>
                  <CardDescription className="mt-1">
                    {parsed.length} projects, {totalStages} stages
                    {totalWarnings > 0 && `, ${totalWarnings} warnings`}
                  </CardDescription>
                </div>
                <div className="flex gap-2">
                  <Button variant="outline" onClick={() => setParsed([])}>
                    Clear
                  </Button>
                  <Button onClick={() => importMutation.mutate()} disabled={importMutation.isPending}>
                    {importMutation.isPending ? 'Importing...' : 'Confirm Import'}
                  </Button>
                </div>
              </div>
            </CardHeader>
            <CardContent>
              <div className="overflow-x-auto">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>#</TableHead>
                      <TableHead>Project Name</TableHead>
                      <TableHead>Client</TableHead>
                      <TableHead>Contract Value</TableHead>
                      <TableHead>Start</TableHead>
                      <TableHead>End</TableHead>
                      <TableHead>Status</TableHead>
                      <TableHead>Stages</TableHead>
                      <TableHead>Warnings</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {parsed.map((p, i) => (
                      <TableRow key={i}>
                        <TableCell>{i + 1}</TableCell>
                        <TableCell className="font-medium">{p.project_name}</TableCell>
                        <TableCell>{p.client_name}</TableCell>
                        <TableCell className="font-mono">
                          {p.total_contract_value.toLocaleString('en-IN')}
                        </TableCell>
                        <TableCell className="text-xs">{p.contract_tenure_start ?? '—'}</TableCell>
                        <TableCell className="text-xs">{p.contract_tenure_end ?? '—'}</TableCell>
                        <TableCell>
                          <Badge variant="outline">{p.status}</Badge>
                        </TableCell>
                        <TableCell>{p.stages.length}</TableCell>
                        <TableCell>
                          {p.warnings.length > 0 ? (
                            <Badge variant="warning">{p.warnings.length}</Badge>
                          ) : (
                            <span className="text-xs text-muted-foreground">—</span>
                          )}
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </CardContent>
          </Card>
        </>
      )}

      {importResult && (
        <Card>
          <CardContent className="p-8 text-center">
            {importResult.errors === 0 ? (
              <>
                <CheckCircle2 className="h-12 w-12 mx-auto mb-4 text-emerald-600" />
                <h2 className="text-xl font-semibold">Import Complete</h2>
                <p className="text-muted-foreground mt-2">
                  Successfully imported {importResult.success} projects
                </p>
              </>
            ) : (
              <>
                <AlertTriangle className="h-12 w-12 mx-auto mb-4 text-amber-600" />
                <h2 className="text-xl font-semibold">Import Completed with Errors</h2>
                <p className="text-muted-foreground mt-2">
                  {importResult.success} succeeded, {importResult.errors} failed
                </p>
              </>
            )}
            <Button variant="outline" className="mt-4" onClick={() => { setParsed([]); setImportResult(null) }}>
              Done
            </Button>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
