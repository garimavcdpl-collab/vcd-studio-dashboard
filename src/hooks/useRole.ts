import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import type { UserRole } from '@/types/database'
import { useAuth } from './useAuth'

// Module-level cache so all hook instances (Sidebar, AdminRoute, etc.)
// share the same data without re-fetching
let cachedRole: UserRole | null = null
let cachedUserId: string | null = null

export function useRole() {
  const { user } = useAuth()

  // If same user, start from cache immediately (no flicker / redirect race)
  const [userRole, setUserRole] = useState<UserRole | null>(
    () => (user?.id === cachedUserId ? cachedRole : null),
  )
  const [loading, setLoading] = useState(
    () => !(user?.id === cachedUserId && cachedRole !== undefined),
  )

  useEffect(() => {
    if (!user) {
      cachedRole = null
      cachedUserId = null
      setUserRole(null)
      setLoading(false)
      return
    }

    // Already cached for this user — use it
    if (user.id === cachedUserId && cachedRole !== undefined) {
      setUserRole(cachedRole)
      setLoading(false)
      return
    }

    setLoading(true)

    const fetchRole = async () => {
      const { data, error } = await supabase
        .from('user_roles')
        .select('*')
        .eq('user_id', user.id)
        .single()

      if (error && error.code !== 'PGRST116') {
        console.error('[useRole] Failed to fetch role:', error.message)
      }

      cachedRole = data
      cachedUserId = user.id
      setUserRole(data)
      setLoading(false)
    }

    fetchRole()
  }, [user])

  return {
    userRole,
    role: userRole?.role ?? null,
    displayName: userRole?.display_name ?? user?.email ?? '',
    companyAccess: userRole?.company_access ?? null,
    isAdmin: userRole?.role === 'admin',
    isViewer: userRole?.role === 'viewer',
    forcePasswordReset: userRole?.force_password_reset ?? false,
    loading,
  }
}

// Call this after DB update to force a fresh fetch on next render
export function invalidateRoleCache() {
  cachedRole = null
  cachedUserId = null
}
