```sql
CREATE TABLE IF NOT EXISTS todoapp_users (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    auth_user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE UNIQUE,
    full_name TEXT,
    email TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);

CREATE TABLE IF NOT EXISTS todoapp_teams (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    owner_id UUID REFERENCES todoapp_users(id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);

CREATE TABLE IF NOT EXISTS todoapp_team_members (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    team_id UUID REFERENCES todoapp_teams(id) ON DELETE CASCADE NOT NULL,
    user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE NOT NULL,
    role TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    UNIQUE (team_id, user_id)
);

CREATE TABLE IF NOT EXISTS todoapp_tasks (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    due_date TIMESTAMPTZ,
    priority INTEGER DEFAULT 0,
    status TEXT DEFAULT 'pending',
    user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE NOT NULL,
    parent_task_id UUID REFERENCES todoapp_tasks(id) ON DELETE SET NULL,
    ai_generated_category TEXT,
    ai_priority_score REAL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);

CREATE TABLE IF NOT EXISTS todoapp_task_assignments (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE NOT NULL,
    assigned_to UUID REFERENCES todoapp_users(id) ON DELETE CASCADE NOT NULL,
    assigned_by UUID REFERENCES todoapp_users(id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    UNIQUE (task_id, assigned_to)
);

CREATE TABLE IF NOT EXISTS todoapp_comments (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE NOT NULL,
    user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);

CREATE TABLE IF NOT EXISTS todoapp_notifications (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE NOT NULL,
    content TEXT NOT NULL,
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);
```