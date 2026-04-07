import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import type { UserRole } from '@/types/database'
import { useAuth } from '@/contexts/AuthContext'

// Module-level cache so all hook instances share the same data without re-fetching
let cachedRole: UserRole | null | undefined = undefined
let cachedUserId: string | null = null

export function useRole() {
  const { user, loading: authLoading } = useAuth()

  // If same user, start from cache immediately (no flicker / redirect race)
  const [userRole, setUserRole] = useState<UserRole | null>(
    () => (user?.id === cachedUserId && cachedRole !== undefined ? cachedRole : null),
  )
  const [loading, setLoading] = useState(true) // always start loading until we confirm

  useEffect(() => {
    // Auth still resolving — don't do anything yet
    if (authLoading) return

    // User is definitively signed out
    if (!user) {
      cachedRole = undefined
      cachedUserId = null
      setUserRole(null)
      setLoading(false)
      return
    }

    // Already cached for this user — use it immediately
    if (user.id === cachedUserId && cachedRole !== undefined) {
      setUserRole(cachedRole)
      setLoading(false)
      return
    }

    // Fetch from DB
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

      cachedRole = data ?? null
      cachedUserId = user.id
      setUserRole(data ?? null)
      setLoading(false)
    }

    fetchRole()
  }, [user, authLoading])

  return {
    userRole,
    role: userRole?.role ?? null,
    displayName: userRole?.display_name ?? user?.email ?? '',
    companyAccess: userRole?.company_access ?? null,
    isAdmin: userRole?.role === 'admin',
    isViewer: userRole?.role === 'viewer',
    forcePasswordReset: userRole?.force_password_reset ?? false,
    loading: authLoading || loading,
  }
}

// Call this after DB update to force a fresh fetch on next render
export function invalidateRoleCache() {
  cachedRole = undefined
  cachedUserId = null
}
