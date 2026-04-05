import { useState, useMemo } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import {
  useReactTable,
  getCoreRowModel,
  getSortedRowModel,
  flexRender,
  createColumnHelper,
  type SortingState,
} from '@tanstack/react-table'
import { useForm } from 'react-hook-form'
import {
  DndContext,
  closestCenter,
  KeyboardSensor,
  PointerSensor,
  useSensor,
  useSensors,
  type DragEndEvent,
} from '@dnd-kit/core'
import {
  arrayMove,
  SortableContext,
  sortableKeyboardCoordinates,
  useSortable,
  verticalListSortingStrategy,
} from '@dnd-kit/sortable'
import { CSS } from '@dnd-kit/utilities'
import { format } from 'date-fns'
import {
  ArrowLeft,
  Pencil,
  Plus,
  GripVertical,
  Trash2,
  CreditCard,
  Upload,
  Clock,
  FileText,
  Plane,
  IndianRupee,
  ArrowUpDown,
  ArrowUp,
  ArrowDown,
  CircleDot,
  Calendar,
  CheckCircle2,
  AlertCircle,
} from 'lucide-react'

import { supabase } from '@/lib/supabase'
import { formatINR } from '@/lib/format'
import { logAudit } from '@/lib/audit'
import { useCompany } from '@/hooks/useCompany'
import { useRole } from '@/hooks/useRole'

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Badge } from '@/components/ui/badge'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Skeleton } from '@/components/ui/skeleton'
import { Separator } from '@/components/ui/separator'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from '@/components/ui/dialog'
import {
  Tabs,
  TabsContent,
  TabsList,
  TabsTrigger,
} from '@/components/ui/tabs'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import {
  ProjectStatusBadge,
  PaymentStatusBadge,
} from '@/components/shared/StatusBadge'
import { KPICard } from '@/components/shared/KPICard'

import type {
  Project,
  FeeStage,
  TravelReimbursable,
  AuditLogEntry,
  ProjectStatus,
  PaymentStatus,
  DueTrigger,
  ReimbursableCategory,
} from '@/types/database'

/* ================================================================
   TYPES
   ================================================================ */

interface AddStageForm {
  stage_name: string
  stage_number: string
  percentage_of_total: string
  lumpsum_amount: string
  due_trigger: DueTrigger
  notes: string
}

interface LogPaymentForm {
  amount: string
  payment_received_date: string
  invoice_number: string
  payment_type: 'partial' | 'full'
}

interface EditProjectForm {
  project_name: string
  client_name: string
  client_contact: string
  areas_under_design: string
  total_contract_value: string
  contract_tenure_start: string
  contract_tenure_end: string
  status: ProjectStatus
  notes: string
}

interface AddReimbursableForm {
  description: string
  category: ReimbursableCategory
  amount: string
  date: string
  invoice_ref: string
}

/* ================================================================
   SORTABLE ROW COMPONENT
   ================================================================ */

function SortableRow({
  id,
  children,
  disabled,
}: {
  id: string
  children: React.ReactNode
  disabled?: boolean
}) {
  const {
    attributes,
    listeners,
    setNodeRef,
    transform,
    transition,
    isDragging,
  } = useSortable({ id, disabled })

  const style = {
    transform: CSS.Transform.toString(transform),
    transition,
    opacity: isDragging ? 0.5 : 1,
  }

  return (
    <TableRow ref={setNodeRef} style={style} {...attributes}>
      <TableCell className="w-8 px-2">
        {!disabled && (
          <button
            {...listeners}
            className="cursor-grab active:cursor-grabbing p-1 text-muted-foreground hover:text-foreground"
            aria-label="Drag to reorder"
          >
            <GripVertical className="h-4 w-4" />
          </button>
        )}
      </TableCell>
      {children}
    </TableRow>
  )
}

/* ================================================================
   SORT ICON HELPER
   ================================================================ */

function SortIcon({ column }: { column: any }) {
  const sorted = column.getIsSorted()
  if (sorted === 'asc') return <ArrowUp className="ml-1 h-3.5 w-3.5 inline" />
  if (sorted === 'desc')
    return <ArrowDown className="ml-1 h-3.5 w-3.5 inline" />
  return <ArrowUpDown className="ml-1 h-3.5 w-3.5 inline opacity-40" />
}

/* ================================================================
   MAIN COMPONENT
   ================================================================ */

