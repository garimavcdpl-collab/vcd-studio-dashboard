import { useMemo } from 'react'
import { useQuery } from '@tanstack/react-query'
import { useNavigate } from 'react-router-dom'
import {
  AreaChart,
  Area,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Legend,
} from 'recharts'
import {
  IndianRupee,
  Wallet,
  AlertCircle,
  TrendingDown,
  TrendingUp,
  FolderOpen,
  Bell,
  FileText,
  Clock,
  ArrowRight,
  CalendarClock,
  ChevronRight,
} from 'lucide-react'
import { format, subMonths, startOfMonth, differenceInDays } from 'date-fns'

import { supabase } from '@/lib/supabase'
import { formatINR } from '@/lib/format'
import { useCompany } from '@/hooks/useCompany'
import { useNudges } from '@/hooks/useNudges'
import { KPICard } from '@/components/shared/KPICard'
import { PaymentStatusBadge } from '@/components/shared/StatusBadge'
import { Skeleton } from '@/components/ui/skeleton'
import { Badge } from '@/components/ui/badge'
import { cn } from '@/lib/utils'

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

const TDS_THRESHOLD = 0.90

function isEffectivelyPaid(lumpsum: number, paid: number): boolean {
  if (lumpsum <= 0) return true
  return paid >= lumpsum * TDS_THRESHOLD
}

function getIndianFY() {
  const now = new Date()
  const month = now.getMonth()
  const year = now.getFullYear()
  const fyStartYear = month >= 3 ? year : year - 1
  const fyStart = new Date(fyStartYear, 3, 1)
  return {
    label: `FY ${fyStartYear}-${String(fyStartYear + 1).slice(2)}`,
    start: fyStart.toISOString(),
  }
}

const { label: fyLabel, start: yearStart } = getIndianFY()

const SEVERITY_CONFIG = {
  red: { dot: 'bg-red-500', ring: 'ring-red-500/30', bg: 'bg-red-500/10' },
  amber: { dot: 'bg-amber-400', ring: 'ring-amber-400/30', bg: 'bg-amber-400/10' },
  green: { dot: 'bg-emerald-500', ring: 'ring-emerald-500/30', bg: 'bg-emerald-500/10' },
}

const TYPE_LABEL: Record<string, { label: string; color: string }> = {
  invoice_due:      { label: 'Invoice Due',  color: 'bg-blue-500/15 text-blue-400 border-blue-500/20' },
  awaiting_payment: { label: 'Awaiting ₹',   color: 'bg-red-500/15 text-red-400 border-red-500/20' },
  deliver_next:     { label: 'Deliver Next', color: 'bg-emerald-500/15 text-emerald-400 border-emerald-500/20' },
  short_payment:    { label: 'Short Pay',    color: 'bg-amber-500/15 text-amber-400 border-amber-500/20' },
}

// ---------------------------------------------------------------------------
// Small UI helpers
// ---------------------------------------------------------------------------

function SectionCard({
  children,
  className,
}: {
  children: React.ReactNode
  className?: string
}) {
  return (
    <div className={cn('rounded-xl border border-border/60 bg-card shadow-sm overflow-hidden', className)}>
      {children}
    </div>
  )
}

function SectionHeader({
  icon: Icon,
  title,
  subtitle,
  action,
}: {
  icon: React.ElementType
  title: string
  subtitle?: string
  action?: React.ReactNode
}) {
  return (
    <div className="flex items-center justify-between px-5 pt-5 pb-3">
      <div className="flex items-center gap-3">
        <div className="h-8 w-8 rounded-lg bg-primary/10 flex items-center justify-center">
          <Icon className="h-4 w-4 text-primary" />
        </div>
        <div>
          <h2 className="text-sm font-semibold text-foreground">{title}</h2>
          {subtitle && <p className="text-xs text-muted-foreground">{subtitle}</p>}
        </div>
      </div>
      {action}
    </div>
  )
}

// ---------------------------------------------------------------------------
// Main Component
// ---------------------------------------------------------------------------

