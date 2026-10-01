-- =====================================================================
-- V27__create_table_treatment_goal_statusses.sql
-- Crea la tabla treatment_goal_statusses
-- =====================================================================

CREATE TABLE IF NOT EXISTS treatment_goal_statusses (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code                     VARCHAR(20) NOT NULL,
    name                     VARCHAR(50) NOT NULL,
    active                   BOOLEAN NOT NULL DEFAULT TRUE,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_treatment_goal_statusses_code UNIQUE (code),
    CONSTRAINT uq_treatment_goal_statusses_name UNIQUE (name)
);
