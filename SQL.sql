CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TYPE todoapp_priority_level AS ENUM ('high', 'medium', 'low');
CREATE TYPE todoapp_recurrence_pattern AS ENUM ('daily', 'weekly', 'monthly');

CREATE TABLE IF NOT EXISTS todoapp_categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_tasks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT,
    due_date TIMESTAMPTZ,
    priority todoapp_priority_level,
    is_completed BOOLEAN DEFAULT false,
    is_public BOOLEAN DEFAULT false,
    parent_task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    calendar_event_id TEXT,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_subtasks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    is_completed BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_recurring_tasks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    pattern todoapp_recurrence_pattern NOT NULL,
    interval INT DEFAULT 1,
    next_due_date TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS todoapp_task_categories (
    task_id UUID REFERENCES todoapp_tasks(id) ON DELETE CASCADE,
    category_id UUID REFERENCES todoapp_categories(id) ON DELETE CASCADE,
    PRIMARY KEY (task_id, category_id)
);

CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DO $$
DECLARE
    t text;
BEGIN
    FOR t IN 
        SELECT table_name FROM information_schema.tables 
        WHERE table_name LIKE 'todoapp_%'
    LOOP
        EXECUTE format('CREATE TRIGGER update_%s_updated_at
            BEFORE UPDATE ON %I
            FOR EACH ROW EXECUTE FUNCTION update_updated_at()',
            t, t);
    END LOOP;
END;
$$ LANGUAGE plpgsql;