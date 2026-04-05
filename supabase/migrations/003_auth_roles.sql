-- 003_auth_roles.sql — Authentication, roles, RLS policies, and audit logging

-- ============================================================
-- 1. User roles table
-- ============================================================
CREATE TABLE user_roles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  role TEXT NOT NULL CHECK (role IN ('admin','viewer')),
  company_access UUID[] DEFAULT '{}',
  force_password_reset BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(user_id)
);

-- ============================================================
-- 2. Audit log table
-- ============================================================
CREATE TABLE audit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  action TEXT NOT NULL,
  table_name TEXT,
  record_id UUID,
  old_data JSONB,
  new_data JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_audit_log_created_at ON audit_log(created_at DESC);

-- ============================================================
-- 3. Helper functions
-- ============================================================
CREATE OR REPLACE FUNCTION get_user_role()
RETURNS TEXT
LANGUAGE sql
STABLE
SECURITY DEFINER
AS $$
  SELECT role FROM user_roles WHERE user_id = auth.uid();
$$;

CREATE OR REPLACE FUNCTION get_user_company_access()
RETURNS UUID[]
LANGUAGE sql
STABLE
SECURITY DEFINER
AS $$
  SELECT COALESCE(company_access, '{}') FROM user_roles WHERE user_id = auth.uid();
$$;

-- ============================================================
-- 4. Staff public view (masks salary for viewers)
-- ============================================================
CREATE OR REPLACE VIEW staff_public AS
SELECT
  id,
  company_id,
  name,
  role,
  CASE
    WHEN get_user_role() = 'admin' THEN monthly_salary
    ELSE NULL
  END AS monthly_salary,
  join_date,
  is_active
FROM staff;

-- ============================================================
-- 5. Enable RLS on all tables
-- ============================================================
ALTER TABLE companies             ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects              ENABLE ROW LEVEL SECURITY;
ALTER TABLE fee_stages            ENABLE ROW LEVEL SECURITY;
ALTER TABLE travel_reimbursables  ENABLE ROW LEVEL SECURITY;
ALTER TABLE expenses              ENABLE ROW LEVEL SECURITY;
ALTER TABLE historical_financials ENABLE ROW LEVEL SECURITY;
ALTER TABLE staff                 ENABLE ROW LEVEL SECURITY;
ALTER TABLE stage_templates       ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_roles            ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_log             ENABLE ROW LEVEL SECURITY;

-- ============================================================
-- 6. RLS policies — companies
-- ============================================================
CREATE POLICY "admin_companies_all" ON companies
  FOR ALL
  USING (
    get_user_role() = 'admin'
    AND id = ANY(get_user_company_access())
  )
  WITH CHECK (
    get_user_role() = 'admin'
    AND id = ANY(get_user_company_access())
  );

CREATE POLICY "viewer_companies_select" ON companies
  FOR SELECT
  USING (
    get_user_role() = 'viewer'
    AND id = ANY(get_user_company_access())
  );

-- ============================================================
-- 7. RLS policies — projects
-- ============================================================
CREATE POLICY "admin_projects_all" ON projects
  FOR ALL
  USING (
    get_user_role() = 'admin'
    AND company_id = ANY(get_user_company_access())
  )
  WITH CHECK (
    get_user_role() = 'admin'
    AND company_id = ANY(get_user_company_access())
  );

CREATE POLICY "viewer_projects_select" ON projects
  FOR SELECT
  USING (
    get_user_role() = 'viewer'
    AND company_id = ANY(get_user_company_access())
  );

-- ============================================================
-- 8. RLS policies — fee_stages
-- ============================================================
CREATE POLICY "admin_fee_stages_all" ON fee_stages
  FOR ALL
  USING (
    get_user_role() = 'admin'
    AND project_id IN (
      SELECT id FROM projects WHERE company_id = ANY(get_user_company_access())
    )
  )
  WITH CHECK (
    get_user_role() = 'admin'
    AND project_id IN (
      SELECT id FROM projects WHERE company_id = ANY(get_user_company_access())
    )
  );

