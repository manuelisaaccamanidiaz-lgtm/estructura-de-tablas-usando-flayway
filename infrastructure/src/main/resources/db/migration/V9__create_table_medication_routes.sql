-- =====================================================================
-- V9__create_table_medication_routes.sql
-- Crea la tabla medication_routes
-- =====================================================================

CREATE TABLE IF NOT EXISTS medication_routes (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code                     VARCHAR(20) NOT NULL,
    name                     VARCHAR(50) NOT NULL,
    active                   BOOLEAN NOT NULL DEFAULT TRUE,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_medication_routes_code UNIQUE (code)
);
