-- 002_stage_templates.sql — Reusable fee-stage templates

CREATE TABLE stage_templates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id UUID REFERENCES companies(id),
  template_name TEXT NOT NULL,
  stages JSONB NOT NULL
);
