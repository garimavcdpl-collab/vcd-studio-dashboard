import { useState, useMemo } from 'react'
import {
  useReactTable,
  getCoreRowModel,
  getSortedRowModel,
  getFilteredRowModel,
  flexRender,
  createColumnHelper,
  type SortingState,
  type RowSelectionState,
} from '@tanstack/react-table'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { format, differenceInDays } from 'date-fns'
import {
  FileText,
  ArrowUpDown,
  CreditCard,
  CheckCircle2,
  Search,
} from 'lucide-react'

import { supabase } from '@/lib/supabase'
import { formatINR } from '@/lib/format'
import { logAudit } from '@/lib/audit'
import { useCompany } from '@/hooks/useCompany'
import { useRole } from '@/hooks/useRole'

import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Badge } from '@/components/ui/badge'
import { Checkbox } from '@/components/ui/checkbox'
import { Label } from '@/components/ui/label'
import { Skeleton } from '@/components/ui/skeleton'
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
  DialogDescription,
} from '@/components/ui/dialog'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { PaymentStatusBadge } from '@/components/shared/StatusBadge'
import { RequiresAdmin } from '@/components/shared/RequiresAdmin'
import { EmptyState } from '@/components/shared/EmptyState'

import type { FeeStage } from '@/types/database'

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface FeeStageWithProject extends FeeStage {
  project_name: string
}

// ---------------------------------------------------------------------------
// Query
// ---------------------------------------------------------------------------

function useFeeStages(companyId: string | null) {
  return useQuery({
    queryKey: ['fee_stages', 'invoicing', companyId],
    queryFn: async (): Promise<FeeStageWithProject[]> => {
      if (!companyId) return []

      const { data, error } = await supabase
        .from('fee_stages')
        .select('*, projects!inner(project_name, company_id)')
        .eq('projects.company_id', companyId)
        .order('invoice_date', { ascending: false, nullsFirst: false })

      if (error) throw error

      return (data ?? []).map((row: any) => ({
        id: row.id,
        project_id: row.project_id,
        stage_name: row.stage_name,
        stage_number: row.stage_number,
        lumpsum_amount: row.lumpsum_amount,
        percentage_of_total: row.percentage_of_total,
        due_trigger: row.due_trigger,
        invoice_date: row.invoice_date,
        invoice_number: row.invoice_number,
        payment_received_date: row.payment_received_date,
        payment_status: row.payment_status,
        amount_paid: row.amount_paid,
        notes: row.notes,
        project_name: row.projects.project_name,
      }))
    },
    enabled: !!companyId,
  })
}

// ---------------------------------------------------------------------------
// Column helper
// ---------------------------------------------------------------------------

const columnHelper = createColumnHelper<FeeStageWithProject>()

// ---------------------------------------------------------------------------
// Log Payment Dialog
// ---------------------------------------------------------------------------

interface LogPaymentDialogProps {
  row: FeeStageWithProject | null
  open: boolean
  onOpenChange: (open: boolean) => void
  onSubmit: (payload: {
    id: string
    amount_paid: number
    payment_received_date: string
    invoice_number: string | null
    payment_status: 'partial' | 'paid'
  }) => void
  submitting: boolean
}

