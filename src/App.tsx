import { BrowserRouter, Routes, Route, Navigate, Outlet } from 'react-router-dom'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { AppLayout } from '@/components/layout/AppLayout'
import { CompanyProvider } from '@/components/layout/CompanyProvider'
import { LoginPage } from '@/pages/auth/LoginPage'
import { SetPasswordPage } from '@/pages/auth/SetPasswordPage'
import DashboardPage from '@/pages/dashboard/DashboardPage'
import { ProjectsPage } from '@/pages/projects/ProjectsPage'
import { ProjectDetailPage } from '@/pages/projects/ProjectDetailPage'
import { InvoicingPage } from '@/pages/invoicing/InvoicingPage'
import { FinancialsPage } from '@/pages/financials/FinancialsPage'
import { StaffPage } from '@/pages/staff/StaffPage'
import { SearchPage } from '@/pages/search/SearchPage'
import { UsersPage } from '@/pages/admin/UsersPage'
import { ImportExcelPage } from '@/pages/admin/ImportExcelPage'
import { useAuth } from '@/hooks/useAuth'
import { useRole } from '@/hooks/useRole'

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 1000 * 60 * 2,
      retry: 1,
    },
  },
})

function ProtectedRoute() {
  const { user, loading } = useAuth()
  const { forcePasswordReset, loading: roleLoading } = useRole()

  if (loading || roleLoading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background">
        <div className="animate-pulse flex flex-col items-center gap-3">
          <div className="h-12 w-12 rounded-xl bg-primary flex items-center justify-center">
            <span className="text-lg font-bold text-primary-foreground">VCD</span>
          </div>
          <p className="text-sm text-muted-foreground">Loading...</p>
        </div>
      </div>
    )
  }

  if (!user) return <Navigate to="/login" replace />
  if (forcePasswordReset) return <Navigate to="/set-password" replace />

  return (
    <CompanyProvider>
      <AppLayout />
    </CompanyProvider>
  )
}

function AdminRoute() {
  const { isAdmin, loading } = useRole()
  // Wait for role to load before deciding — avoids redirect race condition
  if (loading) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="animate-pulse text-sm text-muted-foreground">Checking access...</div>
      </div>
    )
  }
  if (!isAdmin) return <Navigate to="/dashboard" replace />
  return <Outlet />
}

export default function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/set-password" element={<SetPasswordPage />} />

          <Route element={<ProtectedRoute />}>
            <Route path="/dashboard" element={<DashboardPage />} />
            <Route path="/projects" element={<ProjectsPage />} />
            <Route path="/projects/:id" element={<ProjectDetailPage />} />
            <Route path="/invoicing" element={<InvoicingPage />} />
            <Route path="/financials" element={<FinancialsPage />} />
            <Route path="/staff" element={<StaffPage />} />
            <Route path="/search" element={<SearchPage />} />

            <Route element={<AdminRoute />}>
              <Route path="/admin/users" element={<UsersPage />} />
              <Route path="/admin/import-excel" element={<ImportExcelPage />} />
            </Route>

            <Route path="/" element={<Navigate to="/dashboard" replace />} />
          </Route>

          <Route path="*" element={<Navigate to="/dashboard" replace />} />
        </Routes>
      </BrowserRouter>
    </QueryClientProvider>
  )
}
