CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TYPE todoapp_task_status AS ENUM ('not_started', 'in_progress', 'completed', 'cancelled');
CREATE TYPE todoapp_priority_level AS ENUM ('high', 'medium', 'low');

CREATE TABLE IF NOT EXISTS todoapp_categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_task_lists (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    owner_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    is_public BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_tasks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date TIMESTAMPTZ,
    priority todoapp_priority_level,
    status todoapp_task_status DEFAULT 'not_started',
    list_id UUID REFERENCES todoapp_task_lists(id) ON DELETE CASCADE,
    assigned_to UUID REFERENCES auth.users(id) ON DELETE SET NULL,
    created_by UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_task_categories (
    task_id UUID NOT NULL REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    category_id UUID NOT NULL REFERENCES todoapp_categories(id) ON DELETE CASCADE,
    PRIMARY KEY (task_id, category_id)
);

CREATE TABLE IF NOT EXISTS todoapp_task_dependencies (
    parent_task_id UUID NOT NULL REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    child_task_id UUID NOT NULL REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    PRIMARY KEY (parent_task_id, child_task_id)
);

CREATE TABLE IF NOT EXISTS todoapp_comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    content TEXT NOT NULL,
    task_id UUID NOT NULL REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_task_list_shares (
    list_id UUID NOT NULL REFERENCES todoapp_task_lists(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    permission_level VARCHAR(50) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now(),
    PRIMARY KEY (list_id, user_id)
);