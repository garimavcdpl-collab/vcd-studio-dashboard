import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useForm } from 'react-hook-form'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Button } from '@/components/ui/button'
import { useAuth } from '@/hooks/useAuth'
import { useRole } from '@/hooks/useRole'
import { supabase } from '@/lib/supabase'

interface SetPasswordForm {
  password: string
  confirmPassword: string
}

export function SetPasswordPage() {
  const navigate = useNavigate()
  const { updatePassword } = useAuth()
  const { displayName } = useRole()
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)

  const {
    register,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm<SetPasswordForm>()

  const password = watch('password', '')

  const validatePassword = (value: string) => {
    if (value.length < 8) return 'Password must be at least 8 characters'
    if (!/[A-Z]/.test(value)) return 'Must contain at least 1 uppercase letter'
    if (!/[0-9]/.test(value)) return 'Must contain at least 1 number'
    return true
  }

  const onSubmit = async (data: SetPasswordForm) => {
    setError('')
    setLoading(true)
    try {
      await updatePassword(data.password)
      await supabase
        .from('user_roles')
        .update({ force_password_reset: false })
        .eq('user_id', (await supabase.auth.getUser()).data.user!.id)
      navigate('/dashboard')
    } catch (err: any) {
      setError(err.message || 'Failed to update password')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-background p-4">
      <Card className="w-full max-w-md">
        <CardHeader className="text-center">
          <div className="mx-auto h-12 w-12 rounded-xl bg-primary flex items-center justify-center mb-2">
            <span className="text-lg font-bold text-primary-foreground">VCD</span>
          </div>
          <CardTitle className="text-xl">Welcome, {displayName || 'User'}!</CardTitle>
          <CardDescription>Please set your password to continue</CardDescription>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="password">New Password</Label>
              <Input
                id="password"
                type="password"
                {...register('password', { validate: validatePassword })}
              />
              {errors.password && (
                <p className="text-sm text-destructive">{errors.password.message}</p>
              )}
              <ul className="text-xs text-muted-foreground space-y-0.5 mt-1">
                <li className={password.length >= 8 ? 'text-emerald-600 dark:text-emerald-400' : ''}>
                  Min 8 characters
                </li>
                <li className={/[A-Z]/.test(password) ? 'text-emerald-600 dark:text-emerald-400' : ''}>
                  1 uppercase letter
                </li>
                <li className={/[0-9]/.test(password) ? 'text-emerald-600 dark:text-emerald-400' : ''}>
                  1 number
                </li>
              </ul>
            </div>

            <div className="space-y-2">
              <Label htmlFor="confirmPassword">Confirm Password</Label>
              <Input
                id="confirmPassword"
                type="password"
                {...register('confirmPassword', {
                  validate: (value) => value === password || 'Passwords do not match',
                })}
              />
              {errors.confirmPassword && (
                <p className="text-sm text-destructive">{errors.confirmPassword.message}</p>
              )}
            </div>

            {error && (
              <p className="text-sm text-destructive text-center">{error}</p>
            )}

            <Button type="submit" className="w-full" disabled={loading}>
              {loading ? 'Setting password...' : 'Set Password & Continue'}
            </Button>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}
