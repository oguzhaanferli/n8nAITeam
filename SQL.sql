CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TYPE todoapp_task_status AS ENUM ('TODO', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED');
CREATE TYPE todoapp_priority_level AS ENUM ('HIGH', 'MEDIUM', 'LOW');
CREATE TYPE todoapp_recurrence_pattern AS ENUM ('DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY', 'CUSTOM');

CREATE TABLE IF NOT EXISTS todoapp_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    full_name TEXT,
    avatar_url TEXT,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now(),
    CONSTRAINT unique_user UNIQUE(user_id)
);

CREATE TABLE IF NOT EXISTS todoapp_tasks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT,
    due_date TIMESTAMPTZ,
    status todoapp_task_status NOT NULL DEFAULT 'TODO',
    priority todoapp_priority_level NOT NULL DEFAULT 'MEDIUM',
    recurrence_pattern todoapp_recurrence_pattern,
    recurrence_interval INT,
    parent_task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_subtasks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    task_id UUID NOT NULL REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT,
    status todoapp_task_status NOT NULL DEFAULT 'TODO',
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_tags (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE,
    color_code TEXT,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_task_tags (
    task_id UUID NOT NULL REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    tag_id UUID NOT NULL REFERENCES todoapp_tags(id) ON DELETE CASCADE,
    PRIMARY KEY (task_id, tag_id)
);

CREATE TABLE IF NOT EXISTS todoapp_task_dependencies (
    task_id UUID NOT NULL REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    depends_on_task_id UUID NOT NULL REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    PRIMARY KEY (task_id, depends_on_task_id)
);

CREATE TABLE IF NOT EXISTS todoapp_task_attachments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    task_id UUID NOT NULL REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    file_path TEXT NOT NULL,
    uploaded_by UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_task_sharing (
    task_id UUID NOT NULL REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    shared_with_user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    permission_level TEXT NOT NULL DEFAULT 'READ',
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now(),
    PRIMARY KEY (task_id, shared_with_user_id)
);