export default function DashboardPage() {
  const { selectedCompanyId } = useCompany()
  const { nudges, totalCount } = useNudges()
  const navigate = useNavigate()

  // ── KPI: Revenue YTD ──────────────────────────────────────────────────────

  const { data: revenueYTD, isLoading: loadingRevenue } = useQuery({
    queryKey: ['kpi-revenue-ytd', selectedCompanyId],
    queryFn: async () => {
      let query = supabase
        .from('fee_stages')
        .select('amount_paid, projects!inner(company_id)')
        .gte('payment_received_date', yearStart)

      if (selectedCompanyId) query = query.eq('projects.company_id', selectedCompanyId)

      const { data, error } = await query
      if (error) throw error
      return (data ?? []).reduce((sum, row) => sum + (row.amount_paid ?? 0), 0)
    },
  })

  // ── KPI: Outstanding ──────────────────────────────────────────────────────

  const { data: outstanding, isLoading: loadingOutstanding } = useQuery({
    queryKey: ['kpi-outstanding', selectedCompanyId],
    queryFn: async () => {
      let query = supabase
        .from('fee_stages')
        .select('lumpsum_amount, amount_paid, payment_status, projects!inner(company_id)')
        .neq('payment_status', 'paid')

      if (selectedCompanyId) query = query.eq('projects.company_id', selectedCompanyId)

      const { data, error } = await query
      if (error) throw error
      return (data ?? []).reduce((sum, row) => {
        const lumpsum = row.lumpsum_amount ?? 0
        const paid = row.amount_paid ?? 0
        if (isEffectivelyPaid(lumpsum, paid)) return sum
        return sum + (lumpsum - paid)
      }, 0)
    },
  })

  // ── KPI: Expenses YTD ────────────────────────────────────────────────────

  const { data: expensesYTD, isLoading: loadingExpenses } = useQuery({
    queryKey: ['kpi-expenses-ytd', selectedCompanyId],
    queryFn: async () => {
      let query = supabase.from('expenses').select('amount').gte('date', yearStart)

      if (selectedCompanyId) query = query.eq('company_id', selectedCompanyId)

      const { data, error } = await query
      if (error) throw error
      return (data ?? []).reduce((sum, row) => sum + (row.amount ?? 0), 0)
    },
  })

  // ── KPI: Active Projects ──────────────────────────────────────────────────

  const { data: activeProjects, isLoading: loadingProjects } = useQuery({
    queryKey: ['kpi-active-projects', selectedCompanyId],
    queryFn: async () => {
      let query = supabase
        .from('fee_stages')
        .select('project_id, lumpsum_amount, amount_paid, projects!inner(company_id)')
        .neq('payment_status', 'paid')

      if (selectedCompanyId) query = query.eq('projects.company_id', selectedCompanyId)

      const { data, error } = await query
      if (error) throw error
      const ids = new Set<string>()
      for (const row of data ?? []) {
        if (!isEffectivelyPaid(row.lumpsum_amount ?? 0, row.amount_paid ?? 0) && row.project_id) {
          ids.add(row.project_id)
        }
      }
      return ids.size
    },
  })

  const netProfit = (revenueYTD ?? 0) - (expensesYTD ?? 0)
  const loadingNet = loadingRevenue || loadingExpenses

  // ── Chart: Monthly Revenue vs Expenses ────────────────────────────────────

  const { data: monthlyRevenue, isLoading: loadingMonthlyRevenue } = useQuery({
    queryKey: ['chart-monthly-revenue', selectedCompanyId],
    queryFn: async () => {
      const now = new Date()
      let query = supabase
        .from('fee_stages')
        .select('amount_paid, payment_received_date, projects!inner(company_id)')
        .gte('payment_received_date', subMonths(startOfMonth(now), 11).toISOString())
        .not('payment_received_date', 'is', null)

      if (selectedCompanyId) query = query.eq('projects.company_id', selectedCompanyId)

      const { data, error } = await query
      if (error) throw error
      return data ?? []
    },
  })

  const { data: monthlyExpenses, isLoading: loadingMonthlyExpenses } = useQuery({
    queryKey: ['chart-monthly-expenses', selectedCompanyId],
    queryFn: async () => {
      const now = new Date()
      let query = supabase
        .from('expenses')
        .select('amount, date')
        .gte('date', subMonths(startOfMonth(now), 11).toISOString())

      if (selectedCompanyId) query = query.eq('company_id', selectedCompanyId)

      const { data, error } = await query
      if (error) throw error
      return data ?? []
    },
  })

  const areaChartData = useMemo(() => {
    const now = new Date()
    const months: { key: string; label: string; revenue: number; expenses: number }[] = []

    for (let i = 11; i >= 0; i--) {
      const month = subMonths(now, i)
      months.push({ key: format(month, 'yyyy-MM'), label: format(month, 'MMM yy'), revenue: 0, expenses: 0 })
    }

    for (const row of monthlyRevenue ?? []) {
      if (!row.payment_received_date) continue
      const bucket = months.find((m) => m.key === row.payment_received_date!.slice(0, 7))
      if (bucket) bucket.revenue += row.amount_paid ?? 0
    }

    for (const row of monthlyExpenses ?? []) {
      if (!row.date) continue
      const bucket = months.find((m) => m.key === row.date!.slice(0, 7))
      if (bucket) bucket.expenses += row.amount ?? 0
    }

    return months
  }, [monthlyRevenue, monthlyExpenses])

  const loadingAreaChart = loadingMonthlyRevenue || loadingMonthlyExpenses

  // ── Recent Invoices ────────────────────────────────────────────────────────

  const { data: recentInvoices, isLoading: loadingRecentInvoices } = useQuery({
    queryKey: ['recent-invoices', selectedCompanyId],
    queryFn: async () => {
      let query = supabase
        .from('fee_stages')
        .select('id, stage_name, lumpsum_amount, invoice_number, invoice_date, payment_status, amount_paid, projects!inner(id, project_name, company_id)')
        .not('invoice_date', 'is', null)
        .order('invoice_date', { ascending: false })
        .limit(12)

      if (selectedCompanyId) query = query.eq('projects.company_id', selectedCompanyId)

      const { data, error } = await query
      if (error) throw error
      return data ?? []
    },
  })

  // ── Upcoming Invoices ─────────────────────────────────────────────────────

  const { data: upcomingInvoices, isLoading: loadingUpcoming } = useQuery({
    queryKey: ['upcoming-invoices', selectedCompanyId],
    queryFn: async () => {
      let query = supabase
        .from('fee_stages')
        .select('id, project_id, stage_name, stage_number, lumpsum_amount, invoice_date, payment_status, amount_paid, projects!inner(id, project_name, company_id)')
        .order('stage_number', { ascending: true })

      if (selectedCompanyId) query = query.eq('projects.company_id', selectedCompanyId)

      const { data, error } = await query
      if (error) throw error
      if (!data) return []

      const byProject = new Map<string, typeof data>()
      for (const s of data) {
        const pid = s.project_id
        if (!pid) continue
        if (!byProject.has(pid)) byProject.set(pid, [])
        byProject.get(pid)!.push(s)
      }

      const now = new Date()
      const upcoming: Array<{
        id: string
        projectName: string
        projectId: string
        stageName: string
        amount: number
        daysUntilDue: number
        lastInvoiceDate: string | null
      }> = []

      for (const [, stages] of byProject) {
        const sorted = stages.sort((a, b) => a.stage_number - b.stage_number)
        for (let i = 0; i < sorted.length; i++) {
          const stage = sorted[i]
          if (stage.invoice_date || stage.payment_status === 'paid') continue
          if (isEffectivelyPaid(stage.lumpsum_amount ?? 0, stage.amount_paid ?? 0)) continue

          let lastInvoiced: string | null = null
          for (let j = i - 1; j >= 0; j--) {
            if (sorted[j].invoice_date) { lastInvoiced = sorted[j].invoice_date; break }
          }

          let daysUntilDue = 0
          if (lastInvoiced && typeof lastInvoiced === 'string') {
            const daysSince = differenceInDays(now, new Date(lastInvoiced))
            daysUntilDue = daysSince >= 20 ? 0 : 20 - daysSince
          }

          const project = stage.projects as any
          upcoming.push({
            id: stage.id,
            projectName: project?.project_name ?? '',
            projectId: project?.id ?? '',
            stageName: stage.stage_name,
            amount: stage.lumpsum_amount ?? 0,
            daysUntilDue,
            lastInvoiceDate: lastInvoiced,
          })
        }
      }

      return upcoming
        .sort((a, b) => a.daysUntilDue - b.daysUntilDue || b.amount - a.amount)
        .slice(0, 12)
    },
  })

  // ── Render ─────────────────────────────────────────────────────────────────

  return (
    <div className="space-y-6">
      {/* Page Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold tracking-tight text-foreground">Dashboard</h1>
          <p className="text-sm text-muted-foreground mt-0.5">
            Financial overview &mdash; <span className="text-primary font-medium">{fyLabel}</span>
          </p>
        </div>
        <div className="hidden sm:flex items-center gap-2 text-xs text-muted-foreground bg-muted/50 border border-border/60 px-3 py-1.5 rounded-lg">
          <span className="h-1.5 w-1.5 rounded-full bg-emerald-400 animate-pulse" />
          Live data
        </div>
      </div>

      {/* KPI Cards */}
      <div className="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-6 gap-3">
        <KPICard
          title="Revenue YTD"
          value={formatINR(revenueYTD)}
          icon={IndianRupee}
          loading={loadingRevenue}
          variant="blue"
          subtitle={fyLabel}
        />
        <KPICard
          title="Collected YTD"
          value={formatINR(revenueYTD)}
          icon={Wallet}
          loading={loadingRevenue}
          variant="green"
        />
        <KPICard
          title="Outstanding"
          value={formatINR(outstanding)}
          icon={AlertCircle}
          loading={loadingOutstanding}
          variant="red"
        />
        <KPICard
          title="Expenses YTD"
          value={formatINR(expensesYTD)}
          icon={TrendingDown}
          loading={loadingExpenses}
          variant="amber"
        />
        <KPICard
          title="Net Profit YTD"
          value={formatINR(netProfit)}
          icon={TrendingUp}
          trendUp={netProfit >= 0}
          loading={loadingNet}
          variant={netProfit >= 0 ? 'teal' : 'red'}
        />
        <KPICard
          title="Active Projects"
          value={String(activeProjects ?? 0)}
          icon={FolderOpen}
          loading={loadingProjects}
          mono={false}
          variant="indigo"
        />
      </div>

      {/* Row 2: Recent Invoices + Upcoming Invoices */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
        {/* Recent Invoices Raised */}
        <SectionCard>
          <SectionHeader
            icon={FileText}
            title="Recent Invoices Raised"
            subtitle="Last 12 invoices"
            action={
              <button
                onClick={() => navigate('/invoicing')}
                className="flex items-center gap-1 text-xs text-primary hover:text-primary/80 font-medium transition-colors"
              >
                View all <ArrowRight className="h-3 w-3" />
              </button>
            }
          />
          <div className="px-3 pb-4">
            {loadingRecentInvoices ? (
              <div className="space-y-2">
                {Array.from({ length: 5 }).map((_, i) => <Skeleton key={i} className="h-14 w-full rounded-lg" />)}
              </div>
            ) : !recentInvoices || recentInvoices.length === 0 ? (
              <div className="flex items-center justify-center h-[180px] text-sm text-muted-foreground">
                No invoices raised yet
              </div>
            ) : (
              <div className="space-y-0.5 max-h-[380px] overflow-y-auto">
                {recentInvoices.map((inv) => {
                  const project = inv.projects as any
                  const daysAgo = inv.invoice_date
                    ? differenceInDays(new Date(), new Date(inv.invoice_date))
                    : null
                  const isRecent = daysAgo !== null && daysAgo <= 7
                  return (
                    <button
                      key={inv.id}
                      onClick={() => navigate(`/projects/${project?.id}`)}
                      className="w-full flex items-center gap-3 rounded-lg px-3 py-2.5 text-left transition-all hover:bg-muted/60 group"
                    >
                      <div className="h-8 w-8 rounded-lg bg-blue-500/10 border border-blue-500/20 flex items-center justify-center shrink-0">
                        <FileText className="h-3.5 w-3.5 text-blue-400" />
                      </div>
                      <div className="min-w-0 flex-1">
                        <p className="text-xs font-semibold truncate text-foreground group-hover:text-primary transition-colors">
                          {project?.project_name}
                        </p>
                        <p className="text-[10px] text-muted-foreground truncate">
                          {inv.stage_name}
                          {inv.invoice_number ? ` • #${inv.invoice_number}` : ''}
                        </p>
                      </div>
                      <div className="text-right shrink-0 space-y-0.5">
                        <p className="text-xs font-mono font-bold text-foreground">{formatINR(inv.lumpsum_amount)}</p>
                        <div className="flex items-center gap-1.5 justify-end">
                          <PaymentStatusBadge status={inv.payment_status as any} />
                          {daysAgo !== null && (
                            <span className={`text-[9px] font-medium ${isRecent ? 'text-emerald-400' : 'text-muted-foreground'}`}>
                              {daysAgo === 0 ? 'Today' : `${daysAgo}d ago`}
                            </span>
                          )}
                        </div>
                      </div>
                    </button>
                  )
                })}
              </div>
            )}
          </div>
        </SectionCard>

        {/* Upcoming Invoices */}
        <SectionCard>
          <SectionHeader
            icon={CalendarClock}
            title="Upcoming Invoices"
            subtitle="Stages ready to invoice"
            action={
              <span className="text-[10px] text-muted-foreground bg-muted/60 border border-border/60 px-2 py-1 rounded-md">
                20d after last invoice
              </span>
            }
          />
          <div className="px-3 pb-4">
            {loadingUpcoming ? (
              <div className="space-y-2">
                {Array.from({ length: 5 }).map((_, i) => <Skeleton key={i} className="h-14 w-full rounded-lg" />)}
              </div>
            ) : !upcomingInvoices || upcomingInvoices.length === 0 ? (
              <div className="flex items-center justify-center h-[180px] text-sm text-muted-foreground">
                No upcoming invoices
              </div>
            ) : (
              <div className="space-y-0.5 max-h-[380px] overflow-y-auto">
                {upcomingInvoices.map((inv) => {
                  const isDue = inv.daysUntilDue === 0
                  return (
                    <button
                      key={inv.id}
                      onClick={() => navigate(`/projects/${inv.projectId}`)}
                      className="w-full flex items-center gap-3 rounded-lg px-3 py-2.5 text-left transition-all hover:bg-muted/60 group"
                    >
                      <div className={`h-8 w-8 rounded-lg flex items-center justify-center shrink-0 border ${
                        isDue
                          ? 'bg-amber-500/10 border-amber-500/20'
                          : 'bg-muted/60 border-border/60'
                      }`}>
                        <Clock className={`h-3.5 w-3.5 ${isDue ? 'text-amber-400' : 'text-muted-foreground'}`} />
                      </div>
                      <div className="min-w-0 flex-1">
                        <p className="text-xs font-semibold truncate text-foreground group-hover:text-primary transition-colors">
                          {inv.projectName}
                        </p>
                        <p className="text-[10px] text-muted-foreground truncate">{inv.stageName}</p>
                      </div>
                      <div className="text-right shrink-0 space-y-0.5">
                        <p className="text-xs font-mono font-bold text-foreground">{formatINR(inv.amount)}</p>
                        <span className={`inline-block text-[9px] font-bold px-1.5 py-0.5 rounded border ${
                          isDue
                            ? 'bg-amber-500/10 text-amber-400 border-amber-500/20'
                            : 'bg-muted/60 text-muted-foreground border-border/60'
                        }`}>
                          {isDue ? '⚡ Due now' : `In ${inv.daysUntilDue}d`}
                        </span>
                      </div>
                    </button>
                  )
                })}
              </div>
            )}
          </div>
        </SectionCard>
      </div>

      {/* Row 3: Chart + Nudges */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
        {/* Revenue vs Expenses Chart */}
        <SectionCard className="lg:col-span-2">
          <SectionHeader
            icon={TrendingUp}
            title="Revenue vs Expenses"
            subtitle="Last 12 months"
          />
          <div className="px-5 pb-5">
            {loadingAreaChart ? (
              <Skeleton className="h-[260px] w-full rounded-lg" />
            ) : (
              <ResponsiveContainer width="100%" height={260}>
                <AreaChart data={areaChartData} margin={{ top: 4, right: 4, left: 0, bottom: 0 }}>
                  <defs>
                    <linearGradient id="fillRevenue" x1="0" y1="0" x2="0" y2="1">
                      <stop offset="5%" stopColor="#3b82f6" stopOpacity={0.35} />
                      <stop offset="95%" stopColor="#3b82f6" stopOpacity={0.02} />
                    </linearGradient>
                    <linearGradient id="fillExpenses" x1="0" y1="0" x2="0" y2="1">
                      <stop offset="5%" stopColor="#f43f5e" stopOpacity={0.35} />
                      <stop offset="95%" stopColor="#f43f5e" stopOpacity={0.02} />
                    </linearGradient>
                  </defs>
                  <CartesianGrid strokeDasharray="3 3" stroke="hsl(var(--border))" strokeOpacity={0.5} />
                  <XAxis
                    dataKey="label"
                    tick={{ fontSize: 10, fill: 'hsl(var(--muted-foreground))' }}
                    tickLine={false}
                    axisLine={false}
                  />
                  <YAxis
                    tickFormatter={(v: number) =>
                      v >= 100000 ? `${(v / 100000).toFixed(1)}L` : v >= 1000 ? `${(v / 1000).toFixed(0)}K` : String(v)
                    }
                    tick={{ fontSize: 10, fill: 'hsl(var(--muted-foreground))' }}
                    tickLine={false}
                    axisLine={false}
                    width={44}
                  />
                  <Tooltip
                    formatter={(value) => [formatINR(Number(value)), '']}
                    contentStyle={{
                      borderRadius: '10px',
                      border: '1px solid hsl(var(--border))',
                      backgroundColor: 'hsl(var(--card))',
                      boxShadow: '0 10px 25px rgba(0,0,0,0.3)',
                      fontSize: '12px',
                    }}
                    labelStyle={{ color: 'hsl(var(--foreground))', fontWeight: 600 }}
                  />
                  <Legend
                    iconType="circle"
                    iconSize={8}
                    formatter={(value) => (
                      <span style={{ fontSize: '11px', color: 'hsl(var(--muted-foreground))' }}>{value}</span>
                    )}
                  />
                  <Area
                    type="monotone"
                    dataKey="revenue"
                    name="Revenue"
                    stroke="#3b82f6"
                    fill="url(#fillRevenue)"
                    strokeWidth={2}
                    dot={false}
                    activeDot={{ r: 4, strokeWidth: 0, fill: '#3b82f6' }}
                  />
                  <Area
                    type="monotone"
                    dataKey="expenses"
                    name="Expenses"
                    stroke="#f43f5e"
                    fill="url(#fillExpenses)"
                    strokeWidth={2}
                    dot={false}
                    activeDot={{ r: 4, strokeWidth: 0, fill: '#f43f5e' }}
                  />
                </AreaChart>
              </ResponsiveContainer>
            )}
          </div>
        </SectionCard>

        {/* Nudges Panel */}
        <SectionCard className="lg:col-span-1 flex flex-col" id="nudges-panel">
          <SectionHeader
            icon={Bell}
            title="Action Items"
            subtitle="Nudges needing attention"
            action={
              totalCount > 0 ? (
                <span className="flex h-6 min-w-6 items-center justify-center rounded-full bg-red-500/15 border border-red-500/30 text-[10px] font-bold text-red-400 px-1.5">
                  {totalCount}
                </span>
              ) : undefined
            }
          />
          <div className="flex-1 overflow-hidden px-3 pb-4">
            {nudges.length === 0 ? (
              <div className="flex flex-col items-center justify-center h-[220px] gap-2">
                <div className="h-10 w-10 rounded-full bg-emerald-500/10 flex items-center justify-center">
                  <Bell className="h-5 w-5 text-emerald-400" />
                </div>
                <p className="text-sm text-muted-foreground">All clear — no nudges</p>
              </div>
            ) : (
              <div className="space-y-1 max-h-[280px] overflow-y-auto pr-1">
                {nudges.map((nudge) => {
                  const sev = SEVERITY_CONFIG[nudge.severity]
                  const typeInfo = TYPE_LABEL[nudge.type] ?? { label: nudge.type, color: '' }
                  return (
                    <button
                      key={nudge.id}
                      onClick={() => navigate(`/projects/${nudge.projectId}`)}
                      className="w-full flex items-start gap-2.5 rounded-lg p-2.5 text-left transition-all hover:bg-muted/60 group"
                    >
                      <div className={`mt-1 h-2 w-2 shrink-0 rounded-full ${sev.dot}`} />
                      <div className="min-w-0 flex-1">
                        <p className="text-xs font-semibold truncate text-foreground group-hover:text-primary transition-colors">
                          {nudge.projectName}
                        </p>
                        <p className="text-[10px] text-muted-foreground truncate">{nudge.stageName}</p>
                        <div className="mt-1 flex items-center gap-1.5 flex-wrap">
                          <span className="text-[11px] font-mono font-bold text-foreground">
                            {formatINR(nudge.amount)}
                          </span>
                          {nudge.daysSince > 0 && (
                            <span className={`text-[9px] font-semibold px-1.5 py-0.5 rounded border ${
                              nudge.daysSince > 30
                                ? 'bg-red-500/10 text-red-400 border-red-500/20'
                                : nudge.daysSince > 7
                                  ? 'bg-amber-500/10 text-amber-400 border-amber-500/20'
                                  : 'bg-blue-500/10 text-blue-400 border-blue-500/20'
                            }`}>
                              {nudge.daysSince}d ago
                            </span>
                          )}
                          <span className={`text-[9px] font-semibold px-1.5 py-0.5 rounded border ${typeInfo.color}`}>
                            {typeInfo.label}
                          </span>
                        </div>
                      </div>
                      <ChevronRight className="h-3 w-3 text-muted-foreground/40 shrink-0 mt-1 group-hover:text-muted-foreground transition-colors" />
                    </button>
                  )
                })}
              </div>
            )}
          </div>
        </SectionCard>
      </div>

    </div>
  )
}
