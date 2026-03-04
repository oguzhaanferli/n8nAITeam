export interface Task {
  id?: string
  title: string
  description?: string
  dueDate?: Date
  priority?: 'low' | 'medium' | 'high'
  status?: 'todo' | 'in_progress' | 'done'
  categoryId?: string
  listId?: string
  assignedTo?: string
}

export interface Category {
  id?: string
  name: string
}

export interface List {
  id?: string
  name: string
  isPublic?: boolean
}

export interface User {
  id: string
  email: string
  name?: string
}
```