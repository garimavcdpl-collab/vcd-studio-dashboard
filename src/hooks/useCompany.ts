import { createContext, useContext } from 'react'

export interface CompanyContextType {
  selectedCompanyId: string | null
  setSelectedCompanyId: (id: string) => void
  companies: Array<{ id: string; name: string }>
  loading: boolean
}

export const CompanyContext = createContext<CompanyContextType>({
  selectedCompanyId: null,
  setSelectedCompanyId: () => {},
  companies: [],
  loading: true,
})

export function useCompany() {
  return useContext(CompanyContext)
}
