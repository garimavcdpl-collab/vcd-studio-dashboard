import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import { AuthProvider } from './contexts/AuthContext'

// Apply saved theme immediately before first render to prevent flash
;(function () {
  const stored = localStorage.getItem('studio-theme')
  const theme = stored === 'light' ? 'light' : 'dark' // default dark
  if (theme === 'dark') document.documentElement.classList.add('dark')
})()

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <AuthProvider>
      <App />
    </AuthProvider>
  </StrictMode>,
)
