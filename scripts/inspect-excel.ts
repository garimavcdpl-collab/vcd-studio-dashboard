import 'dotenv/config'
import * as path from 'path'
import XLSX from 'xlsx'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const filePath = path.resolve(__dirname, '..', 'data', 'Invoice Statement for VC&D LLP.xlsx')

const workbook = XLSX.readFile(filePath)

for (const sheetName of workbook.SheetNames) {
  console.log(`\n${'='.repeat(60)}`)
  console.log(`Sheet: "${sheetName}"`)
  console.log('='.repeat(60))

  const sheet = workbook.Sheets[sheetName]!
  const data = XLSX.utils.sheet_to_json<Record<string, unknown>>(sheet)

  const headers = data.length > 0 ? Object.keys(data[0]!) : []
  console.log(`\nHeaders (${headers.length}):`, headers)
  console.log(`Total rows: ${data.length}`)

  console.log('\nFirst 5 rows:')
  for (let i = 0; i < Math.min(5, data.length); i++) {
    console.log(JSON.stringify(data[i], null, 2))
  }
}
