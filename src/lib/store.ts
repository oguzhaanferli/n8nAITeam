import { create } from 'zustand'
import { User, Task } from './types'

interface AppState {
  user: User | null
  tasks: Task[]
  setUser: (user: User | null) => void
  addTask: (task: Task) => void
  updateTask: (taskId: string, updatedTask: Partial<Task>) => void
  removeTask: (taskId: string) => void
}

const useAppStore = create<AppState>((set) => ({
  user: null,
  tasks: [],
  setUser: (user) => set({ user }),
  addTask: (task) => set((state) => ({ tasks: [...state.tasks, task] })),
  updateTask: (taskId, updatedTask) => set((state) => ({
    tasks: state.tasks.map((task) =>
      task.id === taskId ? { ...task, ...updatedTask } : task
    )
  })),
  removeTask: (taskId) => set((state) => ({
    tasks: state.tasks.filter((task) => task.id !== taskId)
  }))
}))

export default useAppStore
```