-- =====================================================================
-- V1__create_table_countries.sql
-- Crea la tabla countries
-- =====================================================================

CREATE TABLE IF NOT EXISTS countries (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_country             VARCHAR(50) NOT NULL,
    code_country             VARCHAR(10) NOT NULL,
    description              VARCHAR(100),
    is_active                BOOLEAN NOT NULL DEFAULT TRUE,
    telephone_prefix         VARCHAR(5),
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
