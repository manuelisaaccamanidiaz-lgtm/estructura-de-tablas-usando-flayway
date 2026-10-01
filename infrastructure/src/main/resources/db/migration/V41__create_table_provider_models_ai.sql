-- =====================================================================
-- V41__create_table_provider_models_ai.sql
-- Crea la tabla provider_models_ai
-- =====================================================================

CREATE TABLE IF NOT EXISTS provider_models_ai (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_provider_ai         VARCHAR(100) NOT NULL,
    razon_social             VARCHAR(150),
    sitio_web                TEXT,
    is_active                BOOLEAN NOT NULL DEFAULT TRUE,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_provider_models_ai_name_provider_ai UNIQUE (name_provider_ai)
);
