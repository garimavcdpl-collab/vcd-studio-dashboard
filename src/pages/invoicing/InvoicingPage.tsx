import { useState, useMemo, useRef } from 'react'
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
  Archive,
  Pencil,
  Check,
  X,
  RotateCcw,
} from 'lucide-react'

import { supabase } from '@/lib/supabase'
import { formatINR } from '@/lib/format'
import { logAudit } from '@/lib/audit'
import { useCompany } from '@/hooks/useCompany'
import { useRole } from '@/hooks/useRole'

import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
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
import { RequiresAdmin } from '@/components/shared/RequiresAdmin'
import { EmptyState } from '@/components/shared/EmptyState'

import type { FeeStage } from '@/types/database'

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface FeeStageWithProject extends FeeStage {
  project_name: string
}

// Derived display status — invoice # is required to count as "invoiced"
type DisplayStatus = 'uninvoiced' | 'invoiced' | 'partial' | 'paid' | 'pending' | 'archived'

function getDisplayStatus(stage: FeeStageWithProject): DisplayStatus {
  if (stage.notes?.startsWith('[ARCHIVED]')) return 'archived'
  if (stage.payment_status === 'paid') return 'paid'
  if (stage.payment_status === 'partial') return 'partial'
  if (!stage.invoice_number) return 'uninvoiced'
  return 'invoiced'
}

const STATUS_BADGE: Record<DisplayStatus, { label: string; className: string }> = {
  uninvoiced: { label: 'Uninvoiced', className: 'bg-slate-500/15 text-slate-400 border border-slate-500/20' },
  invoiced:   { label: 'Invoiced',   className: 'bg-blue-500/15 text-blue-400 border border-blue-500/20' },
  partial:    { label: 'Partial',    className: 'bg-amber-500/15 text-amber-400 border border-amber-500/20' },
  paid:       { label: 'Paid',       className: 'bg-emerald-500/15 text-emerald-400 border border-emerald-500/20' },
  pending:    { label: 'Pending',    className: 'bg-slate-500/15 text-slate-400 border border-slate-500/20' },
  archived:   { label: 'Archived',   className: 'bg-purple-500/15 text-purple-400 border border-purple-500/20' },
}

