-- 001_initial.sql — Core tables

CREATE TABLE companies (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  logo_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE projects (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id UUID REFERENCES companies(id),
  project_name TEXT NOT NULL,
  client_name TEXT NOT NULL,
  client_contact TEXT,
  areas_under_design TEXT[],
  total_contract_value NUMERIC,
  contract_tenure_start DATE,
  contract_tenure_end DATE,
  status TEXT CHECK (status IN ('active','on-hold','completed','cancelled')),
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE fee_stages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  stage_name TEXT NOT NULL,
  stage_number INT NOT NULL,
  lumpsum_amount NUMERIC,
  percentage_of_total NUMERIC,
  due_trigger TEXT CHECK (due_trigger IN ('on_invoice','on_payment_received')),
  invoice_date DATE,
  invoice_number TEXT,
  payment_received_date DATE,
  payment_status TEXT CHECK (payment_status IN ('pending','invoiced','partial','paid'))
    DEFAULT 'pending',
  amount_paid NUMERIC DEFAULT 0,
  notes TEXT
);

CREATE TABLE travel_reimbursables (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  description TEXT,
  category TEXT CHECK (category IN ('travel','accommodation','printing','other')),
  amount NUMERIC,
  date DATE,
  invoice_ref TEXT,
  reimbursed BOOLEAN DEFAULT false,
  receipt_url TEXT
);

CREATE TABLE expenses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id UUID REFERENCES companies(id),
  category TEXT CHECK (category IN ('salary','bonus','rent','software','travel','marketing','misc')),
  description TEXT,
  amount NUMERIC,
  date DATE,
  staff_name TEXT,
  recurring BOOLEAN DEFAULT false,
  notes TEXT
);

CREATE TABLE historical_financials (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id UUID REFERENCES companies(id),
  year INT NOT NULL,
  total_revenue NUMERIC,
  total_expenses NUMERIC,
  total_salaries NUMERIC,
  total_bonuses NUMERIC,
  total_reimbursables NUMERIC,
  net_profit NUMERIC,
  project_count INT,
  notes TEXT,
  UNIQUE(company_id, year)
);

CREATE TABLE staff (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id UUID REFERENCES companies(id),
  name TEXT NOT NULL,
  role TEXT,
  monthly_salary NUMERIC,
  join_date DATE,
  is_active BOOLEAN DEFAULT true
);

CREATE INDEX ON projects(company_id);
CREATE INDEX ON projects(status);
CREATE INDEX ON fee_stages(project_id);
CREATE INDEX ON fee_stages(payment_status);
CREATE INDEX ON expenses(company_id, date);
