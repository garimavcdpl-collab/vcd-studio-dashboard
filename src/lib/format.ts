export function formatINR(amount: number | null | undefined): string {
  if (amount == null) return '₹0'
  return new Intl.NumberFormat('en-IN', {
    style: 'currency',
    currency: 'INR',
    maximumFractionDigits: 0,
  }).format(amount)
}

export function formatNumber(num: number | null | undefined): string {
  if (num == null) return '0'
  return new Intl.NumberFormat('en-IN').format(num)
}

export function formatPercentage(value: number | null | undefined): string {
  if (value == null) return '0%'
  return `${value.toFixed(1)}%`
}

export function parseIndianAmount(raw: string): number {
  if (!raw || typeof raw !== 'string') return 0
  let cleaned = raw.trim().replace(/₹/g, '').replace(/\s/g, '')

  // Handle Crore notation: "1.25Cr" or "1.25 Crore"
  const crMatch = cleaned.match(/^([\d,.]+)\s*(cr|crore)s?$/i)
  if (crMatch) {
    return parseFloat(crMatch[1].replace(/,/g, '')) * 10000000
  }

  // Handle Lakh notation: "12.5L" or "12 Lakhs" or "₹12 Lakhs"
  const lMatch = cleaned.match(/^([\d,.]+)\s*(l|lakh|lac)s?$/i)
  if (lMatch) {
    return parseFloat(lMatch[1].replace(/,/g, '')) * 100000
  }

  // Handle Indian comma format: "12,50,000" or "12,50,000.00"
  cleaned = cleaned.replace(/,/g, '')
  const num = parseFloat(cleaned)
  return isNaN(num) ? 0 : num
}
