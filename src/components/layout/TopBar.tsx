import { Sun, Moon, Bell, LogOut, Menu, Building2 } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { useTheme } from '@/hooks/useTheme'
import { useAuth } from '@/hooks/useAuth'
import { useRole } from '@/hooks/useRole'
import { useNudges } from '@/hooks/useNudges'
import { useCompany } from '@/hooks/useCompany'
import { useNavigate } from 'react-router-dom'

interface TopBarProps {
  onToggleSidebar: () => void
}

export function TopBar({ onToggleSidebar }: TopBarProps) {
  const { theme, toggleTheme } = useTheme()
  const { signOut } = useAuth()
  const { displayName } = useRole()
  const { totalCount } = useNudges()
  const { companies, selectedCompanyId, setSelectedCompanyId } = useCompany()
  const navigate = useNavigate()

  const handleSignOut = async () => {
    await signOut()
    navigate('/login')
  }

  const initials = displayName
    .split(' ')
    .map((n) => n[0])
    .slice(0, 2)
    .join('')
    .toUpperCase()

  return (
    <header className="sticky top-0 z-40 h-14 border-b border-border/60 bg-card/90 backdrop-blur-md supports-[backdrop-filter]:bg-card/80 shadow-sm">
      <div className="flex h-full items-center px-4 gap-3">
        {/* Mobile menu toggle */}
        <Button
          variant="ghost"
          size="icon"
          className="md:hidden h-8 w-8 text-muted-foreground hover:text-foreground"
          onClick={onToggleSidebar}
        >
          <Menu className="h-4 w-4" />
        </Button>

        {/* Logo */}
        <div className="flex items-center gap-2.5">
          <div className="h-8 w-8 rounded-lg bg-primary flex items-center justify-center shadow-sm">
            <span className="text-[11px] font-black text-primary-foreground tracking-tight">VCD</span>
          </div>
          <div className="hidden sm:block">
            <span className="font-bold text-sm text-foreground">Studio</span>
            <span className="font-light text-sm text-muted-foreground ml-1">Dashboard</span>
          </div>
        </div>

        {/* Divider */}
        <div className="hidden md:block h-5 w-px bg-border mx-1" />

        {/* Company switcher */}
        <div className="flex items-center gap-1">
          {companies.map((company) => (
            <button
              key={company.id}
              onClick={() => setSelectedCompanyId(company.id)}
              className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-semibold transition-all duration-150 ${
                selectedCompanyId === company.id
                  ? 'bg-primary text-primary-foreground shadow-sm'
                  : 'text-muted-foreground hover:text-foreground hover:bg-muted'
              }`}
            >
              <Building2 className="h-3 w-3" />
              {company.name}
            </button>
          ))}
        </div>

        <div className="flex-1" />

        {/* Actions */}
        <div className="flex items-center gap-1">
          {/* Notifications bell */}
          <Button
            variant="ghost"
            size="icon"
            className="relative h-8 w-8 text-muted-foreground hover:text-foreground"
            onClick={() => {
              navigate('/dashboard')
              setTimeout(() => {
                document.getElementById('nudges-panel')?.scrollIntoView({ behavior: 'smooth' })
              }, 100)
            }}
          >
            <Bell className="h-4 w-4" />
            {totalCount > 0 && (
              <span className="absolute -top-0.5 -right-0.5 h-4 min-w-4 rounded-full bg-red-500 text-[9px] font-bold text-white flex items-center justify-center px-1 shadow-sm">
                {totalCount > 9 ? '9+' : totalCount}
              </span>
            )}
          </Button>

          {/* Theme toggle */}
          <Button
            variant="ghost"
            size="icon"
            className="h-8 w-8 text-muted-foreground hover:text-foreground"
            onClick={toggleTheme}
          >
            {theme === 'dark' ? <Sun className="h-4 w-4" /> : <Moon className="h-4 w-4" />}
          </Button>

          {/* Divider */}
          <div className="h-5 w-px bg-border mx-1" />

          {/* User avatar */}
          <div className="flex items-center gap-2">
            <div className="h-7 w-7 rounded-full bg-primary/20 border border-primary/30 flex items-center justify-center">
              <span className="text-[10px] font-bold text-primary">{initials}</span>
            </div>
            <span className="text-sm font-medium hidden md:block text-foreground">{displayName}</span>
          </div>

          {/* Sign out */}
          <Button
            variant="ghost"
            size="icon"
            className="h-8 w-8 text-muted-foreground hover:text-destructive"
            onClick={handleSignOut}
            title="Sign out"
          >
            <LogOut className="h-4 w-4" />
          </Button>
        </div>
      </div>
    </header>
  )
}
