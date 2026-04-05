import { useMemo } from 'react'
import { useQuery } from '@tanstack/react-query'
import { differenceInDays } from 'date-fns'
import { supabase } from '@/lib/supabase'
import { useCompany } from './useCompany'

// TDS tolerance: payments within 90% of lumpsum = assumed TDS deducted
const TDS_THRESHOLD = 0.90

function isEffectivelyPaid(lumpsum: number, paid: number): boolean {
  if (lumpsum <= 0) return true
  return paid >= lumpsum * TDS_THRESHOLD
}

function isShortPayment(lumpsum: number, paid: number): boolean {
  if (lumpsum <= 0 || paid <= 0) return false
  // Paid something but less than 90% = short payment (not just TDS)
  return paid > 0 && paid < lumpsum * TDS_THRESHOLD
}

export interface Nudge {
  id: string
  projectId: string
  projectName: string
  stageId: string
  stageName: string
  stageNumber: number
  amount: number
  type: 'invoice_due' | 'awaiting_payment' | 'deliver_next' | 'short_payment'
  message: string
  daysSince: number
  severity: 'red' | 'amber' | 'green'
}

export function useNudges() {
  const { selectedCompanyId } = useCompany()

  const { data: stagesWithProjects, refetch } = useQuery({
    queryKey: ['nudges', selectedCompanyId],
    queryFn: async () => {
      let query = supabase
        .from('fee_stages')
        .select('*, projects!inner(id, project_name, company_id, status)')
        .neq('payment_status', 'paid')

      if (selectedCompanyId) {
        query = query.eq('projects.company_id', selectedCompanyId)
      }

      const { data, error } = await query.order('stage_number', { ascending: true })
      if (error) throw error
      return data
    },
    refetchInterval: 30000,
  })

  const { data: allStages } = useQuery({
    queryKey: ['all-stages-for-nudges', selectedCompanyId],
    queryFn: async () => {
      let query = supabase
        .from('fee_stages')
        .select('*, projects!inner(id, project_name, company_id)')

      if (selectedCompanyId) {
        query = query.eq('projects.company_id', selectedCompanyId)
      }

      const { data, error } = await query.order('stage_number', { ascending: true })
      if (error) throw error
      return data
    },
  })

  const nudges = useMemo<Nudge[]>(() => {
    if (!stagesWithProjects) return []
    const now = new Date()
    const result: Nudge[] = []

    for (const stage of stagesWithProjects) {
      const project = stage.projects as any
      const lumpsum = stage.lumpsum_amount ?? 0
      const paid = stage.amount_paid ?? 0

      // Skip stages effectively paid (TDS assumed)
      if (isEffectivelyPaid(lumpsum, paid)) continue

      // Short payment detection (paid < 90%)
      if (isShortPayment(lumpsum, paid) && stage.invoice_date) {
        const days = differenceInDays(now, new Date(stage.invoice_date))
        result.push({
          id: `nudge-short-${stage.id}`,
          projectId: project.id,
          projectName: project.project_name,
          stageId: stage.id,
          stageName: stage.stage_name,
          stageNumber: stage.stage_number,
          amount: lumpsum - paid,
          type: 'short_payment',
          message: `Short payment: ${project.project_name} — ${stage.stage_name}`,
          daysSince: days,
          severity: 'red',
        })
        continue
      }

      if (stage.payment_status === 'invoiced' && stage.invoice_date) {
        const days = differenceInDays(now, new Date(stage.invoice_date))
        let severity: 'red' | 'amber' | 'green' = 'green'
        if (days > 30) severity = 'red'
        else if (days > 7) severity = 'amber'

        result.push({
          id: `nudge-payment-${stage.id}`,
          projectId: project.id,
          projectName: project.project_name,
          stageId: stage.id,
          stageName: stage.stage_name,
          stageNumber: stage.stage_number,
          amount: lumpsum,
          type: 'awaiting_payment',
          message: `Awaiting payment: ${project.project_name} — ${stage.stage_name}`,
          daysSince: days,
          severity,
        })
      }

      if (stage.payment_status === 'pending' && stage.due_trigger === 'on_invoice') {
        result.push({
          id: `nudge-invoice-${stage.id}`,
          projectId: project.id,
          projectName: project.project_name,
          stageId: stage.id,
          stageName: stage.stage_name,
          stageNumber: stage.stage_number,
          amount: lumpsum,
          type: 'invoice_due',
          message: `Invoice due: ${project.project_name} — ${stage.stage_name}`,
          daysSince: 0,
          severity: 'green',
        })
      }
    }

    // Check for "deliver next stage" nudges
    if (allStages) {
      const byProject = new Map<string, typeof allStages>()
      for (const s of allStages) {
        const pid = (s.projects as any)?.id
        if (!pid) continue
        if (!byProject.has(pid)) byProject.set(pid, [])
        byProject.get(pid)!.push(s)
      }

      for (const [projectId, stages] of byProject) {
        const sorted = stages.sort((a, b) => a.stage_number - b.stage_number)
        for (let i = 0; i < sorted.length - 1; i++) {
          const current = sorted[i]
          const next = sorted[i + 1]
          const currentPaid = isEffectivelyPaid(current.lumpsum_amount ?? 0, current.amount_paid ?? 0)
          if ((current.payment_status === 'paid' || currentPaid) && next.payment_status === 'pending') {
            const project = current.projects as any
            result.push({
              id: `nudge-deliver-${next.id}`,
              projectId,
              projectName: project?.project_name ?? '',
              stageId: next.id,
              stageName: next.stage_name,
              stageNumber: next.stage_number,
              amount: next.lumpsum_amount ?? 0,
              type: 'deliver_next',
              message: `Deliver next: ${project?.project_name} — ${next.stage_name}`,
              daysSince: 0,
              severity: 'green',
            })
          }
        }
      }
    }

    const severityOrder = { red: 0, amber: 1, green: 2 }
    return result.sort((a, b) => severityOrder[a.severity] - severityOrder[b.severity])
  }, [stagesWithProjects, allStages])

  return { nudges, totalCount: nudges.length, refetch }
}
