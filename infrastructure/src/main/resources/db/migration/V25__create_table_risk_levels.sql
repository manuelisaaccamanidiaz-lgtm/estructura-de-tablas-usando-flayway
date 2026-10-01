-- =====================================================================
-- V25__create_table_risk_levels.sql
-- Crea la tabla risk_levels
-- =====================================================================

CREATE TABLE IF NOT EXISTS risk_levels (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code                     VARCHAR(20) NOT NULL,
    name                     VARCHAR(50) NOT NULL,
    active                   BOOLEAN NOT NULL DEFAULT TRUE,
    severity                 INTEGER NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_risk_levels_code UNIQUE (code)
);
