-- =====================================================================
-- V5__create_table_genders.sql
-- Crea la tabla genders
-- =====================================================================

CREATE TABLE IF NOT EXISTS genders (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    description              VARCHAR(50) NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_genders_description UNIQUE (description)
);
