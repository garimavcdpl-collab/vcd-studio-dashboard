import type { LucideIcon } from 'lucide-react'
import { Skeleton } from '@/components/ui/skeleton'

type KPIVariant = 'blue' | 'green' | 'red' | 'amber' | 'purple' | 'teal' | 'indigo' | 'default'

interface KPICardProps {
  title: string
  value: string
  icon: LucideIcon
  trend?: string
  trendUp?: boolean
  loading?: boolean
  mono?: boolean
  variant?: KPIVariant
  subtitle?: string
}

const VARIANT_STYLES: Record<KPIVariant, {
  bg: string
  iconBg: string
  iconColor: string
  border: string
  accent: string
}> = {
  blue: {
    bg: 'from-blue-600/10 to-blue-600/5 dark:from-blue-500/15 dark:to-blue-500/5',
    iconBg: 'bg-blue-600/15 dark:bg-blue-500/20',
    iconColor: 'text-blue-600 dark:text-blue-400',
    border: 'border-blue-500/20',
    accent: 'text-blue-600 dark:text-blue-400',
  },
  green: {
    bg: 'from-emerald-600/10 to-emerald-600/5 dark:from-emerald-500/15 dark:to-emerald-500/5',
    iconBg: 'bg-emerald-600/15 dark:bg-emerald-500/20',
    iconColor: 'text-emerald-600 dark:text-emerald-400',
    border: 'border-emerald-500/20',
    accent: 'text-emerald-600 dark:text-emerald-400',
  },
  red: {
    bg: 'from-red-600/10 to-red-600/5 dark:from-red-500/15 dark:to-red-500/5',
    iconBg: 'bg-red-600/15 dark:bg-red-500/20',
    iconColor: 'text-red-600 dark:text-red-400',
    border: 'border-red-500/20',
    accent: 'text-red-600 dark:text-red-400',
  },
  amber: {
    bg: 'from-amber-600/10 to-amber-600/5 dark:from-amber-500/15 dark:to-amber-500/5',
    iconBg: 'bg-amber-600/15 dark:bg-amber-500/20',
    iconColor: 'text-amber-600 dark:text-amber-400',
    border: 'border-amber-500/20',
    accent: 'text-amber-600 dark:text-amber-400',
  },
  purple: {
    bg: 'from-purple-600/10 to-purple-600/5 dark:from-purple-500/15 dark:to-purple-500/5',
    iconBg: 'bg-purple-600/15 dark:bg-purple-500/20',
    iconColor: 'text-purple-600 dark:text-purple-400',
    border: 'border-purple-500/20',
    accent: 'text-purple-600 dark:text-purple-400',
  },
  teal: {
    bg: 'from-teal-600/10 to-teal-600/5 dark:from-teal-500/15 dark:to-teal-500/5',
    iconBg: 'bg-teal-600/15 dark:bg-teal-500/20',
    iconColor: 'text-teal-600 dark:text-teal-400',
    border: 'border-teal-500/20',
    accent: 'text-teal-600 dark:text-teal-400',
  },
  indigo: {
    bg: 'from-indigo-600/10 to-indigo-600/5 dark:from-indigo-500/15 dark:to-indigo-500/5',
    iconBg: 'bg-indigo-600/15 dark:bg-indigo-500/20',
    iconColor: 'text-indigo-600 dark:text-indigo-400',
    border: 'border-indigo-500/20',
    accent: 'text-indigo-600 dark:text-indigo-400',
  },
  default: {
    bg: 'from-slate-600/5 to-transparent dark:from-slate-500/10 dark:to-slate-500/5',
    iconBg: 'bg-slate-200 dark:bg-slate-700',
    iconColor: 'text-slate-600 dark:text-slate-300',
    border: 'border-border',
    accent: 'text-muted-foreground',
  },
}

export function KPICard({
  title,
  value,
  icon: Icon,
  trend,
  trendUp,
  loading,
  mono = true,
  variant = 'default',
  subtitle,
}: KPICardProps) {
  const styles = VARIANT_STYLES[variant]

  if (loading) {
    return (
      <div className={`relative overflow-hidden rounded-xl border ${styles.border} bg-card p-5`}>
        <div className="flex items-start justify-between">
          <div className="space-y-2 flex-1">
            <Skeleton className="h-3.5 w-20" />
            <Skeleton className="h-7 w-28" />
            <Skeleton className="h-3 w-16" />
          </div>
          <Skeleton className="h-10 w-10 rounded-lg" />
        </div>
      </div>
    )
  }

  return (
    <div className={`relative overflow-hidden rounded-xl border ${styles.border} bg-gradient-to-br bg-card ${styles.bg} p-5 transition-all duration-200 hover:shadow-lg hover:-translate-y-0.5 cursor-default group`}>
      {/* Subtle gradient overlay */}
      <div className={`absolute inset-0 bg-gradient-to-br ${styles.bg} opacity-60 pointer-events-none`} />

      <div className="relative flex items-start justify-between gap-3">
        <div className="min-w-0 flex-1">
          <p className="text-xs font-semibold uppercase tracking-wider text-muted-foreground mb-2">
            {title}
          </p>
          <p className={`text-2xl font-bold leading-tight ${mono ? 'font-mono' : ''} text-foreground`}>
            {value}
          </p>
          {(trend || subtitle) && (
            <p className={`text-xs mt-1.5 font-medium ${
              trend
                ? (trendUp ? 'text-emerald-600 dark:text-emerald-400' : 'text-red-500 dark:text-red-400')
                : 'text-muted-foreground'
            }`}>
              {trend ? `${trendUp ? '▲' : '▼'} ${trend}` : subtitle}
            </p>
          )}
        </div>
        <div className={`h-10 w-10 rounded-xl ${styles.iconBg} flex items-center justify-center shrink-0`}>
          <Icon className={`h-5 w-5 ${styles.iconColor}`} />
        </div>
      </div>
    </div>
  )
}
