import { useState, useMemo } from 'react'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import {
  useReactTable,
  getCoreRowModel,
  getSortedRowModel,
  flexRender,
  type ColumnDef,
  type SortingState,
} from '@tanstack/react-table'
import { useForm, Controller } from 'react-hook-form'
import {
  LineChart,
  Line,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from 'recharts'
import { format, startOfYear, endOfYear, getYear } from 'date-fns'

import { supabase } from '@/lib/supabase'
import { formatINR } from '@/lib/format'
import { useCompany } from '@/hooks/useCompany'
import { useRole } from '@/hooks/useRole'
import { logAudit } from '@/lib/audit'

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
  DialogDescription,
} from '@/components/ui/dialog'
import { Skeleton } from '@/components/ui/skeleton'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { Textarea } from '@/components/ui/textarea'
import { Badge } from '@/components/ui/badge'
import { Checkbox } from '@/components/ui/checkbox'

import { KPICard } from '@/components/shared/KPICard'
import { RequiresAdmin } from '@/components/shared/RequiresAdmin'
import { EmptyState } from '@/components/shared/EmptyState'

import {
  DollarSign,
  TrendingUp,
  BarChart3,
  Calendar,
  Plus,
  Edit2,
  Trash2,
} from 'lucide-react'

import type { Expense, HistoricalFinancial, ExpenseCategory } from '@/types/database'

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const EXPENSE_CATEGORIES: ExpenseCategory[] = [
  'salary',
  'bonus',
  'rent',
  'software',
  'travel',
  'marketing',
  'misc',
]

const CATEGORY_COLORS: Record<ExpenseCategory, string> = {
  salary: '#6366f1',
  bonus: '#f59e0b',
  rent: '#ef4444',
  software: '#10b981',
  travel: '#3b82f6',
  marketing: '#ec4899',
  misc: '#8b5cf6',
}

const CATEGORY_BADGE_VARIANT: Record<ExpenseCategory, 'default' | 'secondary' | 'destructive' | 'outline' | 'success' | 'warning' | 'info'> = {
  salary: 'default',
  bonus: 'warning',
  rent: 'destructive',
  software: 'success',
  travel: 'info',
  marketing: 'secondary',
  misc: 'outline',
}

const MONTH_NAMES = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
]

// ---------------------------------------------------------------------------
// Form types
// ---------------------------------------------------------------------------

interface ExpenseFormData {
  category: ExpenseCategory
  description: string
  amount: number
  date: string
  staff_name: string
  recurring: boolean
  notes: string
}

interface HistoricalFormData {
  year: number
  total_revenue: number
  total_expenses: number
  total_salaries: number
  total_bonuses: number
  total_reimbursables: number
  net_profit: number
  project_count: number
  notes: string
}

// ---------------------------------------------------------------------------
// Main component
// ---------------------------------------------------------------------------

export function FinancialsPage() {
  const [activeTab, setActiveTab] = useState('current')

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-bold tracking-tight">Financials</h1>
        <p className="text-muted-foreground">
          Track expenses, salaries, and historical financial performance.
        </p>
      </div>

      <Tabs value={activeTab} onValueChange={setActiveTab}>
        <TabsList>
          <TabsTrigger value="current">Current Year</TabsTrigger>
          <TabsTrigger value="historical">Historical (7 Years)</TabsTrigger>
        </TabsList>

        <TabsContent value="current" className="space-y-6 mt-4">
          <CurrentYearTab />
        </TabsContent>

        <TabsContent value="historical" className="space-y-6 mt-4">
          <HistoricalTab />
        </TabsContent>
      </Tabs>
    </div>
  )
}

// ===========================================================================
// SUB-TAB A: Current Year
// ===========================================================================

