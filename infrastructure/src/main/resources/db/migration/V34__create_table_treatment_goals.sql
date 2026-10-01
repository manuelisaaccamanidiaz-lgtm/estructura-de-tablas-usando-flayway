-- =====================================================================
-- V34__create_table_treatment_goals.sql
-- Crea la tabla treatment_goals (depende de: treatment_goal_statusses, treatment_plans)
-- =====================================================================

CREATE TABLE IF NOT EXISTS treatment_goals (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    treatment_plan_id        UUID NOT NULL,
    description              TEXT NOT NULL,
    target_date              DATE,
    completed_at             TIMESTAMPTZ,
    notes                    TEXT,
    treatment_goal_id        UUID NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_treatment_goals_treatment_plan_id FOREIGN KEY (treatment_plan_id) REFERENCES treatment_plans (id),
    CONSTRAINT fk_treatment_goals_treatment_goal_id FOREIGN KEY (treatment_goal_id) REFERENCES treatment_goal_statusses (id)
);

CREATE INDEX IF NOT EXISTS idx_treatment_goals_treatment_plan_id ON treatment_goals (treatment_plan_id);
CREATE INDEX IF NOT EXISTS idx_treatment_goals_treatment_goal_id ON treatment_goals (treatment_goal_id);
