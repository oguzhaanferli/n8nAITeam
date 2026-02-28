CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS todoapp_roles (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_users (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    auth_user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(100),
    role_id UUID REFERENCES todoapp_roles(id) ON DELETE SET NULL,
    subscription_status VARCHAR(20),
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_teams (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_by UUID REFERENCES todoapp_users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_team_members (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    team_id UUID REFERENCES todoapp_teams(id) ON DELETE CASCADE,
    user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE,
    role_id UUID REFERENCES todoapp_roles(id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now(),
    UNIQUE(team_id, user_id)
);

CREATE TABLE IF NOT EXISTS todoapp_categories (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE,
    team_id UUID REFERENCES todoapp_teams(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now(),
    CHECK ((user_id IS NOT NULL AND team_id IS NULL) OR (user_id IS NULL AND team_id IS NOT NULL))
);

CREATE TABLE IF NOT EXISTS todoapp_tasks (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date TIMESTAMPTZ,
    completed BOOLEAN DEFAULT false,
    user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE,
    team_id UUID REFERENCES todoapp_teams(id) ON DELETE CASCADE,
    category_id UUID REFERENCES todoapp_categories(id) ON DELETE SET NULL,
    parent_task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    assigned_to UUID REFERENCES todoapp_users(id) ON DELETE SET NULL,
    priority INT DEFAULT 0,
    recurrence_pattern VARCHAR(100),
    position FLOAT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_tags (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(7),
    user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE,
    team_id UUID REFERENCES todoapp_teams(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_task_tags (
    task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    tag_id UUID REFERENCES todoapp_tags(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT now(),
    PRIMARY KEY (task_id, tag_id)
);

CREATE TABLE IF NOT EXISTS todoapp_comments (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content TEXT NOT NULL,
    task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_notifications (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    recipient_user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE,
    task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    comment_id UUID REFERENCES todoapp_comments(id) ON DELETE CASCADE,
    read BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_subscriptions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID REFERENCES todoapp_users(id) ON DELETE CASCADE,
    team_id UUID REFERENCES todoapp_teams(id) ON DELETE CASCADE,
    plan_type VARCHAR(50) NOT NULL,
    valid_until TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now(),
    CHECK ((user_id IS NOT NULL AND team_id IS NULL) OR (user_id IS NULL AND team_id IS NOT NULL))
);

CREATE OR REPLACE FUNCTION update_modified_column() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$ language 'plpgsql';

DO $$
DECLARE
    t text;
BEGIN
    FOR t IN 
        SELECT table_name FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name LIKE 'todoapp_%'
    LOOP
        EXECUTE format('CREATE OR REPLACE TRIGGER update_%s_modtime
                        BEFORE UPDATE ON %I
                        FOR EACH ROW EXECUTE FUNCTION update_modified_column()',
                        t, t);
    END LOOP;
END;
$$ LANGUAGE plpgsql;