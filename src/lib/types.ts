export type TaskStatus = 'TODO' | 'IN_PROGRESS' | 'COMPLETED' | 'CANCELLED'
export type PriorityLevel = 'HIGH' | 'MEDIUM' | 'LOW'

export interface Task {
  id?: string
  title: string
  description?: string
  status: TaskStatus
  priority: PriorityLevel
  dueDate?: Date
  createdAt?: Date
  updatedAt?: Date
}

export interface User {
  id?: string
  email: string
  name?: string
}
```