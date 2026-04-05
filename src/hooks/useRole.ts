import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import type { UserRole } from '@/types/database'
import { useAuth } from './useAuth'

export function useRole() {
  const { user } = useAuth()
  const [userRole, setUserRole] = useState<UserRole | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!user) {
      setUserRole(null)
      setLoading(false)
      return
    }

    const fetchRole = async () => {
      const { data, error } = await supabase
        .from('user_roles')
        .select('*')
        .eq('user_id', user.id)
        .single()
      if (error && error.code !== 'PGRST116') {
        // PGRST116 = no rows found (not an RLS error)
        console.error('[useRole] Failed to fetch role:', error.message, error.code)
      }
      setUserRole(data)
      setLoading(false)
    }

    fetchRole()
  }, [user])

  return {
    userRole,
    role: userRole?.role ?? null,
    displayName: userRole?.display_name ?? '',
    companyAccess: userRole?.company_access ?? null,
    isAdmin: userRole?.role === 'admin',
    isViewer: userRole?.role === 'viewer',
    forcePasswordReset: userRole?.force_password_reset ?? false,
    loading,
  }
}