function CurrentYearTab() {
  const { selectedCompanyId } = useCompany()
  const { isAdmin } = useRole()
  const queryClient = useQueryClient()

  const currentYear = getYear(new Date())
  const yearStart = format(startOfYear(new Date()), 'yyyy-MM-dd')
  const yearEnd = format(endOfYear(new Date()), 'yyyy-MM-dd')

  // ---- state for dialogs ----
  const [expenseDialogOpen, setExpenseDialogOpen] = useState(false)
  const [editingExpense, setEditingExpense] = useState<Expense | null>(null)
  const [deleteConfirmId, setDeleteConfirmId] = useState<string | null>(null)

  // ---- fetch expenses ----
  const {
    data: expenses = [],
    isLoading: loadingExpenses,
  } = useQuery({
    queryKey: ['expenses', selectedCompanyId, currentYear],
    queryFn: async () => {
      if (!selectedCompanyId) return []
      const { data, error } = await supabase
        .from('expenses')
        .select('*')
        .eq('company_id', selectedCompanyId)
        .gte('date', yearStart)
        .lte('date', yearEnd)
        .order('date', { ascending: false })
      if (error) throw error
      return data as Expense[]
    },
    enabled: !!selectedCompanyId,
  })

  // ---- fetch staff ----
  const {
    data: staff = [],
    isLoading: loadingStaff,
  } = useQuery({
    queryKey: ['staff', selectedCompanyId],
    queryFn: async () => {
      if (!selectedCompanyId) return []
      const { data, error } = await supabase
        .from('staff')
        .select('*')
        .eq('company_id', selectedCompanyId)
        .eq('is_active', true)
        .order('name')
      if (error) throw error
      return data
    },
    enabled: !!selectedCompanyId,
  })

  // ---- mutations ----
  const upsertExpense = useMutation({
    mutationFn: async (values: ExpenseFormData & { id?: string }) => {
      const { id, ...rest } = values
      if (id) {
        const { error } = await supabase.from('expenses').update(rest).eq('id', id)
        if (error) throw error
        await logAudit({
          action: 'update_expense',
          entityType: 'expense',
          entityId: id,
          details: rest as unknown as Record<string, unknown>,
        })
      } else {
        const { data, error } = await supabase
          .from('expenses')
          .insert({ ...rest, company_id: selectedCompanyId })
          .select('id')
          .single()
        if (error) throw error
        await logAudit({
          action: 'create_expense',
          entityType: 'expense',
          entityId: data.id,
          details: rest as unknown as Record<string, unknown>,
        })
      }
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['expenses'] })
      setExpenseDialogOpen(false)
      setEditingExpense(null)
    },
  })

  const deleteExpense = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase.from('expenses').delete().eq('id', id)
      if (error) throw error
      await logAudit({
        action: 'delete_expense',
        entityType: 'expense',
        entityId: id,
      })
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['expenses'] })
      setDeleteConfirmId(null)
    },
  })

  // ---- derived data ----
  const totalExpenses = useMemo(
    () => expenses.reduce((sum, e) => sum + (e.amount ?? 0), 0),
    [expenses],
  )

  const totalPayroll = useMemo(
    () => staff.reduce((sum, s) => sum + (s.monthly_salary ?? 0), 0),
    [staff],
  )

  // Monthly breakdown grouped by month and category
  const monthlyBreakdown = useMemo(() => {
    const map: Record<number, Record<ExpenseCategory, number>> = {}
    for (const e of expenses) {
      if (!e.date) continue
      const month = new Date(e.date).getMonth()
      if (!map[month]) {
        map[month] = {} as Record<ExpenseCategory, number>
        for (const cat of EXPENSE_CATEGORIES) map[month][cat] = 0
      }
      const cat = e.category ?? 'misc'
      map[month][cat] += e.amount ?? 0
    }
    return Object.entries(map)
      .sort(([a], [b]) => Number(a) - Number(b))
      .map(([monthIdx, cats]) => ({
        month: MONTH_NAMES[Number(monthIdx)],
        ...cats,
        total: EXPENSE_CATEGORIES.reduce((s, c) => s + (cats[c] ?? 0), 0),
      }))
  }, [expenses])

  // Chart data for stacked bar
  const chartData = useMemo(() => {
    // Ensure all 12 months appear
    return MONTH_NAMES.map((name) => {
      const found = monthlyBreakdown.find((m) => m.month === name)
      const row: Record<string, string | number> = { month: name.slice(0, 3) }
      for (const cat of EXPENSE_CATEGORIES) {
        row[cat] = found ? (found as unknown as Record<string, number>)[cat] ?? 0 : 0
      }
      return row
    })
  }, [monthlyBreakdown])

  // ---- expense table columns ----
  const columns = useMemo<ColumnDef<Expense>[]>(
    () => [
      {
        accessorKey: 'category',
        header: 'Category',
        cell: ({ getValue }) => {
          const cat = getValue<ExpenseCategory | null>()
          if (!cat) return '-'
          return (
            <Badge variant={CATEGORY_BADGE_VARIANT[cat] ?? 'outline'}>
              {cat}
            </Badge>
          )
        },
      },
      { accessorKey: 'description', header: 'Description' },
      {
        accessorKey: 'amount',
        header: 'Amount',
        cell: ({ getValue }) => (
          <span className="font-mono">{formatINR(getValue<number | null>())}</span>
        ),
      },
      {
        accessorKey: 'date',
        header: 'Date',
        cell: ({ getValue }) => {
          const d = getValue<string | null>()
          return d ? format(new Date(d), 'dd MMM yyyy') : '-'
        },
      },
      { accessorKey: 'staff_name', header: 'Staff Name' },
      {
        accessorKey: 'recurring',
        header: 'Recurring',
        cell: ({ getValue }) => (getValue<boolean>() ? 'Yes' : 'No'),
      },
      { accessorKey: 'notes', header: 'Notes' },
      ...(isAdmin
        ? [
            {
              id: 'actions',
              header: 'Actions',
              cell: ({ row }: { row: { original: Expense } }) => (
                <div className="flex items-center gap-2">
                  <Button
                    variant="ghost"
                    size="icon"
                    onClick={() => {
                      setEditingExpense(row.original)
                      setExpenseDialogOpen(true)
                    }}
                  >
                    <Edit2 className="h-4 w-4" />
                  </Button>
                  <Button
                    variant="ghost"
                    size="icon"
                    onClick={() => setDeleteConfirmId(row.original.id)}
                  >
                    <Trash2 className="h-4 w-4 text-destructive" />
                  </Button>
                </div>
              ),
            } satisfies ColumnDef<Expense>,
          ]
        : []),
    ],
    [isAdmin],
  )

  const [sorting, setSorting] = useState<SortingState>([])

  const table = useReactTable({
    data: expenses,
    columns,
    state: { sorting },
    onSortingChange: setSorting,
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
  })

  // ---- handlers ----
  const openAddExpense = () => {
    setEditingExpense(null)
    setExpenseDialogOpen(true)
  }

  // ---- render ----
  return (
    <>
      {/* KPI cards */}
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        <KPICard
          title={`Total Expenses (${currentYear})`}
          value={formatINR(totalExpenses)}
          icon={DollarSign}
          loading={loadingExpenses}
        />
        <KPICard
          title="Monthly Payroll"
          value={formatINR(totalPayroll)}
          icon={TrendingUp}
          loading={loadingStaff}
        />
        <KPICard
          title="Active Staff"
          value={String(staff.length)}
          icon={BarChart3}
          loading={loadingStaff}
          mono={false}
        />
      </div>

      {/* Expenses table */}
      <Card>
        <CardHeader className="flex flex-row items-center justify-between space-y-0">
          <CardTitle>Expenses Log</CardTitle>
          <RequiresAdmin>
            <Button size="sm" onClick={openAddExpense}>
              <Plus className="h-4 w-4 mr-2" /> Add Expense
            </Button>
          </RequiresAdmin>
        </CardHeader>
        <CardContent>
          {loadingExpenses ? (
            <div className="space-y-2">
              {Array.from({ length: 5 }).map((_, i) => (
                <Skeleton key={i} className="h-10 w-full" />
              ))}
            </div>
          ) : expenses.length === 0 ? (
            <EmptyState
              icon={DollarSign}
              title="No expenses recorded"
              description="Start tracking expenses for the current year."
              actionLabel={isAdmin ? '+ Add Expense' : undefined}
              onAction={isAdmin ? openAddExpense : undefined}
            />
          ) : (
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  {table.getHeaderGroups().map((hg) => (
                    <TableRow key={hg.id}>
                      {hg.headers.map((header) => (
                        <TableHead
                          key={header.id}
                          className="cursor-pointer select-none"
                          onClick={header.column.getToggleSortingHandler()}
                        >
                          {flexRender(header.column.columnDef.header, header.getContext())}
                          {{ asc: ' \u2191', desc: ' \u2193' }[header.column.getIsSorted() as string] ?? ''}
                        </TableHead>
                      ))}
                    </TableRow>
                  ))}
                </TableHeader>
                <TableBody>
                  {table.getRowModel().rows.map((row) => (
                    <TableRow key={row.id}>
                      {row.getVisibleCells().map((cell) => (
                        <TableCell key={cell.id}>
                          {flexRender(cell.column.columnDef.cell, cell.getContext())}
                        </TableCell>
                      ))}
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Staff salary tracker */}
      <Card>
        <CardHeader>
          <CardTitle>Staff Salary Tracker</CardTitle>
        </CardHeader>
        <CardContent>
          {loadingStaff ? (
            <div className="space-y-2">
              {Array.from({ length: 3 }).map((_, i) => (
                <Skeleton key={i} className="h-10 w-full" />
              ))}
            </div>
          ) : staff.length === 0 ? (
            <EmptyState
              icon={BarChart3}
              title="No staff found"
              description="Add staff members from the Staff page."
            />
          ) : (
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Name</TableHead>
                    <TableHead>Role</TableHead>
                    <TableHead className="text-right">Monthly Salary</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {staff.map((s) => (
                    <TableRow key={s.id}>
                      <TableCell className="font-medium">{s.name}</TableCell>
                      <TableCell>{s.role ?? '-'}</TableCell>
                      <TableCell className="text-right font-mono">
                        {formatINR(s.monthly_salary)}
                      </TableCell>
                    </TableRow>
                  ))}
                  <TableRow className="font-semibold bg-muted/50">
                    <TableCell colSpan={2}>Total Monthly Payroll</TableCell>
                    <TableCell className="text-right font-mono">
                      {formatINR(totalPayroll)}
                    </TableCell>
                  </TableRow>
                </TableBody>
              </Table>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Monthly breakdown */}
      <Card>
        <CardHeader>
          <CardTitle>Monthly Breakdown by Category</CardTitle>
        </CardHeader>
        <CardContent>
          {loadingExpenses ? (
            <Skeleton className="h-64 w-full" />
          ) : monthlyBreakdown.length === 0 ? (
            <p className="text-sm text-muted-foreground text-center py-8">
              No expense data to display.
            </p>
          ) : (
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Month</TableHead>
                    {EXPENSE_CATEGORIES.map((cat) => (
                      <TableHead key={cat} className="text-right capitalize">
                        {cat}
                      </TableHead>
                    ))}
                    <TableHead className="text-right">Total</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {monthlyBreakdown.map((row) => (
                    <TableRow key={row.month}>
                      <TableCell className="font-medium">{row.month}</TableCell>
                      {EXPENSE_CATEGORIES.map((cat) => (
                        <TableCell key={cat} className="text-right font-mono">
                          {formatINR((row as unknown as Record<string, number>)[cat] ?? 0)}
                        </TableCell>
                      ))}
                      <TableCell className="text-right font-mono font-semibold">
                        {formatINR(row.total)}
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Stacked bar chart */}
      <Card>
        <CardHeader>
          <CardTitle>Monthly Expenses by Category</CardTitle>
        </CardHeader>
        <CardContent>
          {loadingExpenses ? (
            <Skeleton className="h-80 w-full" />
          ) : (
            <ResponsiveContainer width="100%" height={360}>
              <BarChart data={chartData}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="month" />
                <YAxis tickFormatter={(v: number) => formatINR(v)} />
                <Tooltip formatter={(value) => formatINR(Number(value))} />
                <Legend />
                {EXPENSE_CATEGORIES.map((cat) => (
                  <Bar
                    key={cat}
                    dataKey={cat}
                    stackId="expenses"
                    fill={CATEGORY_COLORS[cat]}
                    name={cat.charAt(0).toUpperCase() + cat.slice(1)}
                  />
                ))}
              </BarChart>
            </ResponsiveContainer>
          )}
        </CardContent>
      </Card>

      {/* Expense add/edit dialog */}
      <ExpenseDialog
        open={expenseDialogOpen}
        onOpenChange={(open) => {
          setExpenseDialogOpen(open)
          if (!open) setEditingExpense(null)
        }}
        expense={editingExpense}
        onSubmit={(data) =>
          upsertExpense.mutate({
            ...data,
            id: editingExpense?.id,
          })
        }
        isPending={upsertExpense.isPending}
      />

      {/* Delete confirmation dialog */}
      <Dialog
        open={!!deleteConfirmId}
        onOpenChange={(open) => {
          if (!open) setDeleteConfirmId(null)
        }}
      >
        <DialogContent>
          <DialogHeader>
            <DialogTitle>Delete Expense</DialogTitle>
            <DialogDescription>
              Are you sure you want to delete this expense? This action cannot be undone.
            </DialogDescription>
          </DialogHeader>
          <DialogFooter>
            <Button variant="outline" onClick={() => setDeleteConfirmId(null)}>
              Cancel
            </Button>
            <Button
              variant="destructive"
              disabled={deleteExpense.isPending}
              onClick={() => deleteConfirmId && deleteExpense.mutate(deleteConfirmId)}
            >
              {deleteExpense.isPending ? 'Deleting...' : 'Delete'}
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </>
  )
}

// ---------------------------------------------------------------------------
// Expense Dialog
// ---------------------------------------------------------------------------

function ExpenseDialog({
  open,
  onOpenChange,
  expense,
  onSubmit,
  isPending,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  expense: Expense | null
  onSubmit: (data: ExpenseFormData) => void
  isPending: boolean
}) {
  const { register, handleSubmit, control, reset } = useForm<ExpenseFormData>({
    defaultValues: expense
      ? {
          category: expense.category ?? 'misc',
          description: expense.description ?? '',
          amount: expense.amount ?? 0,
          date: expense.date ?? format(new Date(), 'yyyy-MM-dd'),
          staff_name: expense.staff_name ?? '',
          recurring: expense.recurring ?? false,
          notes: expense.notes ?? '',
        }
      : {
          category: 'misc',
          description: '',
          amount: 0,
          date: format(new Date(), 'yyyy-MM-dd'),
          staff_name: '',
          recurring: false,
          notes: '',
        },
  })

  // Reset form when the dialog opens with new data
  const handleOpenChange = (nextOpen: boolean) => {
    if (nextOpen) {
      reset(
        expense
          ? {
              category: expense.category ?? 'misc',
              description: expense.description ?? '',
              amount: expense.amount ?? 0,
              date: expense.date ?? format(new Date(), 'yyyy-MM-dd'),
              staff_name: expense.staff_name ?? '',
              recurring: expense.recurring ?? false,
              notes: expense.notes ?? '',
            }
          : {
              category: 'misc',
              description: '',
              amount: 0,
              date: format(new Date(), 'yyyy-MM-dd'),
              staff_name: '',
              recurring: false,
              notes: '',
            },
      )
    }
    onOpenChange(nextOpen)
  }

  return (
    <Dialog open={open} onOpenChange={handleOpenChange}>
      <DialogContent className="sm:max-w-lg">
        <DialogHeader>
          <DialogTitle>{expense ? 'Edit Expense' : 'Add Expense'}</DialogTitle>
          <DialogDescription>
            {expense
              ? 'Update the details of this expense entry.'
              : 'Fill in the details to record a new expense.'}
          </DialogDescription>
        </DialogHeader>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          {/* Category */}
          <div className="space-y-2">
            <Label htmlFor="expense-category">Category</Label>
            <Controller
              control={control}
              name="category"
              render={({ field }) => (
                <Select value={field.value} onValueChange={field.onChange}>
                  <SelectTrigger id="expense-category">
                    <SelectValue placeholder="Select category" />
                  </SelectTrigger>
                  <SelectContent>
                    {EXPENSE_CATEGORIES.map((cat) => (
                      <SelectItem key={cat} value={cat}>
                        {cat.charAt(0).toUpperCase() + cat.slice(1)}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              )}
            />
          </div>

          {/* Description */}
          <div className="space-y-2">
            <Label htmlFor="expense-description">Description</Label>
            <Input
              id="expense-description"
              {...register('description', { required: true })}
              placeholder="What was the expense for?"
            />
          </div>

          {/* Amount */}
          <div className="space-y-2">
            <Label htmlFor="expense-amount">Amount</Label>
            <Input
              id="expense-amount"
              type="number"
              step="0.01"
              {...register('amount', { required: true, valueAsNumber: true })}
              placeholder="0"
            />
          </div>

          {/* Date */}
          <div className="space-y-2">
            <Label htmlFor="expense-date">Date</Label>
            <Input
              id="expense-date"
              type="date"
              {...register('date', { required: true })}
            />
          </div>

          {/* Staff name */}
          <div className="space-y-2">
            <Label htmlFor="expense-staff">Staff Name</Label>
            <Input
              id="expense-staff"
              {...register('staff_name')}
              placeholder="Optional"
            />
          </div>

          {/* Recurring */}
          <div className="flex items-center gap-2">
            <Controller
              control={control}
              name="recurring"
              render={({ field }) => (
                <Checkbox
                  id="expense-recurring"
                  checked={field.value}
                  onCheckedChange={(checked) => field.onChange(!!checked)}
                />
              )}
            />
            <Label htmlFor="expense-recurring" className="cursor-pointer">
              Recurring expense
            </Label>
          </div>

          {/* Notes */}
          <div className="space-y-2">
            <Label htmlFor="expense-notes">Notes</Label>
            <Textarea
              id="expense-notes"
              {...register('notes')}
              placeholder="Optional notes"
              rows={2}
            />
          </div>

          <DialogFooter>
            <Button
              type="button"
              variant="outline"
              onClick={() => onOpenChange(false)}
            >
              Cancel
            </Button>
            <Button type="submit" disabled={isPending}>
              {isPending ? 'Saving...' : expense ? 'Update' : 'Add Expense'}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  )
}

// ===========================================================================
// SUB-TAB B: Historical (7 Years)
// ===========================================================================

function HistoricalTab() {
  const { selectedCompanyId } = useCompany()
  const { isAdmin } = useRole()
  const queryClient = useQueryClient()

  const [historicalDialogOpen, setHistoricalDialogOpen] = useState(false)
  const [editingRecord, setEditingRecord] = useState<HistoricalFinancial | null>(null)

  // ---- fetch historical financials ----
  const {
    data: historicals = [],
    isLoading,
  } = useQuery({
    queryKey: ['historical_financials', selectedCompanyId],
    queryFn: async () => {
      if (!selectedCompanyId) return []
      const { data, error } = await supabase
        .from('historical_financials')
        .select('*')
        .eq('company_id', selectedCompanyId)
        .order('year', { ascending: true })
      if (error) throw error
      return data as HistoricalFinancial[]
    },
    enabled: !!selectedCompanyId,
  })

  // ---- upsert mutation ----
  const upsertHistorical = useMutation({
    mutationFn: async (values: HistoricalFormData) => {
      // Check if a record for this year already exists
      const existing = historicals.find((h) => h.year === values.year)
      if (existing) {
        const { error } = await supabase
          .from('historical_financials')
          .update(values)
          .eq('id', existing.id)
        if (error) throw error
        await logAudit({
          action: 'update_historical_financial',
          entityType: 'historical_financial',
          entityId: existing.id,
          details: values as unknown as Record<string, unknown>,
        })
      } else {
        const { data, error } = await supabase
          .from('historical_financials')
          .insert({ ...values, company_id: selectedCompanyId })
          .select('id')
          .single()
        if (error) throw error
        await logAudit({
          action: 'create_historical_financial',
          entityType: 'historical_financial',
          entityId: data.id,
          details: values as unknown as Record<string, unknown>,
        })
      }
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['historical_financials'] })
      setHistoricalDialogOpen(false)
      setEditingRecord(null)
    },
  })

  // ---- derived data ----
  const sortedByYear = useMemo(
    () => [...historicals].sort((a, b) => a.year - b.year),
    [historicals],
  )

  const lineChartData = useMemo(
    () =>
      sortedByYear.map((h) => ({
        year: h.year,
        Revenue: h.total_revenue ?? 0,
        Expenses: h.total_expenses ?? 0,
        'Net Profit': h.net_profit ?? 0,
      })),
    [sortedByYear],
  )

  const barChartData = useMemo(
    () =>
      sortedByYear.map((h) => ({
        year: h.year,
        'Project Count': h.project_count ?? 0,
        Revenue: h.total_revenue ?? 0,
      })),
    [sortedByYear],
  )

  // Table with delta vs prior year
  const tableRows = useMemo(() => {
    return sortedByYear.map((h, i) => {
      const prev = i > 0 ? sortedByYear[i - 1] : null
      const delta = (curr: number | null, prevVal: number | null) => {
        if (prevVal == null || prevVal === 0 || curr == null) return null
        return ((curr - prevVal) / Math.abs(prevVal)) * 100
      }
      return {
        ...h,
        revenueDelta: delta(h.total_revenue, prev?.total_revenue ?? null),
        expensesDelta: delta(h.total_expenses, prev?.total_expenses ?? null),
        salariesDelta: delta(h.total_salaries, prev?.total_salaries ?? null),
        bonusesDelta: delta(h.total_bonuses, prev?.total_bonuses ?? null),
        profitDelta: delta(h.net_profit, prev?.net_profit ?? null),
        projectDelta: delta(h.project_count, prev?.project_count ?? null),
      }
    })
  }, [sortedByYear])

  // ---- sortable table ----
  const [tableSorting, setTableSorting] = useState<SortingState>([])

  const historicalColumns = useMemo<ColumnDef<(typeof tableRows)[number]>[]>(
    () => [
      { accessorKey: 'year', header: 'Year' },
      {
        accessorKey: 'total_revenue',
        header: 'Revenue',
        cell: ({ row }) => (
          <div>
            <span className="font-mono">{formatINR(row.original.total_revenue)}</span>
            <DeltaBadge value={row.original.revenueDelta} />
          </div>
        ),
      },
      {
        accessorKey: 'total_expenses',
        header: 'Expenses',
        cell: ({ row }) => (
          <div>
            <span className="font-mono">{formatINR(row.original.total_expenses)}</span>
            <DeltaBadge value={row.original.expensesDelta} invert />
          </div>
        ),
      },
      {
        accessorKey: 'total_salaries',
        header: 'Salaries',
        cell: ({ row }) => (
          <div>
            <span className="font-mono">{formatINR(row.original.total_salaries)}</span>
            <DeltaBadge value={row.original.salariesDelta} />
          </div>
        ),
      },
      {
        accessorKey: 'total_bonuses',
        header: 'Bonuses',
        cell: ({ row }) => (
          <div>
            <span className="font-mono">{formatINR(row.original.total_bonuses)}</span>
            <DeltaBadge value={row.original.bonusesDelta} />
          </div>
        ),
      },
      {
        accessorKey: 'net_profit',
        header: 'Net Profit',
        cell: ({ row }) => (
          <div>
            <span className="font-mono">{formatINR(row.original.net_profit)}</span>
            <DeltaBadge value={row.original.profitDelta} />
          </div>
        ),
      },
      {
        accessorKey: 'project_count',
        header: 'Projects',
        cell: ({ row }) => (
          <div>
            <span>{row.original.project_count ?? 0}</span>
            <DeltaBadge value={row.original.projectDelta} />
          </div>
        ),
      },
    ],
    [],
  )

  const historicalTable = useReactTable({
    data: tableRows,
    columns: historicalColumns,
    state: { sorting: tableSorting },
    onSortingChange: setTableSorting,
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
  })

  // ---- KPI calculations ----
  const bestYear = useMemo(() => {
    if (sortedByYear.length === 0) return null
    return sortedByYear.reduce((best, h) =>
      (h.total_revenue ?? 0) > (best.total_revenue ?? 0) ? h : best,
    )
  }, [sortedByYear])

  const avgAnnualGrowth = useMemo(() => {
    if (sortedByYear.length < 2) return 0
    const growths: number[] = []
    for (let i = 1; i < sortedByYear.length; i++) {
      const prev = sortedByYear[i - 1].total_revenue ?? 0
      const curr = sortedByYear[i].total_revenue ?? 0
      if (prev > 0) {
        growths.push(((curr - prev) / prev) * 100)
      }
    }
    if (growths.length === 0) return 0
    return growths.reduce((a, b) => a + b, 0) / growths.length
  }, [sortedByYear])

  const cumulativeRevenue = useMemo(
    () => sortedByYear.reduce((sum, h) => sum + (h.total_revenue ?? 0), 0),
    [sortedByYear],
  )

  // ---- render ----
  return (
    <>
      {/* KPI cards */}
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        <KPICard
          title="Best Year"
          value={bestYear ? `${bestYear.year} - ${formatINR(bestYear.total_revenue)}` : '-'}
          icon={TrendingUp}
          loading={isLoading}
          mono={false}
        />
        <KPICard
          title="Avg Annual Growth"
          value={`${avgAnnualGrowth.toFixed(1)}%`}
          icon={BarChart3}
          trendUp={avgAnnualGrowth > 0}
          trend={avgAnnualGrowth !== 0 ? `${avgAnnualGrowth > 0 ? '+' : ''}${avgAnnualGrowth.toFixed(1)}%` : undefined}
          loading={isLoading}
        />
        <KPICard
          title="Cumulative Revenue"
          value={formatINR(cumulativeRevenue)}
          icon={DollarSign}
          loading={isLoading}
        />
      </div>

      {/* Revenue / Expenses / Net Profit line chart */}
      <Card>
        <CardHeader className="flex flex-row items-center justify-between space-y-0">
          <CardTitle>Revenue, Expenses & Net Profit</CardTitle>
          <RequiresAdmin>
            <Button
              size="sm"
              onClick={() => {
                setEditingRecord(null)
                setHistoricalDialogOpen(true)
              }}
            >
              <Plus className="h-4 w-4 mr-2" /> Add Year Data
            </Button>
          </RequiresAdmin>
        </CardHeader>
        <CardContent>
          {isLoading ? (
            <Skeleton className="h-80 w-full" />
          ) : lineChartData.length === 0 ? (
            <EmptyState
              icon={Calendar}
              title="No historical data"
              description="Add yearly financial summaries to see trends."
              actionLabel={isAdmin ? '+ Add Year Data' : undefined}
              onAction={
                isAdmin
                  ? () => {
                      setEditingRecord(null)
                      setHistoricalDialogOpen(true)
                    }
                  : undefined
              }
            />
          ) : (
            <ResponsiveContainer width="100%" height={360}>
              <LineChart data={lineChartData}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="year" />
                <YAxis tickFormatter={(v: number) => formatINR(v)} />
                <Tooltip formatter={(value) => formatINR(Number(value))} />
                <Legend />
                <Line
                  type="monotone"
                  dataKey="Revenue"
                  stroke="#10b981"
                  strokeWidth={2}
                  dot={{ r: 4 }}
                />
                <Line
                  type="monotone"
                  dataKey="Expenses"
                  stroke="#ef4444"
                  strokeWidth={2}
                  dot={{ r: 4 }}
                />
                <Line
                  type="monotone"
                  dataKey="Net Profit"
                  stroke="#6366f1"
                  strokeWidth={2}
                  dot={{ r: 4 }}
                />
              </LineChart>
            </ResponsiveContainer>
          )}
        </CardContent>
      </Card>

      {/* Year-over-year bar chart */}
      <Card>
        <CardHeader>
          <CardTitle>Year-over-Year: Projects & Revenue</CardTitle>
        </CardHeader>
        <CardContent>
          {isLoading ? (
            <Skeleton className="h-80 w-full" />
          ) : barChartData.length === 0 ? (
            <p className="text-sm text-muted-foreground text-center py-8">
              No data available.
            </p>
          ) : (
            <ResponsiveContainer width="100%" height={360}>
              <BarChart data={barChartData}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="year" />
                <YAxis
                  yAxisId="left"
                  tickFormatter={(v: number) => formatINR(v)}
                />
                <YAxis yAxisId="right" orientation="right" />
                <Tooltip
                  formatter={(value, name) =>
                    name === 'Revenue' ? formatINR(Number(value)) : String(value)
                  }
                />
                <Legend />
                <Bar
                  yAxisId="left"
                  dataKey="Revenue"
                  fill="#10b981"
                  name="Revenue"
                  radius={[4, 4, 0, 0]}
                />
                <Bar
                  yAxisId="right"
                  dataKey="Project Count"
                  fill="#6366f1"
                  name="Project Count"
                  radius={[4, 4, 0, 0]}
                />
              </BarChart>
            </ResponsiveContainer>
          )}
        </CardContent>
      </Card>

      {/* Summary table */}
      <Card>
        <CardHeader>
          <CardTitle>Yearly Summary</CardTitle>
        </CardHeader>
        <CardContent>
          {isLoading ? (
            <div className="space-y-2">
              {Array.from({ length: 4 }).map((_, i) => (
                <Skeleton key={i} className="h-10 w-full" />
              ))}
            </div>
          ) : tableRows.length === 0 ? (
            <p className="text-sm text-muted-foreground text-center py-8">
              No historical data recorded yet.
            </p>
          ) : (
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  {historicalTable.getHeaderGroups().map((hg) => (
                    <TableRow key={hg.id}>
                      {hg.headers.map((header) => (
                        <TableHead
                          key={header.id}
                          className="cursor-pointer select-none"
                          onClick={header.column.getToggleSortingHandler()}
                        >
                          {flexRender(header.column.columnDef.header, header.getContext())}
                          {{ asc: ' \u2191', desc: ' \u2193' }[header.column.getIsSorted() as string] ?? ''}
                        </TableHead>
                      ))}
                    </TableRow>
                  ))}
                </TableHeader>
                <TableBody>
                  {historicalTable.getRowModel().rows.map((row) => (
                    <TableRow
                      key={row.id}
                      className={isAdmin ? 'cursor-pointer hover:bg-muted/50' : ''}
                      onClick={() => {
                        if (isAdmin) {
                          setEditingRecord(row.original)
                          setHistoricalDialogOpen(true)
                        }
                      }}
                    >
                      {row.getVisibleCells().map((cell) => (
                        <TableCell key={cell.id}>
                          {flexRender(cell.column.columnDef.cell, cell.getContext())}
                        </TableCell>
                      ))}
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Historical data entry dialog */}
      <HistoricalDialog
        open={historicalDialogOpen}
        onOpenChange={(open) => {
          setHistoricalDialogOpen(open)
          if (!open) setEditingRecord(null)
        }}
        record={editingRecord}
        onSubmit={(data) => upsertHistorical.mutate(data)}
        isPending={upsertHistorical.isPending}
      />
    </>
  )
}

// ---------------------------------------------------------------------------
// Historical Data Entry Dialog
// ---------------------------------------------------------------------------

function HistoricalDialog({
  open,
  onOpenChange,
  record,
  onSubmit,
  isPending,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  record: HistoricalFinancial | null
  onSubmit: (data: HistoricalFormData) => void
  isPending: boolean
}) {
  const currentYear = getYear(new Date())

  const defaults: HistoricalFormData = record
    ? {
        year: record.year,
        total_revenue: record.total_revenue ?? 0,
        total_expenses: record.total_expenses ?? 0,
        total_salaries: record.total_salaries ?? 0,
        total_bonuses: record.total_bonuses ?? 0,
        total_reimbursables: record.total_reimbursables ?? 0,
        net_profit: record.net_profit ?? 0,
        project_count: record.project_count ?? 0,
        notes: record.notes ?? '',
      }
    : {
        year: currentYear - 1,
        total_revenue: 0,
        total_expenses: 0,
        total_salaries: 0,
        total_bonuses: 0,
        total_reimbursables: 0,
        net_profit: 0,
        project_count: 0,
        notes: '',
      }

  const { register, handleSubmit, reset } = useForm<HistoricalFormData>({
    defaultValues: defaults,
  })

  const handleOpenChange = (nextOpen: boolean) => {
    if (nextOpen) {
      reset(
        record
          ? {
              year: record.year,
              total_revenue: record.total_revenue ?? 0,
              total_expenses: record.total_expenses ?? 0,
              total_salaries: record.total_salaries ?? 0,
              total_bonuses: record.total_bonuses ?? 0,
              total_reimbursables: record.total_reimbursables ?? 0,
              net_profit: record.net_profit ?? 0,
              project_count: record.project_count ?? 0,
              notes: record.notes ?? '',
            }
          : {
              year: currentYear - 1,
              total_revenue: 0,
              total_expenses: 0,
              total_salaries: 0,
              total_bonuses: 0,
              total_reimbursables: 0,
              net_profit: 0,
              project_count: 0,
              notes: '',
            },
      )
    }
    onOpenChange(nextOpen)
  }

  return (
    <Dialog open={open} onOpenChange={handleOpenChange}>
      <DialogContent className="sm:max-w-lg max-h-[90vh] overflow-y-auto">
        <DialogHeader>
          <DialogTitle>
            {record ? `Edit ${record.year} Data` : 'Add Year Data'}
          </DialogTitle>
          <DialogDescription>
            {record
              ? 'Update the financial summary for this year.'
              : 'Enter the financial summary for a past year.'}
          </DialogDescription>
        </DialogHeader>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <div className="space-y-2">
            <Label htmlFor="hist-year">Year</Label>
            <Input
              id="hist-year"
              type="number"
              {...register('year', { required: true, valueAsNumber: true })}
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label htmlFor="hist-revenue">Total Revenue</Label>
              <Input
                id="hist-revenue"
                type="number"
                step="0.01"
                {...register('total_revenue', { valueAsNumber: true })}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="hist-expenses">Total Expenses</Label>
              <Input
                id="hist-expenses"
                type="number"
                step="0.01"
                {...register('total_expenses', { valueAsNumber: true })}
              />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label htmlFor="hist-salaries">Total Salaries</Label>
              <Input
                id="hist-salaries"
                type="number"
                step="0.01"
                {...register('total_salaries', { valueAsNumber: true })}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="hist-bonuses">Total Bonuses</Label>
              <Input
                id="hist-bonuses"
                type="number"
                step="0.01"
                {...register('total_bonuses', { valueAsNumber: true })}
              />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label htmlFor="hist-reimbursables">Total Reimbursables</Label>
              <Input
                id="hist-reimbursables"
                type="number"
                step="0.01"
                {...register('total_reimbursables', { valueAsNumber: true })}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="hist-profit">Net Profit</Label>
              <Input
                id="hist-profit"
                type="number"
                step="0.01"
                {...register('net_profit', { valueAsNumber: true })}
              />
            </div>
          </div>

          <div className="space-y-2">
            <Label htmlFor="hist-projects">Project Count</Label>
            <Input
              id="hist-projects"
              type="number"
              {...register('project_count', { valueAsNumber: true })}
            />
          </div>

          <div className="space-y-2">
            <Label htmlFor="hist-notes">Notes</Label>
            <Textarea
              id="hist-notes"
              {...register('notes')}
              placeholder="Optional notes about this year"
              rows={2}
            />
          </div>

          <DialogFooter>
            <Button
              type="button"
              variant="outline"
              onClick={() => onOpenChange(false)}
            >
              Cancel
            </Button>
            <Button type="submit" disabled={isPending}>
              {isPending ? 'Saving...' : record ? 'Update' : 'Save'}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  )
}

// ---------------------------------------------------------------------------
// DeltaBadge helper
// ---------------------------------------------------------------------------

function DeltaBadge({
  value,
  invert = false,
}: {
  value: number | null
  invert?: boolean
}) {
  if (value == null) return null
  const isPositive = value > 0
  // For expenses, positive delta is bad (invert colors)
  const isGood = invert ? !isPositive : isPositive

  return (
    <span
      className={`ml-2 text-xs font-medium ${
        isGood
          ? 'text-emerald-600 dark:text-emerald-400'
          : 'text-red-600 dark:text-red-400'
      }`}
    >
      {isPositive ? '+' : ''}
      {value.toFixed(1)}%
    </span>
  )
}
