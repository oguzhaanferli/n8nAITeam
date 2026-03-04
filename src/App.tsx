import { Routes } from 'react-router-dom'
import { AppRoutes } from './routes'
import { useEffect } from 'react'
import { supabase } from './lib/supabaseClient'
import { useAuthStore } from './lib/store'

function App() {
  const { setSession } = useAuthStore()

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session)
    })

    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (event, session) => {
        setSession(session)
      }
    )

    return () => {
      subscription.unsubscribe()
    }
  }, [setSession])

  return <Routes>{AppRoutes}</Routes>
}

export default App
```