CREATE POLICY "viewer_fee_stages_select" ON fee_stages
  FOR SELECT
  USING (
    get_user_role() = 'viewer'
    AND project_id IN (
      SELECT id FROM projects WHERE company_id = ANY(get_user_company_access())
    )
  );

-- ============================================================
-- 9. RLS policies — travel_reimbursables
-- ============================================================
CREATE POLICY "admin_travel_reimbursables_all" ON travel_reimbursables
  FOR ALL
  USING (
    get_user_role() = 'admin'
    AND project_id IN (
      SELECT id FROM projects WHERE company_id = ANY(get_user_company_access())
    )
  )
  WITH CHECK (
    get_user_role() = 'admin'
    AND project_id IN (
      SELECT id FROM projects WHERE company_id = ANY(get_user_company_access())
    )
  );

CREATE POLICY "viewer_travel_reimbursables_select" ON travel_reimbursables
  FOR SELECT
  USING (
    get_user_role() = 'viewer'
    AND project_id IN (
      SELECT id FROM projects WHERE company_id = ANY(get_user_company_access())
    )
  );

-- ============================================================
-- 10. RLS policies — expenses (admin only, no viewer access)
-- ============================================================
CREATE POLICY "admin_expenses_all" ON expenses
  FOR ALL
  USING (
    get_user_role() = 'admin'
    AND company_id = ANY(get_user_company_access())
  )
  WITH CHECK (
    get_user_role() = 'admin'
    AND company_id = ANY(get_user_company_access())
  );

-- ============================================================
-- 11. RLS policies — historical_financials
-- ============================================================
CREATE POLICY "admin_historical_financials_all" ON historical_financials
  FOR ALL
  USING (
    get_user_role() = 'admin'
    AND company_id = ANY(get_user_company_access())
  )
  WITH CHECK (
    get_user_role() = 'admin'
    AND company_id = ANY(get_user_company_access())
  );

CREATE POLICY "viewer_historical_financials_select" ON historical_financials
  FOR SELECT
  USING (
    get_user_role() = 'viewer'
    AND company_id = ANY(get_user_company_access())
  );

-- ============================================================
-- 12. RLS policies — staff (viewers should use staff_public view)
-- ============================================================
CREATE POLICY "admin_staff_all" ON staff
  FOR ALL
  USING (
    get_user_role() = 'admin'
    AND company_id = ANY(get_user_company_access())
  )
  WITH CHECK (
    get_user_role() = 'admin'
    AND company_id = ANY(get_user_company_access())
  );

CREATE POLICY "viewer_staff_select" ON staff
  FOR SELECT
  USING (
    get_user_role() = 'viewer'
    AND company_id = ANY(get_user_company_access())
  );

-- ============================================================
-- 13. RLS policies — stage_templates
-- ============================================================
CREATE POLICY "admin_stage_templates_all" ON stage_templates
  FOR ALL
  USING (
    get_user_role() = 'admin'
    AND company_id = ANY(get_user_company_access())
  )
  WITH CHECK (
    get_user_role() = 'admin'
    AND company_id = ANY(get_user_company_access())
  );

CREATE POLICY "viewer_stage_templates_select" ON stage_templates
  FOR SELECT
  USING (
    get_user_role() = 'viewer'
    AND company_id = ANY(get_user_company_access())
  );

-- ============================================================
-- 14. RLS policies — user_roles (admin only, no viewer access)
-- ============================================================
CREATE POLICY "admin_user_roles_all" ON user_roles
  FOR ALL
  USING (
    get_user_role() = 'admin'
  )
  WITH CHECK (
    get_user_role() = 'admin'
  );

-- ============================================================
-- 15. RLS policies — audit_log (admin only, no viewer access)
-- ============================================================
CREATE POLICY "admin_audit_log_all" ON audit_log
  FOR ALL
  USING (
    get_user_role() = 'admin'
  )
  WITH CHECK (
    get_user_role() = 'admin'
  );
