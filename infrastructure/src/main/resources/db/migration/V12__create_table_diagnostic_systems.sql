-- =====================================================================
-- V12__create_table_diagnostic_systems.sql
-- Crea la tabla diagnostic_systems
-- =====================================================================

CREATE TABLE IF NOT EXISTS diagnostic_systems (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code                     VARCHAR(20) NOT NULL,
    name                     VARCHAR(50) NOT NULL,
    active                   BOOLEAN NOT NULL DEFAULT TRUE,
    version                  VARCHAR(20),
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_diagnostic_systems_code UNIQUE (code)
);
