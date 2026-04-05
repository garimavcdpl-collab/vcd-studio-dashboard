import { useEffect, useState, useCallback } from 'react'

type Theme = 'light' | 'dark'

let globalTheme: Theme | null = null

function getInitialTheme(): Theme {
  if (typeof window === 'undefined') return 'dark'
  const stored = localStorage.getItem('studio-theme') as Theme | null
  if (stored === 'light' || stored === 'dark') return stored
  // Default to dark — matches the dashboard's intended aesthetic
  return 'dark'
}

export function useTheme() {
  const [theme, setThemeState] = useState<Theme>(() => globalTheme ?? getInitialTheme())

  useEffect(() => {
    const root = document.documentElement
    if (theme === 'dark') {
      root.classList.add('dark')
    } else {
      root.classList.remove('dark')
    }
    globalTheme = theme
    localStorage.setItem('studio-theme', theme)
  }, [theme])

  const toggleTheme = useCallback(() => {
    setThemeState(prev => prev === 'dark' ? 'light' : 'dark')
  }, [])

  const setTheme = useCallback((t: Theme) => {
    setThemeState(t)
  }, [])

  return { theme, toggleTheme, setTheme, isDark: theme === 'dark' }
}