function LogPaymentDialog({
  row,
  open,
  onOpenChange,
  onSubmit,
  submitting,
}: LogPaymentDialogProps) {
  const balance = (row?.lumpsum_amount ?? 0) - (row?.amount_paid ?? 0)

  const [mode, setMode] = useState<'full' | 'partial'>('full')
  const [amount, setAmount] = useState(balance)
  const [date, setDate] = useState(format(new Date(), 'yyyy-MM-dd'))
  const [reference, setReference] = useState(row?.invoice_number ?? '')

  // Reset form when row changes
  useMemo(() => {
    if (row) {
      const bal = (row.lumpsum_amount ?? 0) - (row.amount_paid ?? 0)
      setMode('full')
      setAmount(bal)
      setDate(format(new Date(), 'yyyy-MM-dd'))
      setReference(row.invoice_number ?? '')
    }
  }, [row])

  if (!row) return null

  const newTotalPaid = (row.amount_paid ?? 0) + amount
  const newBalance = (row.lumpsum_amount ?? 0) - newTotalPaid

  const handleSubmit = () => {
    onSubmit({
      id: row.id,
      amount_paid: newTotalPaid,
      payment_received_date: date,
      invoice_number: reference || null,
      payment_status: mode === 'full' ? 'paid' : 'partial',
    })
  }

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-md">
        <DialogHeader>
          <DialogTitle>Log Payment</DialogTitle>
          <DialogDescription>
            {row.project_name} &mdash; {row.stage_name}
          </DialogDescription>
        </DialogHeader>

        <div className="space-y-4 py-2">
          {/* Payment mode */}
          <div className="space-y-2">
            <Label>Payment Type</Label>
            <div className="flex gap-4">
              <label className="flex items-center gap-2 cursor-pointer">
                <input
                  type="radio"
                  name="paymentMode"
                  checked={mode === 'full'}
                  onChange={() => {
                    setMode('full')
                    setAmount(balance)
                  }}
                  className="accent-primary"
                />
                <span className="text-sm">Full Payment</span>
              </label>
              <label className="flex items-center gap-2 cursor-pointer">
                <input
                  type="radio"
                  name="paymentMode"
                  checked={mode === 'partial'}
                  onChange={() => setMode('partial')}
                  className="accent-primary"
                />
                <span className="text-sm">Partial Payment</span>
              </label>
            </div>
          </div>

          {/* Amount */}
          <div className="space-y-2">
            <Label htmlFor="paymentAmount">Amount</Label>
            <Input
              id="paymentAmount"
              type="number"
              min={0}
              max={balance}
              step={1}
              value={amount}
              disabled={mode === 'full'}
              onChange={(e) => setAmount(Number(e.target.value))}
            />
            <p className="text-xs text-muted-foreground">
              Balance: {formatINR(balance)} &rarr; New balance:{' '}
              {formatINR(Math.max(0, newBalance))}
            </p>
          </div>

          {/* Date */}
          <div className="space-y-2">
            <Label htmlFor="paymentDate">Payment Date</Label>
            <Input
              id="paymentDate"
              type="date"
              value={date}
              onChange={(e) => setDate(e.target.value)}
            />
          </div>

          {/* Reference / invoice number */}
          <div className="space-y-2">
            <Label htmlFor="paymentRef">Invoice / Reference #</Label>
            <Input
              id="paymentRef"
              placeholder="INV-001"
              value={reference}
              onChange={(e) => setReference(e.target.value)}
            />
          </div>
        </div>

        <DialogFooter>
          <Button
            variant="outline"
            onClick={() => onOpenChange(false)}
            disabled={submitting}
          >
            Cancel
          </Button>
          <Button
            onClick={handleSubmit}
            disabled={submitting || amount <= 0}
          >
            {submitting ? 'Saving...' : 'Save Payment'}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}

// ---------------------------------------------------------------------------
// Main Page
// ---------------------------------------------------------------------------