function StatusBadge({ status }: { status: DisplayStatus }) {
  const cfg = STATUS_BADGE[status]
  return (
    <span className={`inline-flex items-center text-[10px] font-semibold px-2 py-0.5 rounded-full ${cfg.className}`}>
      {cfg.label}
    </span>
  )
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

function LogPaymentDialog({ row, open, onOpenChange, onSubmit, submitting }: LogPaymentDialogProps) {
  const balance = (row?.lumpsum_amount ?? 0) - (row?.amount_paid ?? 0)
  const [mode, setMode] = useState<'full' | 'partial'>('full')
  const [amount, setAmount] = useState(balance)
  const [date, setDate] = useState(format(new Date(), 'yyyy-MM-dd'))
  const [reference, setReference] = useState(row?.invoice_number ?? '')

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

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-md bg-card text-card-foreground border border-border">
        <DialogHeader>
          <DialogTitle className="text-foreground">Log Payment</DialogTitle>
          <DialogDescription className="text-muted-foreground">
            {row.project_name} &mdash; {row.stage_name}
          </DialogDescription>
        </DialogHeader>

        <div className="space-y-4 py-2">
          <div className="space-y-2">
            <Label className="text-foreground">Payment Type</Label>
            <div className="flex gap-4">
              {(['full', 'partial'] as const).map((m) => (
                <label key={m} className="flex items-center gap-2 cursor-pointer">
                  <input
                    type="radio"
                    name="paymentMode"
                    checked={mode === m}
                    onChange={() => {
                      setMode(m)
                      if (m === 'full') setAmount(balance)
                    }}
                    className="accent-primary"
                  />
                  <span className="text-sm text-foreground capitalize">{m === 'full' ? 'Full Payment' : 'Partial Payment'}</span>
                </label>
              ))}
            </div>
          </div>

          <div className="space-y-2">
            <Label htmlFor="paymentAmount" className="text-foreground">Amount (₹)</Label>
            <Input
              id="paymentAmount"
              type="number"
              min={0}
              step={1}
              value={amount}
              disabled={mode === 'full'}
              onChange={(e) => setAmount(Number(e.target.value))}
              className="bg-background text-foreground border-border"
            />
            <p className="text-xs text-muted-foreground">
              Balance: {formatINR(balance)} &rarr; After payment: {formatINR(Math.max(0, newBalance))}
            </p>
          </div>

          <div className="space-y-2">
            <Label htmlFor="paymentDate" className="text-foreground">Payment Date</Label>
            <Input
              id="paymentDate"
              type="date"
              value={date}
              onChange={(e) => setDate(e.target.value)}
              className="bg-background text-foreground border-border"
            />
          </div>

          <div className="space-y-2">
            <Label htmlFor="paymentRef" className="text-foreground">Invoice / Reference #</Label>
            <Input
              id="paymentRef"
              placeholder="INV-001"
              value={reference}
              onChange={(e) => setReference(e.target.value)}
              className="bg-background text-foreground border-border"
            />
          </div>
        </div>

        <DialogFooter>
          <Button variant="outline" onClick={() => onOpenChange(false)} disabled={submitting}>
            Cancel
          </Button>
          <Button
            onClick={() => onSubmit({
              id: row.id,
              amount_paid: newTotalPaid,
              payment_received_date: date,
              invoice_number: reference || null,
              payment_status: mode === 'full' ? 'paid' : 'partial',
            })}
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
// Inline Invoice Number Editor
// ---------------------------------------------------------------------------

function InvoiceNumberCell({
  row,
  isAdmin,
  onSave,
}: {
  row: FeeStageWithProject
  isAdmin: boolean
  onSave: (id: string, invoiceNumber: string) => void
}) {
  const [editing, setEditing] = useState(false)
  const [value, setValue] = useState(row.invoice_number ?? '')
  const inputRef = useRef<HTMLInputElement>(null)

  const handleEdit = () => {
    setValue(row.invoice_number ?? '')
    setEditing(true)
    setTimeout(() => inputRef.current?.focus(), 50)
  }

  const handleSave = () => {
    if (value.trim() !== (row.invoice_number ?? '')) {
      onSave(row.id, value.trim())
    }
    setEditing(false)
  }

  const handleCancel = () => {
    setValue(row.invoice_number ?? '')
    setEditing(false)
  }

  if (editing) {
    return (
      <div className="flex items-center gap-1">
        <Input
          ref={inputRef}
          value={value}
          onChange={(e) => setValue(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === 'Enter') handleSave()
            if (e.key === 'Escape') handleCancel()
          }}
          className="h-7 w-28 text-xs bg-background border-border"
        />
        <button onClick={handleSave} className="text-emerald-400 hover:text-emerald-300">
          <Check className="h-3.5 w-3.5" />
        </button>
        <button onClick={handleCancel} className="text-muted-foreground hover:text-foreground">
          <X className="h-3.5 w-3.5" />
        </button>
      </div>
    )
  }

  return (
    <div className="flex items-center gap-1.5 group">
      {row.invoice_number ? (
        <span className="text-xs font-mono">{row.invoice_number}</span>
      ) : (
        <span className="text-xs text-muted-foreground italic">—</span>
      )}
      {isAdmin && (
        <button
          onClick={handleEdit}
          className="opacity-0 group-hover:opacity-100 transition-opacity text-muted-foreground hover:text-primary"
        >
          <Pencil className="h-3 w-3" />
        </button>
      )}
    </div>
  )
}

// ---------------------------------------------------------------------------
// Column helper
// ---------------------------------------------------------------------------

const columnHelper = createColumnHelper<FeeStageWithProject>()

// ---------------------------------------------------------------------------
// Main Page
// ---------------------------------------------------------------------------

// Undo stack entry
interface UndoEntry {
  label: string
  undo: () => Promise<void>
}

export function InvoicingPage() {
  const { selectedCompanyId } = useCompany()
  const { isAdmin } = useRole()
  const queryClient = useQueryClient()

  const { data: stages = [], isLoading } = useFeeStages(selectedCompanyId)

  // Filters
  const [statusFilter, setStatusFilter] = useState<string>('active')
  const [dateFrom, setDateFrom] = useState('')
  const [dateTo, setDateTo] = useState('')
  const [projectSearch, setProjectSearch] = useState('')
  const [showArchived, setShowArchived] = useState(false)

  // Table state
  const [sorting, setSorting] = useState<SortingState>([])
  const [rowSelection, setRowSelection] = useState<RowSelectionState>({})

  // Dialogs
  const [paymentRow, setPaymentRow] = useState<FeeStageWithProject | null>(null)
  const [paymentDialogOpen, setPaymentDialogOpen] = useState(false)

  // Undo stack
  const [undoEntry, setUndoEntry] = useState<UndoEntry | null>(null)

  // -----------------------------------------------------------------------
  // Filtered data
  // -----------------------------------------------------------------------

  const filteredData = useMemo(() => {
    let result = stages

    // Show/hide archived
    if (!showArchived) {
      result = result.filter((s) => !s.notes?.startsWith('[ARCHIVED]'))
    }

    // Status filter on computed display status
    if (statusFilter !== 'all') {
      if (statusFilter === 'active') {
        result = result.filter((s) => {
          const ds = getDisplayStatus(s)
          return ds !== 'paid' && ds !== 'archived'
        })
      } else {
        result = result.filter((s) => getDisplayStatus(s) === statusFilter)
      }
    }

    // Date range
    if (dateFrom) result = result.filter((s) => s.invoice_date && s.invoice_date >= dateFrom)
    if (dateTo) result = result.filter((s) => s.invoice_date && s.invoice_date <= dateTo)

    // Project search
    if (projectSearch.trim()) {
      const q = projectSearch.trim().toLowerCase()
      result = result.filter((s) => s.project_name.toLowerCase().includes(q))
    }

    return result
  }, [stages, statusFilter, dateFrom, dateTo, projectSearch, showArchived])

  // -----------------------------------------------------------------------
  // Mutations
  // -----------------------------------------------------------------------

  const updateStageMutation = useMutation({
    mutationFn: async (payload: { id: string; updates: Partial<FeeStage> }) => {
      const { error } = await supabase.from('fee_stages').update(payload.updates).eq('id', payload.id)
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['fee_stages', 'invoicing', selectedCompanyId] })
    },
  })

  const logPaymentMutation = useMutation({
    mutationFn: async (payload: {
      id: string
      amount_paid: number
      payment_received_date: string
      invoice_number: string | null
      payment_status: 'partial' | 'paid'
    }) => {
      // Capture previous state for undo
      const prev = stages.find((s) => s.id === payload.id)

      const { error } = await supabase.from('fee_stages').update({
        amount_paid: payload.amount_paid,
        payment_received_date: payload.payment_received_date,
        invoice_number: payload.invoice_number,
        payment_status: payload.payment_status,
      }).eq('id', payload.id)

      if (error) throw error
      await logAudit({ action: 'log_payment', entityType: 'fee_stage', entityId: payload.id, details: payload })

      return prev
    },
    onSuccess: (prev) => {
      queryClient.invalidateQueries({ queryKey: ['fee_stages', 'invoicing', selectedCompanyId] })
      setPaymentDialogOpen(false)
      setPaymentRow(null)
      if (prev) {
        setUndoEntry({
          label: 'Payment logged',
          undo: async () => {
            await supabase.from('fee_stages').update({
              amount_paid: prev.amount_paid,
              payment_received_date: prev.payment_received_date,
              invoice_number: prev.invoice_number,
              payment_status: prev.payment_status,
            }).eq('id', prev.id)
            queryClient.invalidateQueries({ queryKey: ['fee_stages', 'invoicing', selectedCompanyId] })
            setUndoEntry(null)
          },
        })
      }
    },
  })

  const markInvoicedMutation = useMutation({
    mutationFn: async (ids: string[]) => {
      const today = format(new Date(), 'yyyy-MM-dd')
      const prevStates = stages.filter((s) => ids.includes(s.id)).map((s) => ({
        id: s.id,
        payment_status: s.payment_status,
        invoice_date: s.invoice_date,
      }))

      const { error } = await supabase.from('fee_stages')
        .update({ payment_status: 'invoiced' as const, invoice_date: today })
        .in('id', ids)

      if (error) throw error
      await logAudit({ action: 'bulk_mark_invoiced', entityType: 'fee_stage', details: { ids, invoice_date: today } })
      return prevStates
    },
    onSuccess: (prevStates) => {
      queryClient.invalidateQueries({ queryKey: ['fee_stages', 'invoicing', selectedCompanyId] })
      setRowSelection({})
      setUndoEntry({
        label: `Marked ${prevStates.length} as invoiced`,
        undo: async () => {
          for (const prev of prevStates) {
            await supabase.from('fee_stages').update({
              payment_status: prev.payment_status,
              invoice_date: prev.invoice_date,
            }).eq('id', prev.id)
          }
          queryClient.invalidateQueries({ queryKey: ['fee_stages', 'invoicing', selectedCompanyId] })
          setUndoEntry(null)
        },
      })
    },
  })

  const archiveMutation = useMutation({
    mutationFn: async (ids: string[]) => {
      const prevNotes = stages.filter((s) => ids.includes(s.id)).map((s) => ({ id: s.id, notes: s.notes }))

      for (const id of ids) {
        const stage = stages.find((s) => s.id === id)
        const newNotes = `[ARCHIVED] ${stage?.notes ?? ''}`.trim()
        const { error } = await supabase.from('fee_stages').update({ notes: newNotes }).eq('id', id)
        if (error) throw error
      }

      return prevNotes
    },
    onSuccess: (prevNotes) => {
      queryClient.invalidateQueries({ queryKey: ['fee_stages', 'invoicing', selectedCompanyId] })
      setRowSelection({})
      setUndoEntry({
        label: `Archived ${prevNotes.length} row(s)`,
        undo: async () => {
          for (const prev of prevNotes) {
            await supabase.from('fee_stages').update({ notes: prev.notes }).eq('id', prev.id)
          }
          queryClient.invalidateQueries({ queryKey: ['fee_stages', 'invoicing', selectedCompanyId] })
          setUndoEntry(null)
        },
      })
    },
  })

  // -----------------------------------------------------------------------
  // Columns
  // -----------------------------------------------------------------------

  const columns = useMemo(() => [
    // Checkbox (sticky col 0)
    columnHelper.display({
      id: 'select',
      header: ({ table }) => isAdmin ? (
        <Checkbox
          checked={table.getIsAllPageRowsSelected() || (table.getIsSomePageRowsSelected() && 'indeterminate')}
          onCheckedChange={(v) => table.toggleAllPageRowsSelected(!!v)}
          aria-label="Select all"
        />
      ) : null,
      cell: ({ row }) => isAdmin ? (
        <Checkbox
          checked={row.getIsSelected()}
          onCheckedChange={(v) => row.toggleSelected(!!v)}
          aria-label="Select row"
        />
      ) : null,
      enableSorting: false,
    }),

    // Project name (sticky col 1)
    columnHelper.accessor('project_name', {
      header: ({ column }) => (
        <button className="flex items-center gap-1 text-xs font-semibold text-left hover:text-foreground" onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}>
          Project Name <ArrowUpDown className="h-3 w-3 shrink-0" />
        </button>
      ),
      cell: (info) => <span className="font-medium text-xs">{info.getValue()}</span>,
    }),

    columnHelper.accessor('stage_name', {
      header: 'Stage',
      cell: (info) => <span className="text-xs">{info.getValue()}</span>,
    }),

    columnHelper.accessor('lumpsum_amount', {
      header: ({ column }) => (
        <button className="flex items-center gap-1 text-xs font-semibold hover:text-foreground" onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}>
          Amount <ArrowUpDown className="h-3 w-3" />
        </button>
      ),
      cell: (info) => <span className="text-xs font-mono">{formatINR(info.getValue())}</span>,
    }),

    // Invoice # with inline edit (admin)
    columnHelper.accessor('invoice_number', {
      header: 'Invoice #',
      cell: ({ row }) => (
        <InvoiceNumberCell
          row={row.original}
          isAdmin={isAdmin}
          onSave={(id, invoiceNumber) => {
            updateStageMutation.mutate({ id, updates: { invoice_number: invoiceNumber || null } })
          }}
        />
      ),
    }),

    columnHelper.accessor('invoice_date', {
      header: ({ column }) => (
        <button className="flex items-center gap-1 text-xs font-semibold hover:text-foreground" onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}>
          Invoice Date <ArrowUpDown className="h-3 w-3" />
        </button>
      ),
      cell: (info) => {
        const v = info.getValue()
        return v ? <span className="text-xs">{format(new Date(v), 'dd MMM yyyy')}</span> : <span className="text-muted-foreground text-xs">—</span>
      },
    }),

    // Display status (derived)
    columnHelper.display({
      id: 'display_status',
      header: 'Status',
      cell: ({ row }) => <StatusBadge status={getDisplayStatus(row.original)} />,
    }),

    columnHelper.accessor('amount_paid', {
      header: 'Paid',
      cell: (info) => <span className="text-xs font-mono text-emerald-400">{formatINR(info.getValue())}</span>,
    }),

    columnHelper.accessor(
      (row) => (row.lumpsum_amount ?? 0) - (row.amount_paid ?? 0),
      {
        id: 'balance',
        header: ({ column }) => (
          <button className="flex items-center gap-1 text-xs font-semibold hover:text-foreground" onClick={() => column.toggleSorting(column.getIsSorted() === 'asc')}>
            Balance <ArrowUpDown className="h-3 w-3" />
          </button>
        ),
        cell: (info) => {
          const v = info.getValue()
          return <span className={`text-xs font-mono ${v > 0 ? 'text-amber-400' : 'text-muted-foreground'}`}>{formatINR(v)}</span>
        },
      },
    ),

    columnHelper.accessor(
      (row) => {
        if (!row.invoice_date || row.payment_status === 'paid') return null
        return differenceInDays(new Date(), new Date(row.invoice_date))
      },
      {
        id: 'days_outstanding',
        header: 'Days Out',
        cell: (info) => {
          const v = info.getValue()
          if (v == null) return <span className="text-muted-foreground text-xs">—</span>
          return (
            <span className={`text-xs font-semibold px-1.5 py-0.5 rounded border ${
              v > 60 ? 'bg-red-500/10 text-red-400 border-red-500/20'
              : v > 30 ? 'bg-amber-500/10 text-amber-400 border-amber-500/20'
              : 'bg-muted text-muted-foreground border-border'
            }`}>
              {v}d
            </span>
          )
        },
        sortUndefined: 'last',
      },
    ),

    // Actions
    columnHelper.display({
      id: 'actions',
      header: '',
      cell: ({ row }) => (
        <RequiresAdmin>
          <Button
            variant="ghost"
            size="sm"
            className="h-7 text-xs"
            onClick={() => {
              setPaymentRow(row.original)
              setPaymentDialogOpen(true)
            }}
          >
            <CreditCard className="mr-1 h-3 w-3" />
            Log Payment
          </Button>
        </RequiresAdmin>
      ),
    }),
  ], [isAdmin, updateStageMutation])

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

  const selectedIds = Object.keys(rowSelection).filter((k) => rowSelection[k])

  // -----------------------------------------------------------------------
  // Render
  // -----------------------------------------------------------------------

  if (isLoading) {
    return (
      <div className="space-y-4 p-6">
        <Skeleton className="h-8 w-48" />
        <div className="flex gap-3">
          {Array.from({ length: 4 }).map((_, i) => <Skeleton key={i} className="h-9 w-36" />)}
        </div>
        <Skeleton className="h-[400px] w-full rounded-xl" />
      </div>
    )
  }

  return (
    <div className="space-y-4 p-6">
      {/* Header */}
      <div className="flex items-center justify-between flex-wrap gap-3">
        <div>
          <h1 className="text-2xl font-bold tracking-tight">Invoicing</h1>
          <p className="text-sm text-muted-foreground">{filteredData.length} records</p>
        </div>

        <div className="flex items-center gap-2 flex-wrap">
          {/* Undo button */}
          {undoEntry && (
            <Button
              variant="outline"
              size="sm"
              className="text-xs border-amber-500/30 text-amber-400 hover:bg-amber-500/10 gap-1.5"
              onClick={() => undoEntry.undo()}
            >
              <RotateCcw className="h-3 w-3" />
              Undo: {undoEntry.label}
            </Button>
          )}

          <RequiresAdmin>
            <>
              {selectedIds.length > 0 && (
                <>
                  <Button
                    size="sm"
                    variant="outline"
                    className="text-xs gap-1.5"
                    onClick={() => archiveMutation.mutate(selectedIds)}
                    disabled={archiveMutation.isPending}
                  >
                    <Archive className="h-3.5 w-3.5" />
                    Archive ({selectedIds.length})
                  </Button>
                  <Button
                    size="sm"
                    className="text-xs gap-1.5"
                    onClick={() => markInvoicedMutation.mutate(selectedIds)}
                    disabled={markInvoicedMutation.isPending}
                  >
                    <CheckCircle2 className="h-3.5 w-3.5" />
                    {markInvoicedMutation.isPending ? 'Updating...' : `Mark Invoiced (${selectedIds.length})`}
                  </Button>
                </>
              )}
            </>
          </RequiresAdmin>
        </div>
      </div>

      {/* Filters */}
      <div className="flex flex-wrap items-end gap-3">
        <div className="space-y-1">
          <Label className="text-xs text-muted-foreground">Status</Label>
          <Select value={statusFilter} onValueChange={setStatusFilter}>
            <SelectTrigger className="w-[160px] bg-card border-border text-foreground">
              <SelectValue />
            </SelectTrigger>
            <SelectContent className="bg-card border-border text-foreground z-50">
              <SelectItem value="active">Active (unpaid)</SelectItem>
              <SelectItem value="all">All Statuses</SelectItem>
              <SelectItem value="uninvoiced">Uninvoiced</SelectItem>
              <SelectItem value="invoiced">Invoiced</SelectItem>
              <SelectItem value="partial">Partial</SelectItem>
              <SelectItem value="paid">Paid</SelectItem>
              {showArchived && <SelectItem value="archived">Archived</SelectItem>}
            </SelectContent>
          </Select>
        </div>

        <div className="space-y-1">
          <Label className="text-xs text-muted-foreground">From</Label>
          <Input type="date" className="w-[155px] bg-card border-border text-foreground" value={dateFrom} onChange={(e) => setDateFrom(e.target.value)} />
        </div>

        <div className="space-y-1">
          <Label className="text-xs text-muted-foreground">To</Label>
          <Input type="date" className="w-[155px] bg-card border-border text-foreground" value={dateTo} onChange={(e) => setDateTo(e.target.value)} />
        </div>

        <div className="space-y-1">
          <Label className="text-xs text-muted-foreground">Project</Label>
          <div className="relative">
            <Search className="absolute left-2.5 top-2.5 h-3.5 w-3.5 text-muted-foreground" />
            <Input
              className="w-[200px] pl-8 bg-card border-border text-foreground"
              placeholder="Search project..."
              value={projectSearch}
              onChange={(e) => setProjectSearch(e.target.value)}
            />
          </div>
        </div>

        <RequiresAdmin>
          <div className="flex items-center gap-2 mt-4">
            <Checkbox
              id="showArchived"
              checked={showArchived}
              onCheckedChange={(v) => setShowArchived(!!v)}
            />
            <Label htmlFor="showArchived" className="text-xs text-muted-foreground cursor-pointer">
              Show archived
            </Label>
          </div>
        </RequiresAdmin>
      </div>

      {/* Table */}
      {filteredData.length === 0 ? (
        <EmptyState
          icon={FileText}
          title="No fee stages found"
          description="No fee stages match your current filters."
        />
      ) : (
        <Card className="overflow-hidden border-border">
          <CardContent className="p-0">
            {/* Scrollable container — header is sticky, first 2 columns are sticky */}
            <div className="overflow-auto max-h-[calc(100vh-280px)]">
              <table className="w-full caption-bottom text-sm">
                <thead className="sticky top-0 z-30 bg-card border-b border-border">
                  {table.getHeaderGroups().map((hg) => (
                    <tr key={hg.id}>
                      {hg.headers.map((header, i) => (
                        <th
                          key={header.id}
                          className={`h-10 px-3 text-left align-middle text-xs font-semibold text-muted-foreground whitespace-nowrap bg-card ${
                            i === 0 ? 'sticky left-0 z-40 w-10' :
                            i === 1 ? 'sticky left-10 z-40 border-r border-border min-w-[180px]' : ''
                          }`}
                        >
                          {header.isPlaceholder ? null : flexRender(header.column.columnDef.header, header.getContext())}
                        </th>
                      ))}
                    </tr>
                  ))}
                </thead>
                <tbody>
                  {table.getRowModel().rows.map((row) => {
                    const isArchived = row.original.notes?.startsWith('[ARCHIVED]')
                    return (
                      <tr
                        key={row.id}
                        data-state={row.getIsSelected() && 'selected'}
                        className={`border-b border-border/60 transition-colors hover:bg-muted/40 ${
                          row.getIsSelected() ? 'bg-primary/5' : ''
                        } ${isArchived ? 'opacity-50' : ''}`}
                      >
                        {row.getVisibleCells().map((cell, i) => (
                          <td
                            key={cell.id}
                            className={`px-3 py-2.5 align-middle whitespace-nowrap bg-card ${
                              i === 0 ? 'sticky left-0 z-20' :
                              i === 1 ? 'sticky left-10 z-20 border-r border-border/60' : ''
                            } ${row.getIsSelected() ? '!bg-primary/5' : ''}`}
                          >
                            {flexRender(cell.column.columnDef.cell, cell.getContext())}
                          </td>
                        ))}
                      </tr>
                    )
                  })}
                </tbody>
              </table>
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
