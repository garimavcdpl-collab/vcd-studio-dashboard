# VCD Studio Dashboard

Project & Financial Management Dashboard for a hospitality design consultancy.
Supports two companies (VCDPL and VCDLLP) under one deployment.

## Tech Stack

- React 18 + Vite (TypeScript, strict mode)
- Tailwind CSS v4 + shadcn/ui
- Supabase (database + auth + realtime)
- TanStack Query v5 + TanStack Table v8
- Recharts for charts
- React Hook Form + Zod for forms
- @dnd-kit for drag-and-drop stage reordering
- React Router v6

## First-Time Setup

1. Clone repo, run: `npm install`
2. Create Supabase project at supabase.com
3. Copy Project URL + anon key to `.env`:
   ```
   VITE_SUPABASE_URL=https://your-project.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key
   SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
   ```
4. Run migrations in order:
   ```
   supabase db push
   ```
   Or run manually: `001_initial.sql` → `002_stage_templates.sql` → `003_auth_roles.sql` → `004_realtime.sql`
5. Add email addresses to `.env`:
   ```
   GARIMA_EMAIL=garima@example.com
   PRATEEK_EMAIL=prateek@example.com
   RVR_EMAIL=rvr@example.com
   ```
6. Create users: `npx ts-node scripts/create-users.ts`
7. Place legacy Excel file in `/data/` folder
8. Parse Excel: `npx ts-node scripts/import-excel.ts`
   Review generated `/supabase/seed-from-excel.sql`
9. Run seed: `npx ts-node scripts/run-seed.ts`
10. Start app: `npm run dev`
11. Open browser, log in with Garima or Prateek email
12. Set your password on first login
13. Go to `/admin/import-excel` to verify all imported data

## User Access

| User    | Role   | Edit Access | Notes                     |
|---------|--------|-------------|---------------------------|
| Garima  | Admin  | Full        | All features + user mgmt  |
| Prateek | Admin  | Full        | All features + user mgmt  |
| RVR     | Viewer | Read-only   | Salaries hidden, no edits |

## Pages

- `/dashboard` — KPI cards, revenue/expense charts, nudge panel
- `/projects` — Project list with search, filters, sort
- `/projects/:id` — Project detail with fee stages, reimbursables, timeline
- `/invoicing` — All invoices across projects, bulk actions, payment logging
- `/financials` — Current year expenses + 7-year historical data with charts
- `/staff` — Staff list with salary tracking
- `/search` — Global search across projects, invoices, and expenses (Ctrl+K)
- `/admin/users` — User management + audit log
- `/admin/import-excel` — One-time Excel data migration

## Development

```bash
npm run dev      # Start dev server
npm run build    # Production build
npm run preview  # Preview production build
```
