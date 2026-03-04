import { create } from 'zustand'
import { AuthSession } from './types'

type AuthState = AuthSession & {
  setSession: (session: AuthSession | null) => void
}

export const useAuthStore = create<AuthState>((set) => ({
  session: null,
  setSession: (session) => set({ session })
}))
```