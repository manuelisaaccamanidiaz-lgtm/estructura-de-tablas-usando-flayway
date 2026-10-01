-- =====================================================================
-- V40__create_table_escalations_statuses.sql
-- Crea la tabla escalations_statuses
-- =====================================================================

CREATE TABLE IF NOT EXISTS escalations_statuses (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_status              VARCHAR(50) NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_escalations_statuses_name_status UNIQUE (name_status)
);
