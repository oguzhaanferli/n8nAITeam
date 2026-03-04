export type Task = {
  id?: string
  title: string
  description?: string
  status: 'TODO' | 'IN_PROGRESS' | 'COMPLETED' | 'CANCELLED'
  priority: 'HIGH' | 'MEDIUM' | 'LOW'
  dueDate?: string
  userId: string
}

export type Profile = {
  id?: string
  userId: string
  fullName?: string
  avatarUrl?: string
}

export type AuthSession = {
  session: any | null
}
```