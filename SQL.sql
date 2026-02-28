CREATE TYPE todoapp_user_role AS ENUM ('admin', 'team_leader', 'member');
CREATE TYPE todoapp_task_status AS ENUM ('todo', 'in_progress', 'done', 'archived');
CREATE TYPE todoapp_subscription_plan AS ENUM ('free', 'premium', 'team');

CREATE TABLE IF NOT EXISTS todoapp_users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    display_name VARCHAR(100),
    role todoapp_user_role NOT NULL DEFAULT 'member',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    last_login TIMESTAMP WITH TIME ZONE,
    subscription_plan todoapp_subscription_plan DEFAULT 'free',
    stripe_customer_id VARCHAR(255),
    CONSTRAINT fk_auth_user FOREIGN KEY (user_id) REFERENCES auth.users (id)
);

CREATE TABLE IF NOT EXISTS todoapp_teams (
    team_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    team_name VARCHAR(100) NOT NULL,
    team_leader_id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_team_leader FOREIGN KEY (team_leader_id) REFERENCES todoapp_users (user_id)
);

CREATE TABLE IF NOT EXISTS todoapp_team_members (
    team_id UUID NOT NULL,
    user_id UUID NOT NULL,
    joined_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    PRIMARY KEY (team_id, user_id),
    CONSTRAINT fk_team FOREIGN KEY (team_id) REFERENCES todoapp_teams (team_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES todoapp_users (user_id)
);

CREATE TABLE IF NOT EXISTS todoapp_lists (
    list_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    list_name VARCHAR(100) NOT NULL,
    team_id UUID,
    created_by UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_team FOREIGN KEY (team_id) REFERENCES todoapp_teams (team_id),
    CONSTRAINT fk_creator FOREIGN KEY (created_by) REFERENCES todoapp_users (user_id)
);

CREATE TABLE IF NOT EXISTS todoapp_tasks (
    task_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status todoapp_task_status DEFAULT 'todo',
    due_date TIMESTAMP WITH TIME ZONE,
    created_by UUID NOT NULL,
    assigned_to UUID,
    list_id UUID NOT NULL,
    parent_task_id UUID,
    priority INT DEFAULT 3,
    estimated_duration INTERVAL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_creator FOREIGN KEY (created_by) REFERENCES todoapp_users (user_id),
    CONSTRAINT fk_assignee FOREIGN KEY (assigned_to) REFERENCES todoapp_users (user_id),
    CONSTRAINT fk_list FOREIGN KEY (list_id) REFERENCES todoapp_lists (list_id),
    CONSTRAINT fk_parent_task FOREIGN KEY (parent_task_id) REFERENCES todoapp_tasks (task_id)
);

CREATE TABLE IF NOT EXISTS todoapp_categories (
    category_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    category_name VARCHAR(50) NOT NULL,
    team_id UUID,
    created_by UUID NOT NULL,
    color_code VARCHAR(7),
    CONSTRAINT fk_team FOREIGN KEY (team_id) REFERENCES todoapp_teams (team_id),
    CONSTRAINT fk_creator FOREIGN KEY (created_by) REFERENCES todoapp_users (user_id)
);

CREATE TABLE IF NOT EXISTS todoapp_task_categories (
    task_id UUID NOT NULL,
    category_id UUID NOT NULL,
    assigned_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    PRIMARY KEY (task_id, category_id),
    CONSTRAINT fk_task FOREIGN KEY (task_id) REFERENCES todoapp_tasks (task_id),
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES todoapp_categories (category_id)
);

CREATE TABLE IF NOT EXISTS todoapp_comments (
    comment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    task_id UUID NOT NULL,
    user_id UUID NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_task FOREIGN KEY (task_id) REFERENCES todoapp_tasks (task_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES todoapp_users (user_id)
);

CREATE TABLE IF NOT EXISTS todoapp_notifications (
    notification_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    message TEXT NOT NULL,
    related_task_id UUID,
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES todoapp_users (user_id),
    CONSTRAINT fk_task FOREIGN KEY (related_task_id) REFERENCES todoapp_tasks (task_id)
);

CREATE TABLE IF NOT EXISTS todoapp_subscription_plans (
    plan_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    plan_name todoapp_subscription_plan NOT NULL,
    price NUMERIC(6,2) NOT NULL,
    features JSONB
);

CREATE TABLE IF NOT EXISTS todoapp_user_subscriptions (
    subscription_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    plan_id UUID NOT NULL,
    start_date TIMESTAMP WITH TIME ZONE NOT NULL,
    end_date TIMESTAMP WITH TIME ZONE NOT NULL,
    is_active BOOLEAN DEFAULT true,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES todoapp_users (user_id),
    CONSTRAINT fk_plan FOREIGN KEY (plan_id) REFERENCES todoapp_subscription_plans (plan_id)
);

CREATE INDEX IF NOT EXISTS idx_tasks_list ON todoapp_tasks (list_id);
CREATE INDEX IF NOT EXISTS idx_tasks_assignee ON todoapp_tasks (assigned_to);
CREATE INDEX IF NOT EXISTS idx_comments_task ON todoapp_comments (task_id);
CREATE INDEX IF NOT EXISTS idx_notifications_user ON todoapp_notifications (user_id);