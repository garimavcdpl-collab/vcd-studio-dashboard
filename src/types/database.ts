export type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[]

export interface Database {
  public: {
    Tables: {
      companies: {
        Row: {
          id: string
          name: string
          logo_url: string | null
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          logo_url?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          logo_url?: string | null
          created_at?: string
        }
        Relationships: []
      }
      projects: {
        Row: {
          id: string
          company_id: string | null
          project_name: string
          client_name: string
          client_contact: string | null
          areas_under_design: string[] | null
          total_contract_value: number | null
          contract_tenure_start: string | null
          contract_tenure_end: string | null
          status: 'active' | 'on-hold' | 'completed' | 'cancelled' | null
          notes: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          company_id?: string | null
          project_name: string
          client_name: string
          client_contact?: string | null
          areas_under_design?: string[] | null
          total_contract_value?: number | null
          contract_tenure_start?: string | null
          contract_tenure_end?: string | null
          status?: 'active' | 'on-hold' | 'completed' | 'cancelled' | null
          notes?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          company_id?: string | null
          project_name?: string
          client_name?: string
          client_contact?: string | null
          areas_under_design?: string[] | null
          total_contract_value?: number | null
          contract_tenure_start?: string | null
          contract_tenure_end?: string | null
          status?: 'active' | 'on-hold' | 'completed' | 'cancelled' | null
          notes?: string | null
          created_at?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: 'projects_company_id_fkey'
            columns: ['company_id']
            isOneToOne: false
            referencedRelation: 'companies'
            referencedColumns: ['id']
          },
        ]
      }
      fee_stages: {
        Row: {
          id: string
          project_id: string | null
          stage_name: string
          stage_number: number
          lumpsum_amount: number | null
          percentage_of_total: number | null
          due_trigger: 'on_invoice' | 'on_payment_received' | null
          invoice_date: string | null
          invoice_number: string | null
          payment_received_date: string | null
          payment_status: 'pending' | 'invoiced' | 'partial' | 'paid'
          amount_paid: number
          notes: string | null
        }
        Insert: {
          id?: string
          project_id?: string | null
          stage_name: string
          stage_number: number
          lumpsum_amount?: number | null
          percentage_of_total?: number | null
          due_trigger?: 'on_invoice' | 'on_payment_received' | null
          invoice_date?: string | null
          invoice_number?: string | null
          payment_received_date?: string | null
          payment_status?: 'pending' | 'invoiced' | 'partial' | 'paid'
          amount_paid?: number
          notes?: string | null
        }
        Update: {
          id?: string
          project_id?: string | null
          stage_name?: string
          stage_number?: number
          lumpsum_amount?: number | null
          percentage_of_total?: number | null
          due_trigger?: 'on_invoice' | 'on_payment_received' | null
          invoice_date?: string | null
          invoice_number?: string | null
          payment_received_date?: string | null
          payment_status?: 'pending' | 'invoiced' | 'partial' | 'paid'
          amount_paid?: number
          notes?: string | null
        }
        Relationships: [
          {
            foreignKeyName: 'fee_stages_project_id_fkey'
            columns: ['project_id']
            isOneToOne: false
            referencedRelation: 'projects'
            referencedColumns: ['id']
          },
        ]
      }
      travel_reimbursables: {
        Row: {
          id: string
          project_id: string | null
          description: string | null
          category: 'travel' | 'accommodation' | 'printing' | 'other' | null
          amount: number | null
          date: string | null
          invoice_ref: string | null
          reimbursed: boolean
          receipt_url: string | null
        }
        Insert: {
          id?: string
          project_id?: string | null
          description?: string | null
          category?: 'travel' | 'accommodation' | 'printing' | 'other' | null
          amount?: number | null
          date?: string | null
          invoice_ref?: string | null
          reimbursed?: boolean
          receipt_url?: string | null
        }
        Update: {
          id?: string
          project_id?: string | null
          description?: string | null
          category?: 'travel' | 'accommodation' | 'printing' | 'other' | null
          amount?: number | null
          date?: string | null
          invoice_ref?: string | null
          reimbursed?: boolean
          receipt_url?: string | null
        }
        Relationships: [
          {
            foreignKeyName: 'travel_reimbursables_project_id_fkey'
            columns: ['project_id']
            isOneToOne: false
            referencedRelation: 'projects'
            referencedColumns: ['id']
          },
        ]
      }
      expenses: {
        Row: {
          id: string
          company_id: string | null
          category: 'salary' | 'bonus' | 'rent' | 'software' | 'travel' | 'marketing' | 'misc' | null
          description: string | null
          amount: number | null
          date: string | null
          staff_name: string | null
          recurring: boolean
          notes: string | null
        }
        Insert: {
          id?: string
          company_id?: string | null
          category?: 'salary' | 'bonus' | 'rent' | 'software' | 'travel' | 'marketing' | 'misc' | null
          description?: string | null
          amount?: number | null
          date?: string | null
          staff_name?: string | null
          recurring?: boolean
          notes?: string | null
        }
        Update: {
          id?: string
          company_id?: string | null
          category?: 'salary' | 'bonus' | 'rent' | 'software' | 'travel' | 'marketing' | 'misc' | null
          description?: string | null
          amount?: number | null
          date?: string | null
          staff_name?: string | null
          recurring?: boolean
          notes?: string | null
        }
        Relationships: [
          {
            foreignKeyName: 'expenses_company_id_fkey'
            columns: ['company_id']
            isOneToOne: false
            referencedRelation: 'companies'
            referencedColumns: ['id']
          },
        ]
      }
      historical_financials: {
        Row: {
          id: string
          company_id: string | null
          year: number
          total_revenue: number | null
          total_expenses: number | null
          total_salaries: number | null
          total_bonuses: number | null
          total_reimbursables: number | null
          net_profit: number | null
          project_count: number | null
          notes: string | null
        }
        Insert: {
          id?: string
          company_id?: string | null
          year: number
          total_revenue?: number | null
          total_expenses?: number | null
          total_salaries?: number | null
          total_bonuses?: number | null
          total_reimbursables?: number | null
          net_profit?: number | null
          project_count?: number | null
          notes?: string | null
        }
        Update: {
          id?: string
          company_id?: string | null
          year?: number
          total_revenue?: number | null
          total_expenses?: number | null
          total_salaries?: number | null
          total_bonuses?: number | null
          total_reimbursables?: number | null
          net_profit?: number | null
          project_count?: number | null
          notes?: string | null
        }
        Relationships: [
          {
            foreignKeyName: 'historical_financials_company_id_fkey'
            columns: ['company_id']
            isOneToOne: false
            referencedRelation: 'companies'
            referencedColumns: ['id']
          },
        ]
      }
      staff: {
        Row: {
          id: string
          company_id: string | null
          name: string
          role: string | null
          monthly_salary: number | null
          join_date: string | null
          is_active: boolean
        }
        Insert: {
          id?: string
          company_id?: string | null
          name: string
          role?: string | null
          monthly_salary?: number | null
          join_date?: string | null
          is_active?: boolean
        }
        Update: {
          id?: string
          company_id?: string | null
          name?: string
          role?: string | null
          monthly_salary?: number | null
          join_date?: string | null
          is_active?: boolean
        }
        Relationships: [
          {
            foreignKeyName: 'staff_company_id_fkey'
            columns: ['company_id']
            isOneToOne: false
            referencedRelation: 'companies'
            referencedColumns: ['id']
          },
        ]
      }
      stage_templates: {
        Row: {
          id: string
          company_id: string | null
          template_name: string
          stages: Json
        }
        Insert: {
          id?: string
          company_id?: string | null
          template_name: string
          stages: Json
        }
        Update: {
          id?: string
          company_id?: string | null
          template_name?: string
          stages?: Json
        }
        Relationships: [
          {
            foreignKeyName: 'stage_templates_company_id_fkey'
            columns: ['company_id']
            isOneToOne: false
            referencedRelation: 'companies'
            referencedColumns: ['id']
          },
        ]
      }
      user_roles: {
        Row: {
          id: string
          user_id: string | null
          display_name: string
          role: 'admin' | 'viewer'
          company_access: string[] | null
          force_password_reset: boolean
        }
        Insert: {
          id?: string
          user_id?: string | null
          display_name: string
          role: 'admin' | 'viewer'
          company_access?: string[] | null
          force_password_reset?: boolean
        }
        Update: {
          id?: string
          user_id?: string | null
          display_name?: string
          role?: 'admin' | 'viewer'
          company_access?: string[] | null
          force_password_reset?: boolean
        }
        Relationships: []
      }
      audit_log: {
        Row: {
          id: string
          user_id: string | null
          user_name: string | null
          action: string
          entity_type: string | null
          entity_id: string | null
          details: Json | null
          created_at: string
        }
        Insert: {
          id?: string
          user_id?: string | null
          user_name?: string | null
          action: string
          entity_type?: string | null
          entity_id?: string | null
          details?: Json | null
          created_at?: string
        }
        Update: {
          id?: string
          user_id?: string | null
          user_name?: string | null
          action?: string
          entity_type?: string | null
          entity_id?: string | null
          details?: Json | null
          created_at?: string
        }
        Relationships: []
      }
    }
    Views: Record<string, never>
    Functions: Record<string, never>
  }
}

export type Company = Database['public']['Tables']['companies']['Row']
export type Project = Database['public']['Tables']['projects']['Row']
export type FeeStage = Database['public']['Tables']['fee_stages']['Row']
export type TravelReimbursable = Database['public']['Tables']['travel_reimbursables']['Row']
export type Expense = Database['public']['Tables']['expenses']['Row']
export type HistoricalFinancial = Database['public']['Tables']['historical_financials']['Row']
export type Staff = Database['public']['Tables']['staff']['Row']
export type StageTemplate = Database['public']['Tables']['stage_templates']['Row']
export type UserRole = Database['public']['Tables']['user_roles']['Row']
export type AuditLogEntry = Database['public']['Tables']['audit_log']['Row']

export type ProjectStatus = 'active' | 'on-hold' | 'completed' | 'cancelled'
export type PaymentStatus = 'pending' | 'invoiced' | 'partial' | 'paid'
export type ExpenseCategory = 'salary' | 'bonus' | 'rent' | 'software' | 'travel' | 'marketing' | 'misc'
export type ReimbursableCategory = 'travel' | 'accommodation' | 'printing' | 'other'
export type DueTrigger = 'on_invoice' | 'on_payment_received'
export type Role = 'admin' | 'viewer'
