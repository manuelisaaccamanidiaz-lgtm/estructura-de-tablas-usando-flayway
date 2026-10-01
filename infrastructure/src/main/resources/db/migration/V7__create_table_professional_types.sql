-- =====================================================================
-- V7__create_table_professional_types.sql
-- Crea la tabla professional_types
-- =====================================================================

CREATE TABLE IF NOT EXISTS professional_types (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name                     VARCHAR(40) NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_professional_types_name UNIQUE (name)
);
