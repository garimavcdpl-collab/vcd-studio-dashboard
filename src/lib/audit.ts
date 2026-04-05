import { supabase } from './supabase'

export async function logAudit(params: {
  action: string
  entityType?: string
  entityId?: string
  details?: Record<string, unknown>
}) {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return

  const { data: userRole } = await supabase
    .from('user_roles')
    .select('display_name')
    .eq('user_id', user.id)
    .single()

  await supabase.from('audit_log').insert({
    user_id: user.id,
    user_name: userRole?.display_name ?? user.email ?? 'Unknown',
    action: params.action,
    entity_type: params.entityType,
    entity_id: params.entityId,
    details: params.details as any,
  })
}