export function InvoicingPage() {
  const { selectedCompanyId } = useCompany()
  const { isAdmin } = useRole()
  const queryClient = useQueryClient()

  const { data: stages = [], isLoading } = useFeeStages(selectedCompanyId)

  // Filters
  const [statusFilter, setStatusFilter] = useState<string>('all')
  const [dateFrom, setDateFrom] = useState('')
  const [dateTo, setDateTo] = useState('')
  const [projectSearch, setProjectSearch] = useState('')

  // Table state
  const [sorting, setSorting] = useState<SortingState>([])
  const [rowSelection, setRowSelection] = useState<RowSelectionState>({})

  // Payment dialog
  const [paymentRow, setPaymentRow] = useState<FeeStageWithProject | null>(null)
  const [paymentDialogOpen, setPaymentDialogOpen] = useState(false)

  // -----------------------------------------------------------------------
  // Filtered data
  // -----------------------------------------------------------------------

  const filteredData = useMemo(() => {
    let result = stages

    // Status filter
    if (statusFilter !== 'all') {
      result = result.filter((s) => s.payment_status === statusFilter)
    }

    // Date range filter on invoice_date
    if (dateFrom) {
      result = result.filter(
        (s) => s.invoice_date && s.invoice_date >= dateFrom,
      )
    }
    if (dateTo) {
      result = result.filter(
        (s) => s.invoice_date && s.invoice_date <= dateTo,
      )
    }

    // Project name search
    if (projectSearch.trim()) {
      const q = projectSearch.trim().toLowerCase()
      result = result.filter((s) =>
        s.project_name.toLowerCase().includes(q),
      )
    }

    return result
  }, [stages, statusFilter, dateFrom, dateTo, projectSearch])

  // -----------------------------------------------------------------------
  // Columns
  // -----------------------------------------------------------------------

  const columns = useMemo(
    () => [
      // Checkbox column
      columnHelper.display({
        id: 'select',
        header: ({ table }) =>
          isAdmin ? (
            <Checkbox
              checked={
                table.getIsAllPageRowsSelected() ||
                (table.getIsSomePageRowsSelected() && 'indeterminate')
              }
              onCheckedChange={(value) =>
                table.toggleAllPageRowsSelected(!!value)
              }
              aria-label="Select all"
            />
          ) : null,
        cell: ({ row }) =>
          isAdmin ? (
            <Checkbox
              checked={row.getIsSelected()}
              onCheckedChange={(value) => row.toggleSelected(!!value)}
              aria-label="Select row"
            />
          ) : null,
        enableSorting: false,
      }),

      columnHelper.accessor('project_name', {
        header: ({ column }) => (
          <Button
            variant="ghost"
            size="sm"
            className="-ml-3 h-8"
            onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}
          >
            Project Name
            <ArrowUpDown className="ml-2 h-3.5 w-3.5" />
          </Button>
        ),
        cell: (info) => (
          <span className="font-medium">{info.getValue()}</span>
        ),
      }),

      columnHelper.accessor('stage_name', {
        header: ({ column }) => (
          <Button
            variant="ghost"
            size="sm"
            className="-ml-3 h-8"
            onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}
          >
            Stage Name
            <ArrowUpDown className="ml-2 h-3.5 w-3.5" />
          </Button>
        ),
      }),

      columnHelper.accessor('lumpsum_amount', {
        header: ({ column }) => (
          <Button
            variant="ghost"
            size="sm"
            className="-ml-3 h-8"
            onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}
          >
            Amount
            <ArrowUpDown className="ml-2 h-3.5 w-3.5" />
          </Button>
        ),
        cell: (info) => formatINR(info.getValue()),
      }),

      columnHelper.accessor('invoice_number', {
        header: ({ column }) => (
          <Button
            variant="ghost"
            size="sm"
            className="-ml-3 h-8"
            onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}
          >
            Invoice #
            <ArrowUpDown className="ml-2 h-3.5 w-3.5" />
          </Button>
        ),
        cell: (info) => info.getValue() ?? <span className="text-muted-foreground">&mdash;</span>,
      }),

      columnHelper.accessor('invoice_date', {
        header: ({ column }) => (
          <Button
            variant="ghost"
            size="sm"
            className="-ml-3 h-8"
            onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}
          >
            Invoice Date
            <ArrowUpDown className="ml-2 h-3.5 w-3.5" />
          </Button>
        ),
        cell: (info) => {
          const v = info.getValue()
          return v ? format(new Date(v), 'dd MMM yyyy') : <span className="text-muted-foreground">&mdash;</span>
        },
      }),

      columnHelper.accessor('payment_status', {
        header: ({ column }) => (
          <Button
            variant="ghost"
            size="sm"
            className="-ml-3 h-8"
            onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}
          >
            Status
            <ArrowUpDown className="ml-2 h-3.5 w-3.5" />
          </Button>
        ),
        cell: (info) => <PaymentStatusBadge status={info.getValue()} />,
      }),

      columnHelper.accessor('amount_paid', {
        header: ({ column }) => (
          <Button
            variant="ghost"
            size="sm"
            className="-ml-3 h-8"
            onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}
          >
            Amount Paid
            <ArrowUpDown className="ml-2 h-3.5 w-3.5" />
          </Button>
        ),
        cell: (info) => formatINR(info.getValue()),
      }),

      columnHelper.accessor(
        (row) => (row.lumpsum_amount ?? 0) - (row.amount_paid ?? 0),
        {
          id: 'balance',
          header: ({ column }) => (
            <Button
              variant="ghost"
              size="sm"
              className="-ml-3 h-8"
              onClick={() =>
                column.toggleSorting(column.getIsSorted() === 'asc')
              }
            >
              Balance
              <ArrowUpDown className="ml-2 h-3.5 w-3.5" />
            </Button>
          ),
          cell: (info) => formatINR(info.getValue()),
        },
      ),

      columnHelper.accessor(
        (row) => {
          if (
            !row.invoice_date ||
            (row.payment_status !== 'invoiced' && row.payment_status !== 'partial')
          )
            return null
          return differenceInDays(new Date(), new Date(row.invoice_date))
        },
        {
          id: 'days_outstanding',
          header: ({ column }) => (
            <Button
              variant="ghost"
              size="sm"
              className="-ml-3 h-8"
              onClick={() =>
                column.toggleSorting(column.getIsSorted() === 'asc')
              }
            >
              Days Outstanding
              <ArrowUpDown className="ml-2 h-3.5 w-3.5" />
            </Button>
          ),
          cell: (info) => {
            const v = info.getValue()
            if (v == null) return <span className="text-muted-foreground">&mdash;</span>
            return (
              <Badge variant={v > 60 ? 'destructive' : v > 30 ? 'warning' : 'secondary'}>
                {v}d
              </Badge>
            )
          },
          sortUndefined: 'last',
        },
      ),

      // Actions column
      columnHelper.display({
        id: 'actions',
        header: () => <span className="sr-only">Actions</span>,
        cell: ({ row }) => (
          <RequiresAdmin>
            <Button
              variant="ghost"
              size="sm"
              onClick={() => {
                setPaymentRow(row.original)
                setPaymentDialogOpen(true)
              }}
            >
              <CreditCard className="mr-1.5 h-3.5 w-3.5" />
              Log Payment
            </Button>
          </RequiresAdmin>
        ),
      }),
    ],
    [isAdmin],
  )

  // -----------------------------------------------------------------------
  // Table instance
  // -----------------------------------------------------------------------

  const table = useReactTable({
    data: filteredData,
    columns,
    state: { sorting, rowSelection },
    onSortingChange: setSorting,
    onRowSelectionChange: setRowSelection,
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
    getFilteredRowModel: getFilteredRowModel(),
    enableRowSelection: true,
    getRowId: (row) => row.id,
  })

  // -----------------------------------------------------------------------
  // Mutations
  // -----------------------------------------------------------------------

  const logPaymentMutation = useMutation({
    mutationFn: async (payload: {
      id: string
      amount_paid: number
      payment_received_date: string
      invoice_number: string | null
      payment_status: 'partial' | 'paid'
    }) => {
      const { error } = await supabase
        .from('fee_stages')
        .update({
          amount_paid: payload.amount_paid,
          payment_received_date: payload.payment_received_date,
          invoice_number: payload.invoice_number,
          payment_status: payload.payment_status,
        })
        .eq('id', payload.id)

      if (error) throw error

      await logAudit({
        action: 'log_payment',
        entityType: 'fee_stage',
        entityId: payload.id,
        details: {
          amount_paid: payload.amount_paid,
          payment_status: payload.payment_status,
          payment_received_date: payload.payment_received_date,
        },
      })
    },
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: ['fee_stages', 'invoicing', selectedCompanyId],
      })
      setPaymentDialogOpen(false)
      setPaymentRow(null)
    },
  })

  const markInvoicedMutation = useMutation({
    mutationFn: async (ids: string[]) => {
      const today = format(new Date(), 'yyyy-MM-dd')

      const { error } = await supabase
        .from('fee_stages')
        .update({
          payment_status: 'invoiced' as const,
          invoice_date: today,
        })
        .in('id', ids)

      if (error) throw error

      await logAudit({
        action: 'bulk_mark_invoiced',
        entityType: 'fee_stage',
        details: { ids, invoice_date: today },
      })
    },
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: ['fee_stages', 'invoicing', selectedCompanyId],
      })
      setRowSelection({})
    },
  })

  // -----------------------------------------------------------------------
  // Derived
  // -----------------------------------------------------------------------

  const selectedIds = Object.keys(rowSelection).filter((k) => rowSelection[k])

  const handleMarkInvoiced = () => {
    if (selectedIds.length === 0) return
    markInvoicedMutation.mutate(selectedIds)
  }

  // -----------------------------------------------------------------------
  // Render helpers
  // -----------------------------------------------------------------------

  if (isLoading) {
    return (
      <div className="space-y-6 p-6">
        <Skeleton className="h-8 w-48" />
        <div className="flex gap-4">
          <Skeleton className="h-10 w-44" />
          <Skeleton className="h-10 w-36" />
          <Skeleton className="h-10 w-36" />
          <Skeleton className="h-10 w-52" />
        </div>
        <Card>
          <CardContent className="p-0">
            <div className="space-y-2 p-4">
              {Array.from({ length: 8 }).map((_, i) => (
                <Skeleton key={i} className="h-10 w-full" />
              ))}
            </div>
          </CardContent>
        </Card>
      </div>
    )
  }

  return (
    <div className="space-y-6 p-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold tracking-tight">Invoicing</h1>

        <RequiresAdmin>
          {selectedIds.length > 0 && (
            <Button
              onClick={handleMarkInvoiced}
              disabled={markInvoicedMutation.isPending}
            >
              <CheckCircle2 className="mr-2 h-4 w-4" />
              {markInvoicedMutation.isPending
                ? 'Updating...'
                : `Mark as Invoiced (${selectedIds.length})`}
            </Button>
          )}
        </RequiresAdmin>
      </div>

      {/* Filters */}
      <div className="flex flex-wrap items-end gap-4">
        {/* Status */}
        <div className="space-y-1">
          <Label className="text-xs text-muted-foreground">Status</Label>
          <Select value={statusFilter} onValueChange={setStatusFilter}>
            <SelectTrigger className="w-[160px]">
              <SelectValue />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All Statuses</SelectItem>
              <SelectItem value="pending">Pending</SelectItem>
              <SelectItem value="invoiced">Invoiced</SelectItem>
              <SelectItem value="partial">Partial</SelectItem>
              <SelectItem value="paid">Paid</SelectItem>
            </SelectContent>
          </Select>
        </div>

        {/* Date from */}
        <div className="space-y-1">
          <Label className="text-xs text-muted-foreground">From</Label>
          <Input
            type="date"
            className="w-[160px]"
            value={dateFrom}
            onChange={(e) => setDateFrom(e.target.value)}
          />
        </div>

        {/* Date to */}
        <div className="space-y-1">
          <Label className="text-xs text-muted-foreground">To</Label>
          <Input
            type="date"
            className="w-[160px]"
            value={dateTo}
            onChange={(e) => setDateTo(e.target.value)}
          />
        </div>

        {/* Project search */}
        <div className="space-y-1">
          <Label className="text-xs text-muted-foreground">Project</Label>
          <div className="relative">
            <Search className="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground" />
            <Input
              className="w-[220px] pl-8"
              placeholder="Search project..."
              value={projectSearch}
              onChange={(e) => setProjectSearch(e.target.value)}
            />
          </div>
        </div>
      </div>

      {/* Table */}
      {filteredData.length === 0 && !isLoading ? (
        <EmptyState
          icon={FileText}
          title="No fee stages found"
          description="There are no fee stages matching your filters for the selected company."
        />
      ) : (
        <Card>
          <CardContent className="p-0">
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  {table.getHeaderGroups().map((headerGroup) => (
                    <TableRow key={headerGroup.id}>
                      {headerGroup.headers.map((header) => (
                        <TableHead key={header.id}>
                          {header.isPlaceholder
                            ? null
                            : flexRender(
                                header.column.columnDef.header,
                                header.getContext(),
                              )}
                        </TableHead>
                      ))}
                    </TableRow>
                  ))}
                </TableHeader>
                <TableBody>
                  {table.getRowModel().rows.map((row) => (
                    <TableRow
                      key={row.id}
                      data-state={row.getIsSelected() && 'selected'}
                    >
                      {row.getVisibleCells().map((cell) => (
                        <TableCell key={cell.id}>
                          {flexRender(
                            cell.column.columnDef.cell,
                            cell.getContext(),
                          )}
                        </TableCell>
                      ))}
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          </CardContent>
        </Card>
      )}

      {/* Log Payment Dialog */}
      <LogPaymentDialog
        row={paymentRow}
        open={paymentDialogOpen}
        onOpenChange={(open) => {
          setPaymentDialogOpen(open)
          if (!open) setPaymentRow(null)
        }}
        onSubmit={(payload) => logPaymentMutation.mutate(payload)}
        submitting={logPaymentMutation.isPending}
      />
    </div>
  )
}
