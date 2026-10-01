-- =====================================================================
-- V11__create_table_consent_types.sql
-- Crea la tabla consent_types
-- =====================================================================

CREATE TABLE IF NOT EXISTS consent_types (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code                     VARCHAR(20) NOT NULL,
    name                     VARCHAR(50) NOT NULL,
    active                   BOOLEAN NOT NULL DEFAULT TRUE,
    description              TEXT,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_consent_types_code UNIQUE (code)
);
