import type { ReactNode } from 'react'
import { useRole } from '@/hooks/useRole'

interface RequiresAdminProps {
  children: ReactNode
  fallback?: ReactNode
}

export function RequiresAdmin({ children, fallback = null }: RequiresAdminProps) {
  const { isAdmin, loading } = useRole()

  if (loading) return null
  if (!isAdmin) return <>{fallback}</>
  return <>{children}</>
}
