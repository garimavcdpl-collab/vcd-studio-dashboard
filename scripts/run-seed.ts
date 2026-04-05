import 'dotenv/config'
import { createClient } from '@supabase/supabase-js'
import * as fs from 'fs'
import * as path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const supabaseUrl = process.env.VITE_SUPABASE_URL!
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY!

if (!supabaseUrl || !serviceRoleKey) {
  console.error('Missing env vars: VITE_SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, serviceRoleKey, {
  auth: { autoRefreshToken: false, persistSession: false },
})

async function main() {
  const seedFile = path.resolve(__dirname, '..', 'supabase', 'seed-from-excel.sql')

  if (!fs.existsSync(seedFile)) {
    console.error('No seed file found. Run import-excel.ts first.')
    process.exit(1)
  }

  const sql = fs.readFileSync(seedFile, 'utf-8')
  const statements = sql
    .split(';')
    .map((s) => s.trim())
    // Strip leading comment lines, keep the actual SQL
    .map((s) => s.split('\n').filter((line) => !line.trim().startsWith('--')).join('\n').trim())
    .filter((s) => s.length > 0)

  console.log(`Found ${statements.length} SQL statements to execute`)

  let success = 0
  let errors = 0

  for (const stmt of statements) {
    try {
      const { error } = await supabase.rpc('exec_sql' as any, { sql: stmt + ';' })
      if (error) {
        // Fallback: try direct insertion approach
        console.warn(`  Warning: ${error.message}`)
        errors++
      } else {
        success++
      }
    } catch (err: any) {
      console.error(`  Error: ${err.message}`)
      errors++
    }
  }

  console.log(`\nResults:`)
  console.log(`  ✓ Success: ${success}`)
  if (errors > 0) console.log(`  ✗ Errors: ${errors}`)
  console.log(`\nSeed complete.`)
}

main().catch(console.error)
