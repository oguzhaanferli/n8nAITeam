import { supabase } from './supabaseClient'
import { Task, Profile } from './types'

export const authRepository = {
  signUp: async (email: string, password: string) => {
    const { data, error } = await supabase.auth.signUp({ email, password })
    if (error) throw error
    return data
  },
  signIn: async (email: string, password: string) => {
    const { data, error } = await supabase.auth.signInWithPassword({ email, password })
    if (error) throw error
    return data
  },
  signOut: async () => {
    const { error } = await supabase.auth.signOut()
    if (error) throw error
  }
}

export const profileRepository = {
  create: async (profile: Profile) => {
    const { data, error } = await supabase.from('todoapp_profiles').insert(profile)
    if (error) throw error
    return data
  },
  get: async (userId: string) => {
    const { data, error } = await supabase
      .from('todoapp_profiles')
      .select('*')
      .eq('user_id', userId)
      .single()
    if (error) throw error
    return data
  }
}

export const taskRepository = {
  create: async (task: Task) => {
    const { data, error } = await supabase.from('todoapp_tasks').insert(task).select()
    if (error) throw error
    return data[0]
  },
  getAll: async (userId: string) => {
    const { data, error } = await supabase
      .from('todoapp_tasks')
      .select('*')
      .eq('user_id', userId)
    if (error) throw error
    return data
  },
  getById: async (taskId: string) => {
    const { data, error } = await supabase
      .from('todoapp_tasks')
      .select('*')
      .eq('id', taskId)
      .single()
    if (error) throw error
    return data
  },
  update: async (taskId: string, task: Partial<Task>) => {
    const { data, error } = await supabase
      .from('todoapp_tasks')
      .update(task)
      .eq('id', taskId)
      .select()
    if (error) throw error
    return data[0]
  },
  delete: async (taskId: string) => {
    const { error } = await supabase.from('todoapp_tasks').delete().eq('id', taskId)
    if (error) throw error
  }
}
```