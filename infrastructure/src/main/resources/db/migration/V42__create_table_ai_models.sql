-- =====================================================================
-- V42__create_table_ai_models.sql
-- Crea la tabla ai_models (depende de: provider_models_ai)
-- =====================================================================

CREATE TABLE IF NOT EXISTS ai_models (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    provider_model_id        UUID NOT NULL,
    name_model               VARCHAR(100) NOT NULL,
    model_key                VARCHAR(120) NOT NULL,
    input_token_price        DECIMAL(12,8),
    output_token_price       DECIMAL(12,8),
    max_tokens               INTEGER,
    context_window           INTEGER,
    is_active                BOOLEAN NOT NULL DEFAULT TRUE,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_ai_models_model_key UNIQUE (model_key),
    CONSTRAINT fk_ai_models_provider_model_id FOREIGN KEY (provider_model_id) REFERENCES provider_models_ai (id)
);

CREATE INDEX IF NOT EXISTS idx_ai_models_provider_model_id ON ai_models (provider_model_id);
