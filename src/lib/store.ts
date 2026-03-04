import { create } from 'zustand'
import { Task, Category, List } from './types'

interface AppState {
  tasks: Task[]
  categories: Category[]
  lists: List[]
  addTask: (task: Task) => void
  updateTask: (task: Task) => void
  deleteTask: (id: string) => void
}

export const useAppStore = create<AppState>((set) => ({
  tasks: [],
  categories: [],
  lists: [],
  addTask: (task: Task) => set((state) => ({ tasks: [...state.tasks, task] })),
  updateTask: (updatedTask: Task) => set((state) => ({
    tasks: state.tasks.map((task) => 
      task.id === updatedTask.id ? updatedTask : task
    )
  })),
  deleteTask: (id: string) => set((state) => ({
    tasks: state.tasks.filter((task) => task.id !== id)
  }))
}))