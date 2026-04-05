import { Badge } from '@/components/ui/badge'
import type { PaymentStatus, ProjectStatus } from '@/types/database'

const projectStatusConfig: Record<ProjectStatus, { label: string; variant: 'success' | 'warning' | 'info' | 'destructive' | 'secondary' }> = {
  active: { label: 'Active', variant: 'info' },
  'on-hold': { label: 'On Hold', variant: 'warning' },
  completed: { label: 'Completed', variant: 'success' },
  cancelled: { label: 'Cancelled', variant: 'destructive' },
}

const paymentStatusConfig: Record<PaymentStatus, { label: string; variant: 'success' | 'warning' | 'info' | 'destructive' | 'secondary' }> = {
  paid: { label: 'Paid', variant: 'success' },
  invoiced: { label: 'Invoiced', variant: 'info' },
  partial: { label: 'Partial', variant: 'warning' },
  pending: { label: 'Pending', variant: 'secondary' },
}

export function ProjectStatusBadge({ status }: { status: ProjectStatus | null }) {
  if (!status) return null
  const config = projectStatusConfig[status]
  return <Badge variant={config.variant}>{config.label}</Badge>
}

export function PaymentStatusBadge({ status }: { status: PaymentStatus }) {
  const config = paymentStatusConfig[status]
  return <Badge variant={config.variant}>{config.label}</Badge>
}
