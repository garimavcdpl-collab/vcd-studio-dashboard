import 'dotenv/config'
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.VITE_SUPABASE_URL!
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY!

if (!supabaseUrl || !serviceRoleKey) {
  console.error('Missing env vars: VITE_SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, serviceRoleKey, {
  auth: { autoRefreshToken: false, persistSession: false },
})

const users = [
  {
    email: process.env.GARIMA_EMAIL!,
    display_name: 'Garima',
    role: 'admin' as const,
  },
  {
    email: process.env.PRATEEK_EMAIL!,
    display_name: 'Prateek',
    role: 'admin' as const,
  },
  {
    email: process.env.RVR_EMAIL!,
    display_name: 'RVR',
    role: 'viewer' as const,
  },
]

async function main() {
  for (const u of users) {
    if (!u.email) {
      console.error(`Missing email env var for ${u.display_name}`)
      continue
    }

    console.log(`Creating user: ${u.display_name} (${u.email})...`)

    const { data: authUser, error: authError } =
      await supabase.auth.admin.createUser({
        email: u.email,
        password: 'TempPass123!',
        email_confirm: true,
      })

    if (authError) {
      console.error(`  Auth error for ${u.display_name}:`, authError.message)
      continue
    }

    console.log(`  Auth user created: ${authUser.user.id}`)

    const { error: roleError } = await supabase.from('user_roles').insert({
      user_id: authUser.user.id,
      display_name: u.display_name,
      role: u.role,
      company_access: null,
      force_password_reset: true,
    })

    if (roleError) {
      console.error(`  Role insert error for ${u.display_name}:`, roleError.message)
      continue
    }

    console.log(`  Role assigned: ${u.role}`)
    console.log(`  User ${u.display_name} created successfully!`)
  }

  console.log('\nDone! All users must change their password on first login.')
}

main().catch(console.error)
