import { useState } from 'react'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { useForm } from 'react-hook-form'
import { format } from 'date-fns'
import { Users, Plus, UserPlus } from 'lucide-react'
import { supabase } from '@/lib/supabase'
import { formatINR } from '@/lib/format'
import { logAudit } from '@/lib/audit'
import { useCompany } from '@/hooks/useCompany'
import { useRole } from '@/hooks/useRole'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Skeleton } from '@/components/ui/skeleton'
import { Switch } from '@/components/ui/switch'
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from '@/components/ui/dialog'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { Badge } from '@/components/ui/badge'
import { RequiresAdmin } from '@/components/shared/RequiresAdmin'
import { KPICard } from '@/components/shared/KPICard'
import { EmptyState } from '@/components/shared/EmptyState'
import type { Staff } from '@/types/database'

interface StaffForm {
  name: string
  role: string
  monthly_salary: string
  join_date: string
  is_active: boolean
}

export function StaffPage() {
  const { selectedCompanyId } = useCompany()
  const { isAdmin } = useRole()
  const queryClient = useQueryClient()
  const [dialogOpen, setDialogOpen] = useState(false)
  const [editingStaff, setEditingStaff] = useState<Staff | null>(null)

  const { register, handleSubmit, reset, setValue, watch } = useForm<StaffForm>()
  const isActive = watch('is_active', true)

  const { data: staffList = [], isLoading } = useQuery({
    queryKey: ['staff', selectedCompanyId],
    queryFn: async () => {
      let query = supabase.from('staff').select('*').order('name')
      if (selectedCompanyId) query = query.eq('company_id', selectedCompanyId)
      const { data, error } = await query
      if (error) throw error
      return data as Staff[]
    },
    enabled: !!selectedCompanyId,
  })

  const mutation = useMutation({
    mutationFn: async (data: StaffForm) => {
      const record = {
        company_id: selectedCompanyId!,
        name: data.name,
        role: data.role || null,
        monthly_salary: data.monthly_salary ? Number(data.monthly_salary) : null,
        join_date: data.join_date || null,
        is_active: data.is_active,
      }
      if (editingStaff) {
        const { error } = await supabase.from('staff').update(record).eq('id', editingStaff.id)
        if (error) throw error
        await logAudit({ action: 'staff_updated', entityType: 'staff', entityId: editingStaff.id })
      } else {
        const { error } = await supabase.from('staff').insert(record)
        if (error) throw error
        await logAudit({ action: 'staff_created', entityType: 'staff' })
      }
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['staff'] })
      setDialogOpen(false)
      setEditingStaff(null)
      reset()
    },
  })

  const openAdd = () => {
    setEditingStaff(null)
    reset({ name: '', role: '', monthly_salary: '', join_date: '', is_active: true })
    setDialogOpen(true)
  }

  const openEdit = (staff: Staff) => {
    setEditingStaff(staff)
    reset({
      name: staff.name,
      role: staff.role ?? '',
      monthly_salary: staff.monthly_salary?.toString() ?? '',
      join_date: staff.join_date ?? '',
      is_active: staff.is_active,
    })
    setDialogOpen(true)
  }

  const activeStaff = staffList.filter((s) => s.is_active)
  const totalPayroll = activeStaff.reduce((sum, s) => sum + (s.monthly_salary ?? 0), 0)

  if (isLoading) {
    return (
      <div className="space-y-6">
        <Skeleton className="h-8 w-48" />
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <Skeleton className="h-24" />
          <Skeleton className="h-24" />
          <Skeleton className="h-24" />
        </div>
        <Skeleton className="h-64" />
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold">Staff</h1>
        <RequiresAdmin>
          <Button onClick={openAdd}>
            <Plus className="h-4 w-4 mr-2" />
            Add Staff Member
          </Button>
        </RequiresAdmin>
      </div>

      <RequiresAdmin>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <KPICard
            title="Total Staff"
            value={staffList.length.toString()}
            icon={Users}
            mono={false}
          />
          <KPICard
            title="Active Members"
            value={activeStaff.length.toString()}
            icon={UserPlus}
            mono={false}
          />
          <KPICard
            title="Monthly Payroll"
            value={formatINR(totalPayroll)}
            icon={Users}
          />
        </div>
      </RequiresAdmin>

      {staffList.length === 0 ? (
        <EmptyState
          icon={Users}
          title="No staff members yet"
          description="Add your team members to track salaries and payroll."
          actionLabel={isAdmin ? '+ Add Staff Member' : undefined}
          onAction={isAdmin ? openAdd : undefined}
        />
      ) : (
        <Card>
          <CardHeader>
            <CardTitle>Team Members</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Name</TableHead>
                    <TableHead>Role</TableHead>
                    {isAdmin && <TableHead className="text-right">Monthly Salary</TableHead>}
                    <TableHead>Joined</TableHead>
                    <TableHead>Status</TableHead>
                    {isAdmin && <TableHead>Actions</TableHead>}
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {staffList.map((staff) => (
                    <TableRow key={staff.id}>
                      <TableCell className="font-medium">{staff.name}</TableCell>
                      <TableCell>{staff.role ?? '—'}</TableCell>
                      {isAdmin && (
                        <TableCell className="text-right font-mono">
                          {staff.monthly_salary ? formatINR(staff.monthly_salary) : '—'}
                        </TableCell>
                      )}
                      <TableCell>
                        {staff.join_date ? format(new Date(staff.join_date), 'MMM yyyy') : '—'}
                      </TableCell>
                      <TableCell>
                        <Badge variant={staff.is_active ? 'success' : 'secondary'}>
                          {staff.is_active ? 'Active' : 'Inactive'}
                        </Badge>
                      </TableCell>
                      {isAdmin && (
                        <TableCell>
                          <Button variant="ghost" size="sm" onClick={() => openEdit(staff)}>
                            Edit
                          </Button>
                        </TableCell>
                      )}
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          </CardContent>
        </Card>
      )}

      <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle>{editingStaff ? 'Edit Staff Member' : 'Add Staff Member'}</DialogTitle>
          </DialogHeader>
          <form onSubmit={handleSubmit((data) => mutation.mutate(data))} className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="name">Name</Label>
              <Input id="name" {...register('name', { required: true })} />
            </div>
            <div className="space-y-2">
              <Label htmlFor="role">Role</Label>
              <Input id="role" placeholder="e.g. Senior Designer" {...register('role')} />
            </div>
            <div className="space-y-2">
              <Label htmlFor="monthly_salary">Monthly Salary</Label>
              <Input id="monthly_salary" type="number" {...register('monthly_salary')} />
            </div>
            <div className="space-y-2">
              <Label htmlFor="join_date">Join Date</Label>
              <Input id="join_date" type="date" {...register('join_date')} />
            </div>
            <div className="flex items-center gap-2">
              <Switch
                checked={isActive}
                onCheckedChange={(checked) => setValue('is_active', checked)}
              />
              <Label>Active</Label>
            </div>
            <DialogFooter>
              <Button type="button" variant="outline" onClick={() => setDialogOpen(false)}>
                Cancel
              </Button>
              <Button type="submit" disabled={mutation.isPending}>
                {mutation.isPending ? 'Saving...' : 'Save'}
              </Button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>
    </div>
  )
}
