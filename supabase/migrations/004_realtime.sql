-- 004_realtime.sql — Enable Supabase Realtime on key tables

ALTER PUBLICATION supabase_realtime ADD TABLE fee_stages;
ALTER PUBLICATION supabase_realtime ADD TABLE projects;
ALTER PUBLICATION supabase_realtime ADD TABLE audit_log;
