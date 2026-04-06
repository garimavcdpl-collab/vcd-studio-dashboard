import { useState, useMemo } from 'react'
import { useNavigate } from 'react-router-dom'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import {
  useReactTable,
  getCoreRowModel,
  getSortedRowModel,
  getFilteredRowModel,
  flexRender,
  createColumnHelper,
  type SortingState,
} from '@tanstack/react-table'
import { useForm } from 'react-hook-form'
import { format } from 'date-fns'
import {
  Search,
  Plus,
  FolderOpen,
  ArrowUpDown,
  ArrowUp,
  ArrowDown,
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
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Skeleton } from '@/components/ui/skeleton'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetDescription,
} from '@/components/ui/sheet'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { ProjectStatusBadge } from '@/components/shared/StatusBadge'
import { EmptyState } from '@/components/shared/EmptyState'

import type { Project, FeeStage, ProjectStatus } from '@/types/database'

/* ---------- Types ---------- */

interface ProjectWithFees extends Project {
  fee_stages: Pick<FeeStage, 'amount_paid'>[]
}

interface NewProjectForm {
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

/* ---------- Column helper ---------- */

interface ProjectRow {
  id: string
  project_name: string
  client_name: string
  status: ProjectStatus | null
  total_contract_value: number | null
  collected: number
  pending: number
  contract_tenure_end: string | null
  areas_under_design: string[] | null
}

const columnHelper = createColumnHelper<ProjectRow>()

/* ---------- Component ---------- */

export function ProjectsPage() {
  const navigate = useNavigate()
  const queryClient = useQueryClient()
  const { selectedCompanyId } = useCompany()
  const { isAdmin } = useRole()

  const [sorting, setSorting] = useState<SortingState>([])
  const [searchQuery, setSearchQuery] = useState('')
  const [statusFilter, setStatusFilter] = useState<string>('all')
  const [sheetOpen, setSheetOpen] = useState(false)

  /* ----- Data fetching ----- */

  const { data: projects, isLoading } = useQuery({
    queryKey: ['projects', selectedCompanyId],
    queryFn: async () => {
      if (!selectedCompanyId) return []

      const { data, error } = await supabase
        .from('projects')
        .select('*, fee_stages(amount_paid)')
        .eq('company_id', selectedCompanyId)
        .order('created_at', { ascending: false })

      if (error) throw error
      return (data ?? []) as ProjectWithFees[]
    },
    enabled: !!selectedCompanyId,
  })

  /* ----- Transform to table rows ----- */

  const rows = useMemo<ProjectRow[]>(() => {
    if (!projects) return []
    return projects.map((p) => {
      const collected = (p.fee_stages ?? []).reduce(
        (sum, s) => sum + (s.amount_paid ?? 0),
        0,
      )
      return {
        id: p.id,
        project_name: p.project_name,
        client_name: p.client_name,
        status: p.status,
        total_contract_value: p.total_contract_value,
        collected,
        pending: (p.total_contract_value ?? 0) - collected,
        contract_tenure_end: p.contract_tenure_end,
        areas_under_design: p.areas_under_design,
      }
    })
  }, [projects])

  /* ----- Filtered rows ----- */

  const filteredRows = useMemo(() => {
    let result = rows

    // Status filter
    if (statusFilter !== 'all') {
      result = result.filter((r) => r.status === statusFilter)
    }

    // Search filter
    if (searchQuery.trim()) {
      const q = searchQuery.toLowerCase()
      result = result.filter(
        (r) =>
          r.project_name.toLowerCase().includes(q) ||
          r.client_name.toLowerCase().includes(q) ||
          (r.areas_under_design ?? []).some((a) =>
            a.toLowerCase().includes(q),
          ),
      )
    }

    return result
  }, [rows, statusFilter, searchQuery])

  /* ----- Column defs ----- */

  const columns = useMemo(
    () => [
      columnHelper.accessor('project_name', {
        header: 'Project Name',
        cell: (info) => (
          <span className="font-medium">{info.getValue()}</span>
        ),
      }),
      columnHelper.accessor('client_name', {
        header: 'Client',
      }),
      columnHelper.accessor('status', {
        header: 'Status',
        cell: (info) => <ProjectStatusBadge status={info.getValue()} />,
      }),
      columnHelper.accessor('total_contract_value', {
        header: 'Contract Value',
        cell: (info) => (
          <span className="font-mono">{formatINR(info.getValue())}</span>
        ),
      }),
      columnHelper.accessor('collected', {
        header: 'Collected',
        cell: (info) => (
          <span className="font-mono text-emerald-600 dark:text-emerald-400">
            {formatINR(info.getValue())}
          </span>
        ),
      }),
      columnHelper.accessor('pending', {
        header: 'Pending',
        cell: (info) => (
          <span className="font-mono text-amber-600 dark:text-amber-400">
            {formatINR(info.getValue())}
          </span>
        ),
      }),
      columnHelper.accessor('contract_tenure_end', {
        header: 'Tenure End',
        cell: (info) => {
          const val = info.getValue()
          return val ? format(new Date(val), 'dd MMM yyyy') : '--'
        },
      }),
      columnHelper.accessor('areas_under_design', {
        header: 'Areas',
        enableSorting: false,
        cell: (info) => {
          const areas = info.getValue()
          if (!areas || areas.length === 0) return '--'
          return (
            <div className="flex flex-wrap gap-1">
              {areas.map((a) => (
                <Badge
                  key={a}
                  variant="secondary"
                  className="text-[10px] px-1.5 py-0"
                >
                  {a}
                </Badge>
              ))}
            </div>
          )
        },
      }),
    ],
    [],
  )

  /* ----- Table instance ----- */

  const table = useReactTable({
    data: filteredRows,
    columns,
    state: { sorting },
    onSortingChange: setSorting,
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
    getFilteredRowModel: getFilteredRowModel(),
  })

  /* ----- Create project mutation ----- */

  const {
    register,
    handleSubmit,
    reset,
    setValue,
    formState: { errors, isSubmitting },
  } = useForm<NewProjectForm>({
    defaultValues: {
      status: 'active',
    },
  })

  const createMutation = useMutation({
    mutationFn: async (formData: NewProjectForm) => {
      const areas = formData.areas_under_design
        .split(',')
        .map((a) => a.trim())
        .filter(Boolean)

      const { data, error } = await supabase
        .from('projects')
        .insert({
          company_id: selectedCompanyId,
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
        .select()
        .single()

      if (error) throw error
      return data
    },
    onSuccess: async (data) => {
      await logAudit({
        action: 'Created project',
        entityType: 'project',
        entityId: data.id,
        details: { project_name: data.project_name },
      })
      queryClient.invalidateQueries({ queryKey: ['projects'] })
      reset()
      setSheetOpen(false)
    },
  })

  const onCreateSubmit = (formData: NewProjectForm) => {
    createMutation.mutate(formData)
  }

  /* ----- Sorting icon helper ----- */

  const SortIcon = ({ column }: { column: any }) => {
    const sorted = column.getIsSorted()
    if (sorted === 'asc') return <ArrowUp className="ml-1 h-3.5 w-3.5 inline" />
    if (sorted === 'desc') return <ArrowDown className="ml-1 h-3.5 w-3.5 inline" />
    return <ArrowUpDown className="ml-1 h-3.5 w-3.5 inline opacity-40" />
  }

  /* ----- Loading skeleton ----- */

  if (isLoading) {
    return (
      <div className="space-y-6 p-6">
        <div className="flex items-center justify-between">
          <Skeleton className="h-8 w-48" />
          <Skeleton className="h-10 w-32" />
        </div>
        <div className="flex gap-4">
          <Skeleton className="h-10 flex-1 max-w-sm" />
          <Skeleton className="h-10 w-40" />
        </div>
        <Card>
          <CardContent className="p-0">
            <div className="space-y-1 p-4">
              {Array.from({ length: 8 }).map((_, i) => (
                <Skeleton key={i} className="h-12 w-full" />
              ))}
            </div>
          </CardContent>
        </Card>
      </div>
    )
  }

  /* ----- Render ----- */

  return (
    <div className="space-y-6 p-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold tracking-tight">Projects</h1>
          <p className="text-sm text-muted-foreground">
            Manage all your design projects and contracts
          </p>
        </div>
        {isAdmin && (
          <Button onClick={() => setSheetOpen(true)}>
            <Plus className="mr-2 h-4 w-4" />
            New Project
          </Button>
        )}
      </div>

      {/* Filters */}
      <div className="flex flex-col sm:flex-row gap-4">
        <div className="relative flex-1 max-w-sm">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input
            placeholder="Search projects, clients, areas..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="pl-9"
          />
        </div>
        <Select value={statusFilter} onValueChange={setStatusFilter}>
          <SelectTrigger className="w-full sm:w-[180px] bg-card border-border text-foreground">
            <SelectValue placeholder="Filter by status" />
          </SelectTrigger>
          <SelectContent className="bg-card border-border text-foreground z-50">
            <SelectItem value="all">All Statuses</SelectItem>
            <SelectItem value="active">Active</SelectItem>
            <SelectItem value="on-hold">On Hold</SelectItem>
            <SelectItem value="completed">Completed</SelectItem>
            <SelectItem value="cancelled">Cancelled</SelectItem>
          </SelectContent>
        </Select>
      </div>

      {/* Table or Empty */}
      {filteredRows.length === 0 && !isLoading ? (
        <EmptyState
          icon={FolderOpen}
          title="No projects found"
          description={
            searchQuery || statusFilter !== 'all'
              ? 'Try adjusting your search or filter criteria.'
              : 'Get started by creating your first project.'
          }
          actionLabel={isAdmin ? '+ New Project' : undefined}
          onAction={isAdmin ? () => setSheetOpen(true) : undefined}
        />
      ) : (
        <Card>
          <CardContent className="p-0">
            <Table>
              <TableHeader>
                {table.getHeaderGroups().map((headerGroup) => (
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
                {table.getRowModel().rows.map((row) => (
                  <TableRow
                    key={row.id}
                    className="cursor-pointer hover:bg-muted/50"
                    onClick={() => navigate(`/projects/${row.original.id}`)}
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
          </CardContent>
        </Card>
      )}

      {/* New Project Sheet */}
      <Sheet open={sheetOpen} onOpenChange={setSheetOpen}>
        <SheetContent className="overflow-y-auto sm:max-w-lg bg-card text-card-foreground border-border">
          <SheetHeader>
            <SheetTitle>Create New Project</SheetTitle>
            <SheetDescription>
              Fill in the details to set up a new project.
            </SheetDescription>
          </SheetHeader>

          <form
            onSubmit={handleSubmit(onCreateSubmit)}
            className="space-y-4 mt-6"
          >
            <div className="space-y-2">
              <Label htmlFor="project_name">Project Name *</Label>
              <Input
                id="project_name"
                placeholder="e.g. Villa Renovation"
                {...register('project_name', {
                  required: 'Project name is required',
                })}
              />
              {errors.project_name && (
                <p className="text-sm text-destructive">
                  {errors.project_name.message}
                </p>
              )}
            </div>

            <div className="space-y-2">
              <Label htmlFor="client_name">Client Name *</Label>
              <Input
                id="client_name"
                placeholder="e.g. Rahul Sharma"
                {...register('client_name', {
                  required: 'Client name is required',
                })}
              />
              {errors.client_name && (
                <p className="text-sm text-destructive">
                  {errors.client_name.message}
                </p>
              )}
            </div>

            <div className="space-y-2">
              <Label htmlFor="client_contact">Client Contact</Label>
              <Input
                id="client_contact"
                placeholder="Phone or email"
                {...register('client_contact')}
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="areas_under_design">Areas Under Design</Label>
              <Input
                id="areas_under_design"
                placeholder="Living Room, Kitchen, Bedroom (comma-separated)"
                {...register('areas_under_design')}
              />
              <p className="text-xs text-muted-foreground">
                Separate multiple areas with commas
              </p>
            </div>

            <div className="space-y-2">
              <Label htmlFor="total_contract_value">
                Total Contract Value (INR)
              </Label>
              <Input
                id="total_contract_value"
                type="number"
                placeholder="e.g. 500000"
                {...register('total_contract_value')}
              />
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="contract_tenure_start">Tenure Start</Label>
                <Input
                  id="contract_tenure_start"
                  type="date"
                  {...register('contract_tenure_start')}
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="contract_tenure_end">Tenure End</Label>
                <Input
                  id="contract_tenure_end"
                  type="date"
                  {...register('contract_tenure_end')}
                />
              </div>
            </div>

            <div className="space-y-2">
              <Label>Status</Label>
              <Select
                defaultValue="active"
                onValueChange={(val) =>
                  setValue('status', val as ProjectStatus)
                }
              >
                <SelectTrigger className="bg-background border-border text-foreground">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent className="bg-card border-border text-foreground z-50">
                  <SelectItem value="active">Active</SelectItem>
                  <SelectItem value="on-hold">On Hold</SelectItem>
                  <SelectItem value="completed">Completed</SelectItem>
                  <SelectItem value="cancelled">Cancelled</SelectItem>
                </SelectContent>
              </Select>
            </div>

            <div className="space-y-2">
              <Label htmlFor="notes">Notes</Label>
              <Textarea
                id="notes"
                placeholder="Any additional notes..."
                rows={3}
                {...register('notes')}
              />
            </div>

            {createMutation.isError && (
              <p className="text-sm text-destructive">
                {(createMutation.error as Error).message}
              </p>
            )}

            <div className="flex gap-3 pt-4">
              <Button
                type="button"
                variant="outline"
                className="flex-1"
                onClick={() => {
                  reset()
                  setSheetOpen(false)
                }}
              >
                Cancel
              </Button>
              <Button
                type="submit"
                className="flex-1"
                disabled={isSubmitting || createMutation.isPending}
              >
                {createMutation.isPending ? 'Creating...' : 'Create Project'}
              </Button>
            </div>
          </form>
        </SheetContent>
      </Sheet>
    </div>
  )
}
