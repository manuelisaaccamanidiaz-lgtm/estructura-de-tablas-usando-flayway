-- =====================================================================
-- V36__create_table_priorities.sql
-- Crea la tabla priorities
-- =====================================================================

CREATE TABLE IF NOT EXISTS priorities (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_priority            VARCHAR(50) NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_priorities_name_priority UNIQUE (name_priority)
);