export function ProjectDetailPage() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const queryClient = useQueryClient()
  useCompany()
  const { isAdmin } = useRole()

  /* ----- Dialog states ----- */
  const [editDialogOpen, setEditDialogOpen] = useState(false)
  const [addStageOpen, setAddStageOpen] = useState(false)
  const [paymentStageId, setPaymentStageId] = useState<string | null>(null)
  const [deleteStageId, setDeleteStageId] = useState<string | null>(null)
  const [addReimbursableOpen, setAddReimbursableOpen] = useState(false)

  /* ----- Table sorting ----- */
  const [feeSorting, setFeeSorting] = useState<SortingState>([])
  const [travelSorting, setTravelSorting] = useState<SortingState>([])

  /* ================================================================
     DATA FETCHING
     ================================================================ */

  const { data: project, isLoading: projectLoading } = useQuery({
    queryKey: ['project', id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('projects')
        .select('*')
        .eq('id', id!)
        .single()
      if (error) throw error
      return data as Project
    },
    enabled: !!id,
  })

  const { data: feeStages = [] } = useQuery({
    queryKey: ['fee_stages', id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('fee_stages')
        .select('*')
        .eq('project_id', id!)
        .order('stage_number', { ascending: true })
      if (error) throw error
      return data as FeeStage[]
    },
    enabled: !!id,
  })

  const { data: reimbursables = [], isLoading: reimbursablesLoading } =
    useQuery({
      queryKey: ['travel_reimbursables', id],
      queryFn: async () => {
        const { data, error } = await supabase
          .from('travel_reimbursables')
          .select('*')
          .eq('project_id', id!)
          .order('date', { ascending: false })
        if (error) throw error
        return data as TravelReimbursable[]
      },
      enabled: !!id,
    })

  const { data: auditEntries = [] } = useQuery({
    queryKey: ['audit_log', 'project', id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('audit_log')
        .select('*')
        .eq('entity_type', 'project')
        .eq('entity_id', id!)
        .order('created_at', { ascending: false })
      if (error) throw error
      return data as AuditLogEntry[]
    },
    enabled: !!id,
  })

  /* ================================================================
     COMPUTED VALUES
     ================================================================ */

  const totalCollected = useMemo(
    () => feeStages.reduce((sum, s) => sum + (s.amount_paid ?? 0), 0),
    [feeStages],
  )

  const contractTotal = project?.total_contract_value ?? 0
  const totalPending = contractTotal - totalCollected
  const progressPercent =
    contractTotal > 0
      ? Math.min(100, Math.round((totalCollected / contractTotal) * 100))
      : 0

  const totalPercentAllocated = useMemo(
    () =>
      feeStages.reduce((sum, s) => sum + (s.percentage_of_total ?? 0), 0),
    [feeStages],
  )

  const reimbursableTotal = useMemo(
    () => reimbursables.reduce((sum, r) => sum + (r.amount ?? 0), 0),
    [reimbursables],
  )
  const reimbursableReimbursed = useMemo(
    () =>
      reimbursables
        .filter((r) => r.reimbursed)
        .reduce((sum, r) => sum + (r.amount ?? 0), 0),
    [reimbursables],
  )
  const reimbursablePending = reimbursableTotal - reimbursableReimbursed

  /* ================================================================
     EDIT PROJECT
     ================================================================ */

  const editForm = useForm<EditProjectForm>()

  const openEditDialog = () => {
    if (!project) return
    editForm.reset({
      project_name: project.project_name,
      client_name: project.client_name,
      client_contact: project.client_contact ?? '',
      areas_under_design: (project.areas_under_design ?? []).join(', '),
      total_contract_value: project.total_contract_value?.toString() ?? '',
      contract_tenure_start: project.contract_tenure_start ?? '',
      contract_tenure_end: project.contract_tenure_end ?? '',
      status: project.status ?? 'active',
      notes: project.notes ?? '',
    })
    setEditDialogOpen(true)
  }

  const editMutation = useMutation({
    mutationFn: async (formData: EditProjectForm) => {
      const areas = formData.areas_under_design
        .split(',')
        .map((a) => a.trim())
        .filter(Boolean)

      const { error } = await supabase
        .from('projects')
        .update({
          project_name: formData.project_name,
          client_name: formData.client_name,
          client_contact: formData.client_contact || null,
          areas_under_design: areas.length > 0 ? areas : null,
          total_contract_value: formData.total_contract_value
            ? Number(formData.total_contract_value)
            : null,
          contract_tenure_start: formData.contract_tenure_start || null,
          contract_tenure_end: formData.contract_tenure_end || null,
          status: formData.status,
          notes: formData.notes || null,
        })
        .eq('id', id!)

      if (error) throw error
    },
    onSuccess: async () => {
      await logAudit({
        action: 'Updated project',
        entityType: 'project',
        entityId: id!,
        details: { project_name: editForm.getValues('project_name') },
      })
      queryClient.invalidateQueries({ queryKey: ['project', id] })
      queryClient.invalidateQueries({ queryKey: ['projects'] })
      setEditDialogOpen(false)
    },
  })

  /* ================================================================
     ADD STAGE
     ================================================================ */

  const stageForm = useForm<AddStageForm>({
    defaultValues: { due_trigger: 'on_invoice' },
  })

  const watchPercentage = stageForm.watch('percentage_of_total')
  const autoLumpsum = useMemo(() => {
    const pct = parseFloat(watchPercentage)
    if (isNaN(pct) || !contractTotal) return ''
    return Math.round((pct / 100) * contractTotal).toString()
  }, [watchPercentage, contractTotal])

  const addStageMutation = useMutation({
    mutationFn: async (formData: AddStageForm) => {
      const lumpsumOverride = formData.lumpsum_amount
        ? Number(formData.lumpsum_amount)
        : Number(autoLumpsum) || null

      const { data, error } = await supabase
        .from('fee_stages')
        .insert({
          project_id: id!,
          stage_name: formData.stage_name,
          stage_number: Number(formData.stage_number),
          percentage_of_total: formData.percentage_of_total
            ? Number(formData.percentage_of_total)
            : null,
          lumpsum_amount: lumpsumOverride,
          due_trigger: formData.due_trigger,
          notes: formData.notes || null,
        })
        .select()
        .single()

      if (error) throw error
      return data
    },
    onSuccess: async (data) => {
      await logAudit({
        action: 'Added fee stage',
        entityType: 'fee_stage',
        entityId: data.id,
        details: { project_id: id, stage_name: data.stage_name },
      })
      queryClient.invalidateQueries({ queryKey: ['fee_stages', id] })
      stageForm.reset({ due_trigger: 'on_invoice' })
      setAddStageOpen(false)
    },
  })

  /* ================================================================
     LOG PAYMENT
     ================================================================ */

  const paymentForm = useForm<LogPaymentForm>({
    defaultValues: { payment_type: 'full' },
  })

  const paymentMutation = useMutation({
    mutationFn: async (formData: LogPaymentForm) => {
      if (!paymentStageId) throw new Error('No stage selected')

      const stage = feeStages.find((s) => s.id === paymentStageId)
      if (!stage) throw new Error('Stage not found')

      const paymentAmount = Number(formData.amount)
      const newAmountPaid = stage.amount_paid + paymentAmount
      const stageTotal = stage.lumpsum_amount ?? 0

      let newStatus: PaymentStatus = 'partial'
      if (formData.payment_type === 'full' || newAmountPaid >= stageTotal) {
        newStatus = 'paid'
      }

      const { error } = await supabase
        .from('fee_stages')
        .update({
          amount_paid: newAmountPaid,
          payment_status: newStatus,
          payment_received_date: formData.payment_received_date || null,
          invoice_number: formData.invoice_number || stage.invoice_number,
          invoice_date: stage.invoice_date ?? new Date().toISOString().split('T')[0],
        })
        .eq('id', paymentStageId)

      if (error) throw error

      return { stageId: paymentStageId, amount: paymentAmount }
    },
    onSuccess: async (data) => {
      await logAudit({
        action: 'Logged payment',
        entityType: 'fee_stage',
        entityId: data.stageId,
        details: {
          project_id: id,
          amount: data.amount,
        },
      })
      queryClient.invalidateQueries({ queryKey: ['fee_stages', id] })
      queryClient.invalidateQueries({ queryKey: ['projects'] })
      paymentForm.reset({ payment_type: 'full' })
      setPaymentStageId(null)
    },
  })

  /* ================================================================
     DELETE STAGE
     ================================================================ */

  const deleteStageMutation = useMutation({
    mutationFn: async (stageId: string) => {
      const { error } = await supabase
        .from('fee_stages')
        .delete()
        .eq('id', stageId)
      if (error) throw error
    },
    onSuccess: async () => {
      await logAudit({
        action: 'Deleted fee stage',
        entityType: 'fee_stage',
        entityId: deleteStageId!,
        details: { project_id: id },
      })
      queryClient.invalidateQueries({ queryKey: ['fee_stages', id] })
      setDeleteStageId(null)
    },
  })

  /* ================================================================
     DRAG & DROP REORDER
     ================================================================ */

  const sensors = useSensors(
    useSensor(PointerSensor),
    useSensor(KeyboardSensor, {
      coordinateGetter: sortableKeyboardCoordinates,
    }),
  )

  const handleDragEnd = async (event: DragEndEvent) => {
    const { active, over } = event
    if (!over || active.id === over.id) return

    const oldIndex = feeStages.findIndex((s) => s.id === active.id)
    const newIndex = feeStages.findIndex((s) => s.id === over.id)
    const reordered = arrayMove(feeStages, oldIndex, newIndex)

    // Optimistic update
    queryClient.setQueryData(['fee_stages', id], reordered)

    // Persist new order
    for (let i = 0; i < reordered.length; i++) {
      await supabase
        .from('fee_stages')
        .update({ stage_number: i + 1 })
        .eq('id', reordered[i].id)
    }

    queryClient.invalidateQueries({ queryKey: ['fee_stages', id] })
  }

  /* ================================================================
     ADD REIMBURSABLE
     ================================================================ */

  const reimbursableForm = useForm<AddReimbursableForm>({
    defaultValues: { category: 'travel' },
  })

  const addReimbursableMutation = useMutation({
    mutationFn: async (formData: AddReimbursableForm) => {
      const { data, error } = await supabase
        .from('travel_reimbursables')
        .insert({
          project_id: id!,
          description: formData.description || null,
          category: formData.category,
          amount: formData.amount ? Number(formData.amount) : null,
          date: formData.date || null,
          invoice_ref: formData.invoice_ref || null,
        })
        .select()
        .single()

      if (error) throw error
      return data
    },
    onSuccess: async (data) => {
      await logAudit({
        action: 'Added reimbursable',
        entityType: 'travel_reimbursable',
        entityId: data.id,
        details: { project_id: id, amount: data.amount },
      })
      queryClient.invalidateQueries({
        queryKey: ['travel_reimbursables', id],
      })
      reimbursableForm.reset({ category: 'travel' })
      setAddReimbursableOpen(false)
    },
  })

  /* ================================================================
     FEE STAGES TABLE COLUMNS
     ================================================================ */

  const feeColumnHelper = createColumnHelper<FeeStage>()

  const feeColumns = useMemo(
    () => [
      feeColumnHelper.accessor('stage_number', {
        header: '#',
        cell: (info) => (
          <span className="font-mono text-sm">{info.getValue()}</span>
        ),
      }),
      feeColumnHelper.accessor('stage_name', {
        header: 'Stage Name',
        cell: (info) => (
          <span className="font-medium">{info.getValue()}</span>
        ),
      }),
      feeColumnHelper.accessor('percentage_of_total', {
        header: '%',
        cell: (info) => {
          const val = info.getValue()
          return val != null ? `${val}%` : '--'
        },
      }),
      feeColumnHelper.accessor('lumpsum_amount', {
        header: 'Lump Sum',
        cell: (info) => (
          <span className="font-mono">{formatINR(info.getValue())}</span>
        ),
      }),
      feeColumnHelper.accessor('invoice_number', {
        header: 'Invoice #',
        cell: (info) => info.getValue() ?? '--',
      }),
      feeColumnHelper.accessor('invoice_date', {
        header: 'Invoice Date',
        cell: (info) => {
          const val = info.getValue()
          return val ? format(new Date(val), 'dd MMM yyyy') : '--'
        },
      }),
      feeColumnHelper.accessor('payment_status', {
        header: 'Payment Status',
        cell: (info) => <PaymentStatusBadge status={info.getValue()} />,
      }),
      feeColumnHelper.accessor('amount_paid', {
        header: 'Amount Paid',
        cell: (info) => (
          <span className="font-mono text-emerald-600 dark:text-emerald-400">
            {formatINR(info.getValue())}
          </span>
        ),
      }),
      feeColumnHelper.display({
        id: 'balance',
        header: 'Balance',
        cell: (info) => {
          const row = info.row.original
          const balance = (row.lumpsum_amount ?? 0) - row.amount_paid
          return (
            <span
              className={`font-mono ${balance > 0 ? 'text-amber-600 dark:text-amber-400' : 'text-muted-foreground'}`}
            >
              {formatINR(balance)}
            </span>
          )
        },
      }),
      feeColumnHelper.accessor('notes', {
        header: 'Notes',
        cell: (info) => (
          <span className="text-sm text-muted-foreground truncate max-w-[120px] block">
            {info.getValue() ?? '--'}
          </span>
        ),
      }),
      feeColumnHelper.display({
        id: 'actions',
        header: 'Actions',
        cell: (info) => (
          <div className="flex items-center gap-1">
            <Button
              variant="ghost"
              size="sm"
              onClick={(e) => {
                e.stopPropagation()
                paymentForm.reset({
                  payment_type: 'full',
                  amount: '',
                  payment_received_date: '',
                  invoice_number: '',
                })
                setPaymentStageId(info.row.original.id)
              }}
            >
              <CreditCard className="h-3.5 w-3.5 mr-1" />
              Pay
            </Button>
            {isAdmin && (
              <Button
                variant="ghost"
                size="sm"
                className="text-destructive hover:text-destructive"
                onClick={(e) => {
                  e.stopPropagation()
                  setDeleteStageId(info.row.original.id)
                }}
              >
                <Trash2 className="h-3.5 w-3.5" />
              </Button>
            )}
          </div>
        ),
      }),
    ],
    [isAdmin],
  )

  const feeTable = useReactTable({
    data: feeStages,
    columns: feeColumns,
    state: { sorting: feeSorting },
    onSortingChange: setFeeSorting,
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
  })

  /* ================================================================
     TRAVEL TABLE COLUMNS
     ================================================================ */

  const travelColumnHelper = createColumnHelper<TravelReimbursable>()

  const travelColumns = useMemo(
    () => [
      travelColumnHelper.accessor('description', {
        header: 'Description',
        cell: (info) => info.getValue() ?? '--',
      }),
      travelColumnHelper.accessor('category', {
        header: 'Category',
        cell: (info) => {
          const val = info.getValue()
          return val ? (
            <Badge variant="outline" className="capitalize">
              {val}
            </Badge>
          ) : (
            '--'
          )
        },
      }),
      travelColumnHelper.accessor('amount', {
        header: 'Amount',
        cell: (info) => (
          <span className="font-mono">{formatINR(info.getValue())}</span>
        ),
      }),
      travelColumnHelper.accessor('date', {
        header: 'Date',
        cell: (info) => {
          const val = info.getValue()
          return val ? format(new Date(val), 'dd MMM yyyy') : '--'
        },
      }),
      travelColumnHelper.accessor('invoice_ref', {
        header: 'Invoice Ref',
        cell: (info) => info.getValue() ?? '--',
      }),
      travelColumnHelper.accessor('reimbursed', {
        header: 'Status',
        cell: (info) =>
          info.getValue() ? (
            <Badge variant="success">Reimbursed</Badge>
          ) : (
            <Badge variant="warning">Pending</Badge>
          ),
      }),
    ],
    [],
  )

  const travelTable = useReactTable({
    data: reimbursables,
    columns: travelColumns,
    state: { sorting: travelSorting },
    onSortingChange: setTravelSorting,
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
  })

  /* ================================================================
     TIMELINE DATA
     ================================================================ */

  const timelineEvents = useMemo(() => {
    // Build events from audit log
    const events: Array<{
      id: string
      date: string
      user: string
      action: string
      amount?: number
      type: 'audit' | 'invoice' | 'payment'
    }> = []

    auditEntries.forEach((entry) => {
      events.push({
        id: entry.id,
        date: entry.created_at,
        user: entry.user_name ?? 'System',
        action: entry.action,
        amount: (entry.details as any)?.amount ?? undefined,
        type: 'audit',
      })
    })

    // If no audit entries, fall back to fee stage events
    if (auditEntries.length === 0) {
      feeStages.forEach((stage) => {
        if (stage.invoice_date) {
          events.push({
            id: `inv-${stage.id}`,
            date: stage.invoice_date,
            user: 'System',
            action: `Invoice #${stage.invoice_number ?? 'N/A'} raised for "${stage.stage_name}"`,
            amount: stage.lumpsum_amount ?? undefined,
            type: 'invoice',
          })
        }
        if (stage.payment_received_date && stage.amount_paid > 0) {
          events.push({
            id: `pay-${stage.id}`,
            date: stage.payment_received_date,
            user: 'System',
            action: `Payment received for "${stage.stage_name}"`,
            amount: stage.amount_paid,
            type: 'payment',
          })
        }
      })
    }

    // Sort by date descending
    events.sort(
      (a, b) => new Date(b.date).getTime() - new Date(a.date).getTime(),
    )

    return events
  }, [auditEntries, feeStages])

  /* ================================================================
     LOADING STATE
     ================================================================ */

  if (projectLoading) {
    return (
      <div className="space-y-6 p-6">
        <div className="flex items-center gap-4">
          <Skeleton className="h-8 w-8" />
          <Skeleton className="h-8 w-64" />
        </div>
        <Card>
          <CardContent className="p-6 space-y-4">
            <Skeleton className="h-6 w-48" />
            <Skeleton className="h-4 w-32" />
            <div className="flex gap-4">
              <Skeleton className="h-10 w-32" />
              <Skeleton className="h-10 w-32" />
              <Skeleton className="h-10 w-32" />
            </div>
          </CardContent>
        </Card>
        <Skeleton className="h-10 w-full max-w-md" />
        <Card>
          <CardContent className="p-6">
            {Array.from({ length: 5 }).map((_, i) => (
              <Skeleton key={i} className="h-12 w-full mb-2" />
            ))}
          </CardContent>
        </Card>
      </div>
    )
  }

  if (!project) {
    return (
      <div className="flex flex-col items-center justify-center py-24 text-center">
        <h2 className="text-xl font-semibold mb-2">Project not found</h2>
        <p className="text-muted-foreground mb-4">
          The project you are looking for does not exist.
        </p>
        <Button variant="outline" onClick={() => navigate('/projects')}>
          <ArrowLeft className="mr-2 h-4 w-4" />
          Back to Projects
        </Button>
      </div>
    )
  }

  /* ================================================================
     RENDER
     ================================================================ */

  return (
    <div className="space-y-6 p-6">
      {/* Back button */}
      <Button
        variant="ghost"
        size="sm"
        onClick={() => navigate('/projects')}
        className="mb-2"
      >
        <ArrowLeft className="mr-2 h-4 w-4" />
        Back to Projects
      </Button>

      {/* ============ HEADER CARD ============ */}
      <Card>
        <CardContent className="p-6">
          <div className="flex flex-col md:flex-row md:items-start md:justify-between gap-4">
            <div className="space-y-3">
              <div className="flex items-center gap-3">
                <h1 className="text-2xl font-bold tracking-tight">
                  {project.project_name}
                </h1>
                <ProjectStatusBadge status={project.status} />
              </div>
              <p className="text-muted-foreground">{project.client_name}</p>

              <div className="flex flex-wrap items-center gap-4 text-sm text-muted-foreground">
                <div className="flex items-center gap-1.5">
                  <IndianRupee className="h-4 w-4" />
                  <span className="font-mono font-semibold text-foreground">
                    {formatINR(project.total_contract_value)}
                  </span>
                </div>
                {project.contract_tenure_start && (
                  <div className="flex items-center gap-1.5">
                    <Calendar className="h-4 w-4" />
                    <span>
                      {format(
                        new Date(project.contract_tenure_start),
                        'dd MMM yyyy',
                      )}
                      {project.contract_tenure_end &&
                        ` - ${format(new Date(project.contract_tenure_end), 'dd MMM yyyy')}`}
                    </span>
                  </div>
                )}
              </div>

              {project.areas_under_design &&
                project.areas_under_design.length > 0 && (
                  <div className="flex flex-wrap gap-1.5 pt-1">
                    {project.areas_under_design.map((area) => (
                      <Badge key={area} variant="info" className="text-xs">
                        {area}
                      </Badge>
                    ))}
                  </div>
                )}
            </div>

            {isAdmin && (
              <Button variant="outline" size="sm" onClick={openEditDialog}>
                <Pencil className="mr-2 h-3.5 w-3.5" />
                Edit Project
              </Button>
            )}
          </div>
        </CardContent>
      </Card>

      {/* ============ TABS ============ */}
      <Tabs defaultValue="fees" className="space-y-4">
        <TabsList>
          <TabsTrigger value="fees" className="gap-1.5">
            <IndianRupee className="h-4 w-4" />
            Fee Stages
          </TabsTrigger>
          <TabsTrigger value="travel" className="gap-1.5">
            <Plane className="h-4 w-4" />
            Travel & Reimbursables
          </TabsTrigger>
          <TabsTrigger value="timeline" className="gap-1.5">
            <Clock className="h-4 w-4" />
            Timeline
          </TabsTrigger>
          <TabsTrigger value="documents" className="gap-1.5">
            <FileText className="h-4 w-4" />
            Documents
          </TabsTrigger>
        </TabsList>

        {/* =========== TAB 1: FEE STAGES =========== */}
        <TabsContent value="fees" className="space-y-4">
          {/* Progress Bar */}
          <Card>
            <CardContent className="p-4">
              <div className="flex items-center justify-between mb-2">
                <p className="text-sm font-medium">Collection Progress</p>
                <p className="text-sm font-mono">
                  {formatINR(totalCollected)} / {formatINR(contractTotal)}
                </p>
              </div>
              <div className="h-3 w-full bg-muted rounded-full overflow-hidden">
                <div
                  className="h-full bg-emerald-500 rounded-full transition-all duration-500"
                  style={{ width: `${progressPercent}%` }}
                />
              </div>
              <div className="flex items-center justify-between mt-2">
                <p className="text-xs text-muted-foreground">
                  {progressPercent}% collected
                </p>
                <p className="text-xs text-muted-foreground">
                  {formatINR(totalPending)} pending
                </p>
              </div>
            </CardContent>
          </Card>

          {/* Percentage allocation indicator */}
          <div className="flex items-center justify-between">
            <p
              className={`text-sm font-medium ${totalPercentAllocated > 100 ? 'text-destructive' : 'text-muted-foreground'}`}
            >
              {totalPercentAllocated}% allocated
              {' — '}
              {100 - totalPercentAllocated}% remaining
              {totalPercentAllocated > 100 && (
                <span className="ml-2 inline-flex items-center gap-1">
                  <AlertCircle className="h-3.5 w-3.5" />
                  Over-allocated!
                </span>
              )}
            </p>
            {isAdmin && (
              <Button size="sm" onClick={() => setAddStageOpen(true)}>
                <Plus className="mr-2 h-4 w-4" />
                Add Stage
              </Button>
            )}
          </div>

          {/* Fee Stages Table */}
          <Card>
            <CardContent className="p-0">
              <DndContext
                sensors={sensors}
                collisionDetection={closestCenter}
                onDragEnd={handleDragEnd}
              >
                <Table>
                  <TableHeader>
                    {feeTable.getHeaderGroups().map((headerGroup) => (
                      <TableRow key={headerGroup.id}>
                        <TableHead className="w-8 px-2" />
                        {headerGroup.headers.map((header) => (
                          <TableHead
                            key={header.id}
                            className={
                              header.column.getCanSort()
                                ? 'cursor-pointer select-none'
                                : ''
                            }
                            onClick={header.column.getToggleSortingHandler()}
                          >
                            {header.isPlaceholder
                              ? null
                              : flexRender(
                                  header.column.columnDef.header,
                                  header.getContext(),
                                )}
                            {header.column.getCanSort() && (
                              <SortIcon column={header.column} />
                            )}
                          </TableHead>
                        ))}
                      </TableRow>
                    ))}
                  </TableHeader>
                  <TableBody>
                    <SortableContext
                      items={feeStages.map((s) => s.id)}
                      strategy={verticalListSortingStrategy}
                    >
                      {feeTable.getRowModel().rows.length === 0 ? (
                        <TableRow>
                          <TableCell
                            colSpan={feeColumns.length + 1}
                            className="text-center py-8 text-muted-foreground"
                          >
                            No fee stages yet. Add one to get started.
                          </TableCell>
                        </TableRow>
                      ) : (
                        feeTable.getRowModel().rows.map((row) => (
                          <SortableRow
                            key={row.original.id}
                            id={row.original.id}
                            disabled={!isAdmin}
                          >
                            {row.getVisibleCells().map((cell) => (
                              <TableCell key={cell.id}>
                                {flexRender(
                                  cell.column.columnDef.cell,
                                  cell.getContext(),
                                )}
                              </TableCell>
                            ))}
                          </SortableRow>
                        ))
                      )}
                    </SortableContext>
                  </TableBody>
                </Table>
              </DndContext>
            </CardContent>
          </Card>
        </TabsContent>

        {/* =========== TAB 2: TRAVEL & REIMBURSABLES =========== */}
        <TabsContent value="travel" className="space-y-4">
          {/* Summary KPIs */}
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
            <KPICard
              title="Total"
              value={formatINR(reimbursableTotal)}
              icon={IndianRupee}
              loading={reimbursablesLoading}
            />
            <KPICard
              title="Reimbursed"
              value={formatINR(reimbursableReimbursed)}
              icon={CheckCircle2}
              loading={reimbursablesLoading}
            />
            <KPICard
              title="Pending"
              value={formatINR(reimbursablePending)}
              icon={Clock}
              loading={reimbursablesLoading}
            />
          </div>

          <div className="flex items-center justify-end">
            {isAdmin && (
              <Button
                size="sm"
                onClick={() => setAddReimbursableOpen(true)}
              >
                <Plus className="mr-2 h-4 w-4" />
                Add Item
              </Button>
            )}
          </div>

          {/* Travel Table */}
          <Card>
            <CardContent className="p-0">
              <Table>
                <TableHeader>
                  {travelTable.getHeaderGroups().map((headerGroup) => (
                    <TableRow key={headerGroup.id}>
                      {headerGroup.headers.map((header) => (
                        <TableHead
                          key={header.id}
                          className={
                            header.column.getCanSort()
                              ? 'cursor-pointer select-none'
                              : ''
                          }
                          onClick={header.column.getToggleSortingHandler()}
                        >
                          {header.isPlaceholder
                            ? null
                            : flexRender(
                                header.column.columnDef.header,
                                header.getContext(),
                              )}
                          {header.column.getCanSort() && (
                            <SortIcon column={header.column} />
                          )}
                        </TableHead>
                      ))}
                    </TableRow>
                  ))}
                </TableHeader>
                <TableBody>
                  {travelTable.getRowModel().rows.length === 0 ? (
                    <TableRow>
                      <TableCell
                        colSpan={travelColumns.length}
                        className="text-center py-8 text-muted-foreground"
                      >
                        No travel or reimbursable entries yet.
                      </TableCell>
                    </TableRow>
                  ) : (
                    travelTable.getRowModel().rows.map((row) => (
                      <TableRow key={row.id}>
                        {row.getVisibleCells().map((cell) => (
                          <TableCell key={cell.id}>
                            {flexRender(
                              cell.column.columnDef.cell,
                              cell.getContext(),
                            )}
                          </TableCell>
                        ))}
                      </TableRow>
                    ))
                  )}
                </TableBody>
              </Table>
            </CardContent>
          </Card>
        </TabsContent>

        {/* =========== TAB 3: TIMELINE =========== */}
        <TabsContent value="timeline" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle className="text-lg">Project Timeline</CardTitle>
            </CardHeader>
            <CardContent>
              {timelineEvents.length === 0 ? (
                <div className="text-center py-8 text-muted-foreground">
                  <Clock className="h-8 w-8 mx-auto mb-2 opacity-50" />
                  <p>No timeline events yet.</p>
                  <p className="text-xs mt-1">
                    Events will appear here as actions are performed on this
                    project.
                  </p>
                </div>
              ) : (
                <div className="relative">
                  {/* Vertical line */}
                  <div className="absolute left-[15px] top-2 bottom-2 w-0.5 bg-border" />

                  <div className="space-y-6">
                    {timelineEvents.map((event) => {
                      let iconColor = 'bg-muted text-muted-foreground'
                      let Icon = CircleDot

                      if (event.type === 'payment') {
                        iconColor =
                          'bg-emerald-100 text-emerald-700 dark:bg-emerald-900 dark:text-emerald-300'
                        Icon = CreditCard
                      } else if (event.type === 'invoice') {
                        iconColor =
                          'bg-blue-100 text-blue-700 dark:bg-blue-900 dark:text-blue-300'
                        Icon = FileText
                      } else if (
                        event.action.toLowerCase().includes('created')
                      ) {
                        iconColor =
                          'bg-emerald-100 text-emerald-700 dark:bg-emerald-900 dark:text-emerald-300'
                        Icon = CheckCircle2
                      } else if (
                        event.action.toLowerCase().includes('deleted')
                      ) {
                        iconColor =
                          'bg-red-100 text-red-700 dark:bg-red-900 dark:text-red-300'
                        Icon = Trash2
                      } else if (
                        event.action.toLowerCase().includes('updated')
                      ) {
                        iconColor =
                          'bg-amber-100 text-amber-700 dark:bg-amber-900 dark:text-amber-300'
                        Icon = Pencil
                      }

                      return (
                        <div key={event.id} className="relative pl-10">
                          {/* Icon circle */}
                          <div
                            className={`absolute left-0 top-0.5 h-[30px] w-[30px] rounded-full flex items-center justify-center ${iconColor}`}
                          >
                            <Icon className="h-3.5 w-3.5" />
                          </div>

                          <div>
                            <p className="text-sm font-medium">
                              {event.action}
                            </p>
                            <div className="flex items-center gap-3 mt-0.5">
                              <p className="text-xs text-muted-foreground">
                                {format(
                                  new Date(event.date),
                                  'dd MMM yyyy, hh:mm a',
                                )}
                              </p>
                              <p className="text-xs text-muted-foreground">
                                by {event.user}
                              </p>
                              {event.amount != null && (
                                <Badge
                                  variant="outline"
                                  className="text-xs font-mono"
                                >
                                  {formatINR(event.amount)}
                                </Badge>
                              )}
                            </div>
                          </div>
                        </div>
                      )
                    })}
                  </div>
                </div>
              )}
            </CardContent>
          </Card>
        </TabsContent>

        {/* =========== TAB 4: DOCUMENTS =========== */}
        <TabsContent value="documents" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle className="text-lg">Documents</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              {/* Upload zone skeleton */}
              <div className="border-2 border-dashed border-muted-foreground/25 rounded-lg p-12 flex flex-col items-center justify-center text-center">
                <Upload className="h-10 w-10 text-muted-foreground/50 mb-3" />
                <p className="text-sm font-medium text-muted-foreground">
                  Drop files here
                </p>
                <p className="text-xs text-muted-foreground/70 mt-1">
                  or click to browse
                </p>
              </div>

              <Separator />

              <div className="text-center py-6">
                <FileText className="h-8 w-8 mx-auto mb-2 text-muted-foreground/50" />
                <p className="text-sm text-muted-foreground">
                  Document storage coming soon
                </p>
              </div>
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>

      {/* ============================================================
          DIALOGS
          ============================================================ */}

      {/* ----- Edit Project Dialog ----- */}
      <Dialog open={editDialogOpen} onOpenChange={setEditDialogOpen}>
        <DialogContent className="sm:max-w-lg max-h-[90vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle>Edit Project</DialogTitle>
          </DialogHeader>
          <form
            onSubmit={editForm.handleSubmit((data) =>
              editMutation.mutate(data),
            )}
            className="space-y-4"
          >
            <div className="space-y-2">
              <Label htmlFor="edit_project_name">Project Name *</Label>
              <Input
                id="edit_project_name"
                {...editForm.register('project_name', {
                  required: 'Required',
                })}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="edit_client_name">Client Name *</Label>
              <Input
                id="edit_client_name"
                {...editForm.register('client_name', {
                  required: 'Required',
                })}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="edit_client_contact">Client Contact</Label>
              <Input
                id="edit_client_contact"
                {...editForm.register('client_contact')}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="edit_areas">Areas Under Design</Label>
              <Input
                id="edit_areas"
                placeholder="Comma-separated"
                {...editForm.register('areas_under_design')}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="edit_value">Contract Value (INR)</Label>
              <Input
                id="edit_value"
                type="number"
                {...editForm.register('total_contract_value')}
              />
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="edit_start">Tenure Start</Label>
                <Input
                  id="edit_start"
                  type="date"
                  {...editForm.register('contract_tenure_start')}
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="edit_end">Tenure End</Label>
                <Input
                  id="edit_end"
                  type="date"
                  {...editForm.register('contract_tenure_end')}
                />
              </div>
            </div>
            <div className="space-y-2">
              <Label>Status</Label>
              <Select
                value={editForm.watch('status')}
                onValueChange={(val) =>
                  editForm.setValue('status', val as ProjectStatus)
                }
              >
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="active">Active</SelectItem>
                  <SelectItem value="on-hold">On Hold</SelectItem>
                  <SelectItem value="completed">Completed</SelectItem>
                  <SelectItem value="cancelled">Cancelled</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div className="space-y-2">
              <Label htmlFor="edit_notes">Notes</Label>
              <Textarea
                id="edit_notes"
                rows={3}
                {...editForm.register('notes')}
              />
            </div>

            {editMutation.isError && (
              <p className="text-sm text-destructive">
                {(editMutation.error as Error).message}
              </p>
            )}

            <DialogFooter>
              <Button
                type="button"
                variant="outline"
                onClick={() => setEditDialogOpen(false)}
              >
                Cancel
              </Button>
              <Button type="submit" disabled={editMutation.isPending}>
                {editMutation.isPending ? 'Saving...' : 'Save Changes'}
              </Button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>

      {/* ----- Add Stage Dialog ----- */}
      <Dialog open={addStageOpen} onOpenChange={setAddStageOpen}>
        <DialogContent className="sm:max-w-md">
          <DialogHeader>
            <DialogTitle>Add Fee Stage</DialogTitle>
          </DialogHeader>
          <form
            onSubmit={stageForm.handleSubmit((data) =>
              addStageMutation.mutate(data),
            )}
            className="space-y-4"
          >
            <div className="space-y-2">
              <Label htmlFor="stage_name">Stage Name *</Label>
              <Input
                id="stage_name"
                placeholder="e.g. Concept Design"
                {...stageForm.register('stage_name', {
                  required: 'Required',
                })}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="stage_number">Stage Number *</Label>
              <Input
                id="stage_number"
                type="number"
                placeholder={String(feeStages.length + 1)}
                {...stageForm.register('stage_number', {
                  required: 'Required',
                })}
              />
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="percentage_of_total">% of Total</Label>
                <Input
                  id="percentage_of_total"
                  type="number"
                  step="0.1"
                  placeholder="e.g. 15"
                  {...stageForm.register('percentage_of_total')}
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="lumpsum_amount">Lump Sum (INR)</Label>
                <Input
                  id="lumpsum_amount"
                  type="number"
                  placeholder={autoLumpsum || 'Auto-calculated'}
                  {...stageForm.register('lumpsum_amount')}
                />
                {autoLumpsum && !stageForm.watch('lumpsum_amount') && (
                  <p className="text-xs text-muted-foreground">
                    Auto: {formatINR(Number(autoLumpsum))}
                  </p>
                )}
              </div>
            </div>
            <div className="space-y-2">
              <Label>Due Trigger</Label>
              <Select
                value={stageForm.watch('due_trigger')}
                onValueChange={(val) =>
                  stageForm.setValue('due_trigger', val as DueTrigger)
                }
              >
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="on_invoice">On Invoice</SelectItem>
                  <SelectItem value="on_payment_received">
                    On Payment Received
                  </SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div className="space-y-2">
              <Label htmlFor="stage_notes">Notes</Label>
              <Textarea
                id="stage_notes"
                rows={2}
                {...stageForm.register('notes')}
              />
            </div>

            {addStageMutation.isError && (
              <p className="text-sm text-destructive">
                {(addStageMutation.error as Error).message}
              </p>
            )}

            <DialogFooter>
              <Button
                type="button"
                variant="outline"
                onClick={() => setAddStageOpen(false)}
              >
                Cancel
              </Button>
              <Button type="submit" disabled={addStageMutation.isPending}>
                {addStageMutation.isPending ? 'Adding...' : 'Add Stage'}
              </Button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>

      {/* ----- Log Payment Dialog ----- */}
      <Dialog
        open={!!paymentStageId}
        onOpenChange={(open) => {
          if (!open) setPaymentStageId(null)
        }}
      >
        <DialogContent className="sm:max-w-md">
          <DialogHeader>
            <DialogTitle>Log Payment</DialogTitle>
          </DialogHeader>
          {(() => {
            const stage = feeStages.find((s) => s.id === paymentStageId)
            if (!stage) return null
            const balance = (stage.lumpsum_amount ?? 0) - stage.amount_paid
            return (
              <div className="mb-2 text-sm text-muted-foreground">
                <p>
                  Stage: <strong>{stage.stage_name}</strong>
                </p>
                <p>
                  Balance: <strong className="font-mono">{formatINR(balance)}</strong>
                </p>
              </div>
            )
          })()}
          <form
            onSubmit={paymentForm.handleSubmit((data) =>
              paymentMutation.mutate(data),
            )}
            className="space-y-4"
          >
            <div className="space-y-2">
              <Label htmlFor="pay_amount">Amount (INR) *</Label>
              <Input
                id="pay_amount"
                type="number"
                placeholder="Enter payment amount"
                {...paymentForm.register('amount', {
                  required: 'Required',
                })}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="pay_date">Payment Date</Label>
              <Input
                id="pay_date"
                type="date"
                {...paymentForm.register('payment_received_date')}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="pay_ref">Reference / Invoice Number</Label>
              <Input
                id="pay_ref"
                placeholder="e.g. INV-001"
                {...paymentForm.register('invoice_number')}
              />
            </div>
            <div className="space-y-2">
              <Label>Payment Type</Label>
              <Select
                value={paymentForm.watch('payment_type')}
                onValueChange={(val) =>
                  paymentForm.setValue(
                    'payment_type',
                    val as 'partial' | 'full',
                  )
                }
              >
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="full">Full Payment</SelectItem>
                  <SelectItem value="partial">Partial Payment</SelectItem>
                </SelectContent>
              </Select>
            </div>

            {paymentMutation.isError && (
              <p className="text-sm text-destructive">
                {(paymentMutation.error as Error).message}
              </p>
            )}

            <DialogFooter>
              <Button
                type="button"
                variant="outline"
                onClick={() => setPaymentStageId(null)}
              >
                Cancel
              </Button>
              <Button type="submit" disabled={paymentMutation.isPending}>
                {paymentMutation.isPending
                  ? 'Processing...'
                  : 'Record Payment'}
              </Button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>

      {/* ----- Delete Stage Confirmation Dialog ----- */}
      <Dialog
        open={!!deleteStageId}
        onOpenChange={(open) => {
          if (!open) setDeleteStageId(null)
        }}
      >
        <DialogContent className="sm:max-w-sm">
          <DialogHeader>
            <DialogTitle>Delete Fee Stage</DialogTitle>
          </DialogHeader>
          <p className="text-sm text-muted-foreground">
            Are you sure you want to delete this fee stage? This action cannot
            be undone.
          </p>
          <DialogFooter>
            <Button
              variant="outline"
              onClick={() => setDeleteStageId(null)}
            >
              Cancel
            </Button>
            <Button
              variant="destructive"
              disabled={deleteStageMutation.isPending}
              onClick={() => {
                if (deleteStageId) deleteStageMutation.mutate(deleteStageId)
              }}
            >
              {deleteStageMutation.isPending ? 'Deleting...' : 'Delete'}
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>

      {/* ----- Add Reimbursable Dialog ----- */}
      <Dialog
        open={addReimbursableOpen}
        onOpenChange={setAddReimbursableOpen}
      >
        <DialogContent className="sm:max-w-md">
          <DialogHeader>
            <DialogTitle>Add Travel / Reimbursable</DialogTitle>
          </DialogHeader>
          <form
            onSubmit={reimbursableForm.handleSubmit((data) =>
              addReimbursableMutation.mutate(data),
            )}
            className="space-y-4"
          >
            <div className="space-y-2">
              <Label htmlFor="reimb_desc">Description *</Label>
              <Input
                id="reimb_desc"
                placeholder="e.g. Site visit travel"
                {...reimbursableForm.register('description', {
                  required: 'Required',
                })}
              />
            </div>
            <div className="space-y-2">
              <Label>Category</Label>
              <Select
                value={reimbursableForm.watch('category')}
                onValueChange={(val) =>
                  reimbursableForm.setValue(
                    'category',
                    val as ReimbursableCategory,
                  )
                }
              >
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="travel">Travel</SelectItem>
                  <SelectItem value="accommodation">Accommodation</SelectItem>
                  <SelectItem value="printing">Printing</SelectItem>
                  <SelectItem value="other">Other</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div className="space-y-2">
              <Label htmlFor="reimb_amount">Amount (INR) *</Label>
              <Input
                id="reimb_amount"
                type="number"
                {...reimbursableForm.register('amount', {
                  required: 'Required',
                })}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="reimb_date">Date</Label>
              <Input
                id="reimb_date"
                type="date"
                {...reimbursableForm.register('date')}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="reimb_invoice">Invoice Ref</Label>
              <Input
                id="reimb_invoice"
                placeholder="e.g. REC-001"
                {...reimbursableForm.register('invoice_ref')}
              />
            </div>

            {addReimbursableMutation.isError && (
              <p className="text-sm text-destructive">
                {(addReimbursableMutation.error as Error).message}
              </p>
            )}

            <DialogFooter>
              <Button
                type="button"
                variant="outline"
                onClick={() => setAddReimbursableOpen(false)}
              >
                Cancel
              </Button>
              <Button
                type="submit"
                disabled={addReimbursableMutation.isPending}
              >
                {addReimbursableMutation.isPending ? 'Adding...' : 'Add Item'}
              </Button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>
    </div>
  )
}
