import { Route, Routes } from 'react-router-dom'
import Login from '../pages/Login'
import Register from '../pages/Register'
import Dashboard from '../pages/Dashboard'
import Tasks from '../pages/Tasks'
import TaskDetail from '../pages/TaskDetail'
import TaskForm from '../pages/TaskForm'
import Settings from '../pages/Settings'

const routes = (
  <Routes>
    <Route key="login" path="/login" element={<Login />} />
    <Route key="register" path="/register" element={<Register />} />
    <Route key="dashboard" path="/" element={<Dashboard />} />
    <Route key="tasks" path="/tasks" element={<Tasks />} />
    <Route key="task-detail" path="/tasks/:id" element={<TaskDetail />} />
    <Route key="task-create" path="/tasks/create" element={<TaskForm />} />
    <Route key="task-edit" path="/tasks/:id/edit" element={<TaskForm />} />
    <Route key="settings" path="/settings" element={<Settings />} />
  </Routes>
)

export default routes
```