import * as z from 'zod'

export const loginSchema = z.object({
  email: z.string().email('Geçerli bir e-posta adresi girin'),
  password: z.string().min(6, 'Şifre en az 6 karakter olmalı')
})

export const taskSchema = z.object({
  title: z.string().min(3, 'Başlık en az 3 karakter olmalı'),
  description: z.string().optional(),
  dueDate: z.date().optional(),
  priority: z.enum(['low', 'medium', 'high']).optional(),
  status: z.enum(['todo', 'in_progress', 'done']).optional(),
  categoryId: z.string().optional(),
  listId: z.string().optional()
})
```