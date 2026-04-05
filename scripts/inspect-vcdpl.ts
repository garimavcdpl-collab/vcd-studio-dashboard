import XLSX from 'xlsx'
import * as path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)
const filePath = path.resolve(__dirname, '..', 'data', 'Invoice Statement for VC&D LLP.xlsx')
const workbook = XLSX.readFile(filePath)
const sheet = workbook.Sheets['VCDPL']!
console.log('Range:', sheet['!ref'])
const range = XLSX.utils.decode_range(sheet['!ref']!)
for (let r = range.s.r; r <= Math.min(range.s.r + 5, range.e.r); r++) {
  const row: Record<string, any> = {}
  for (let c = range.s.c; c <= Math.min(range.e.c, 20); c++) {
    const addr = XLSX.utils.encode_cell({r, c})
    if (sheet[addr]) row[addr] = (sheet[addr] as any).v
  }
  console.log(`Row ${r}:`, JSON.stringify(row))
}

// Also try parsing with header row = 2
console.log('\n--- Parsing with header=2 ---')
const data2 = XLSX.utils.sheet_to_json<Record<string, any>>(sheet, { range: 1 })
if (data2.length > 0) {
  console.log('Headers:', Object.keys(data2[0]))
  console.log('Row count:', data2.length)
  for (let i = 0; i < Math.min(3, data2.length); i++) {
    console.log(JSON.stringify(data2[i], null, 2))
  }
}
