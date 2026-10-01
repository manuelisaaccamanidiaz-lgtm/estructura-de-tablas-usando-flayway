-- =====================================================================
-- V8__create_table_studies.sql
-- Crea la tabla studies
-- =====================================================================

CREATE TABLE IF NOT EXISTS studies (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name                     VARCHAR(40) NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
