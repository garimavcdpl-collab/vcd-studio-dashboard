import { useState, useEffect, useCallback } from 'react'
import { useNavigate } from 'react-router-dom'
import { useQuery } from '@tanstack/react-query'
import { Search, FolderOpen, FileText } from 'lucide-react'
import { supabase } from '@/lib/supabase'
import { formatINR } from '@/lib/format'
import { useCompany } from '@/hooks/useCompany'
import { Input } from '@/components/ui/input'
import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Skeleton } from '@/components/ui/skeleton'
import { ProjectStatusBadge, PaymentStatusBadge } from '@/components/shared/StatusBadge'
import { EmptyState } from '@/components/shared/EmptyState'
import type { Project, FeeStage } from '@/types/database'

export function SearchPage() {
  const [query, setQuery] = useState('')
  const [debouncedQuery, setDebouncedQuery] = useState('')
  const navigate = useNavigate()
  const { selectedCompanyId } = useCompany()

  useEffect(() => {
    const timer = setTimeout(() => setDebouncedQuery(query), 300)
    return () => clearTimeout(timer)
  }, [query])

  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if ((e.metaKey || e.ctrlKey) && e.key === 'k') {
        e.preventDefault()
        document.getElementById('global-search')?.focus()
      }
    }
    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [])

  const { data: projects = [], isLoading: projectsLoading } = useQuery({
    queryKey: ['search-projects', debouncedQuery, selectedCompanyId],
    queryFn: async () => {
      if (!debouncedQuery || debouncedQuery.length < 2) return []
      let q = supabase.from('projects').select('*')
      if (selectedCompanyId) q = q.eq('company_id', selectedCompanyId)
      q = q.or(
        `project_name.ilike.%${debouncedQuery}%,client_name.ilike.%${debouncedQuery}%,notes.ilike.%${debouncedQuery}%`,
      )
      const { data, error } = await q.limit(20)
      if (error) throw error
      return data as Project[]
    },
    enabled: debouncedQuery.length >= 2,
  })

  const { data: stages = [], isLoading: stagesLoading } = useQuery({
    queryKey: ['search-stages', debouncedQuery, selectedCompanyId],
    queryFn: async () => {
      if (!debouncedQuery || debouncedQuery.length < 2) return []
      const { data, error } = await supabase
        .from('fee_stages')
        .select('*, projects!inner(id, project_name, company_id)')
        .or(
          `stage_name.ilike.%${debouncedQuery}%,invoice_number.ilike.%${debouncedQuery}%,notes.ilike.%${debouncedQuery}%`,
        )
        .limit(20)
      if (error) throw error
      return data
    },
    enabled: debouncedQuery.length >= 2,
  })

  const { data: projectStages = [] } = useQuery({
    queryKey: ['search-project-stages', projects.map((p) => p.id)],
    queryFn: async () => {
      if (projects.length === 0) return []
      const { data, error } = await supabase
        .from('fee_stages')
        .select('*')
        .in(
          'project_id',
          projects.map((p) => p.id),
        )
        .order('stage_number')
      if (error) throw error
      return data as FeeStage[]
    },
    enabled: projects.length > 0,
  })

  const isLoading = projectsLoading || stagesLoading
  const hasResults = projects.length > 0 || stages.length > 0
  const showEmpty = debouncedQuery.length >= 2 && !isLoading && !hasResults

  const getProjectStages = useCallback(
    (projectId: string) => projectStages.filter((s) => s.project_id === projectId),
    [projectStages],
  )

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold mb-4">Search</h1>
        <div className="relative">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input
            id="global-search"
            placeholder="Search projects, invoices, stages... (Ctrl+K)"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            className="pl-10 h-12 text-lg"
            autoFocus
          />
        </div>
      </div>

      {isLoading && debouncedQuery.length >= 2 && (
        <div className="space-y-4">
          <Skeleton className="h-32" />
          <Skeleton className="h-32" />
        </div>
      )}

      {showEmpty && (
        <EmptyState
          icon={Search}
          title="No results found"
          description={`Nothing matched "${debouncedQuery}". Try a different search term.`}
        />
      )}

      {projects.length > 0 && (
        <div className="space-y-3">
          <h2 className="text-lg font-semibold flex items-center gap-2">
            <FolderOpen className="h-5 w-5" />
            Projects ({projects.length})
          </h2>
          {projects.map((project) => {
            const pStages = getProjectStages(project.id)
            const collected = pStages.reduce((sum, s) => sum + (s.amount_paid ?? 0), 0)
            const pending = (project.total_contract_value ?? 0) - collected
            return (
              <Card
                key={project.id}
                className="cursor-pointer hover:bg-muted/50 transition-colors"
                onClick={() => navigate(`/projects/${project.id}`)}
              >
                <CardContent className="p-4">
                  <div className="flex items-start justify-between gap-4">
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2 mb-1">
                        <h3 className="font-semibold truncate">{project.project_name}</h3>
                        <ProjectStatusBadge status={project.status} />
                      </div>
                      <p className="text-sm text-muted-foreground mb-2">{project.client_name}</p>
                      {project.areas_under_design && project.areas_under_design.length > 0 && (
                        <div className="flex flex-wrap gap-1 mb-2">
                          {project.areas_under_design.map((area) => (
                            <Badge key={area} variant="outline" className="text-xs">
                              {area}
                            </Badge>
                          ))}
                        </div>
                      )}
                      {pStages.length > 0 && (
                        <div className="space-y-1 mt-2">
                          {pStages.map((stage) => (
                            <div
                              key={stage.id}
                              className="flex items-center gap-2 text-xs text-muted-foreground"
                            >
                              <span className="font-medium">{stage.stage_name}</span>
                              <PaymentStatusBadge status={stage.payment_status} />
                              <span className="font-mono">{formatINR(stage.lumpsum_amount)}</span>
                            </div>
                          ))}
                        </div>
                      )}
                    </div>
                    <div className="text-right shrink-0">
                      <p className="font-mono font-semibold">
                        {formatINR(project.total_contract_value)}
                      </p>
                      <p className="text-xs text-emerald-600 dark:text-emerald-400 font-mono">
                        Collected: {formatINR(collected)}
                      </p>
                      <p className="text-xs text-amber-600 dark:text-amber-400 font-mono">
                        Pending: {formatINR(pending)}
                      </p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            )
          })}
        </div>
      )}

      {stages.length > 0 && (
        <div className="space-y-3">
          <h2 className="text-lg font-semibold flex items-center gap-2">
            <FileText className="h-5 w-5" />
            Invoices / Stages ({stages.length})
          </h2>
          {stages.map((stage: any) => (
            <Card
              key={stage.id}
              className="cursor-pointer hover:bg-muted/50 transition-colors"
              onClick={() => navigate(`/projects/${stage.projects?.id}`)}
            >
              <CardContent className="p-4">
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">{stage.stage_name}</p>
                    <p className="text-sm text-muted-foreground">{stage.projects?.project_name}</p>
                    {stage.invoice_number && (
                      <p className="text-xs text-muted-foreground">
                        Invoice: {stage.invoice_number}
                      </p>
                    )}
                  </div>
                  <div className="text-right">
                    <p className="font-mono font-semibold">{formatINR(stage.lumpsum_amount)}</p>
                    <PaymentStatusBadge status={stage.payment_status} />
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      )}

      {!debouncedQuery && (
        <div className="text-center py-16 text-muted-foreground">
          <Search className="h-12 w-12 mx-auto mb-4 opacity-20" />
          <p>Start typing to search across projects, invoices, and expenses</p>
          <p className="text-xs mt-1">Tip: Press Ctrl+K from anywhere to jump here</p>
        </div>
      )}
    </div>
  )
}
