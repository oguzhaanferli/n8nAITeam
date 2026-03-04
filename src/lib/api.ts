import axios from 'axios'
import { Task, Category, List } from './types'

const API_URL = 'https://jsonplaceholder.typicode.com'

export const api = {
  tasks: {
    getAll: (): Promise<Task[]> => axios.get(`${API_URL}/todos`),
    get: (id: string): Promise<Task> => axios.get(`${API_URL}/todos/${id}`),
    create: (task: Task): Promise<Task> => axios.post(`${API_URL}/todos`, task),
    update: (task: Task): Promise<Task> => axios.put(`${API_URL}/todos/${task.id}`, task),
    delete: (id: string): Promise<void> => axios.delete(`${API_URL}/todos/${id}`)
  },
  categories: {
    getAll: (): Promise<Category[]> => axios.get(`${API_URL}/categories`),
    create: (category: Category): Promise<Category> => axios.post(`${API_URL}/categories`, category)
  },
  lists: {
    getAll: (): Promise<List[]> => axios.get(`${API_URL}/lists`),
    create: (list: List): Promise<List> => axios.post(`${API_URL}/lists`, list)
  }
}
```