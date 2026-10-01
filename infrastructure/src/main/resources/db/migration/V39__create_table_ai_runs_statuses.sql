-- =====================================================================
-- V39__create_table_ai_runs_statuses.sql
-- Crea la tabla ai_runs_statuses
-- =====================================================================

CREATE TABLE IF NOT EXISTS ai_runs_statuses (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_status              VARCHAR(50) NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_ai_runs_statuses_name_status UNIQUE (name_status)
);
