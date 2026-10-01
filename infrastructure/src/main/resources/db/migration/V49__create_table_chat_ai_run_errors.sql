-- =====================================================================
-- V49__create_table_chat_ai_run_errors.sql
-- Crea la tabla chat_ai_run_errors (depende de: chat_ai_runs)
-- =====================================================================

CREATE TABLE IF NOT EXISTS chat_ai_run_errors (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ai_run_id                UUID NOT NULL,
    error_message            TEXT NOT NULL,
    error_code               VARCHAR(80),
    provider_error_id        VARCHAR(120),
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chat_ai_run_errors_ai_run_id FOREIGN KEY (ai_run_id) REFERENCES chat_ai_runs (id)
);

CREATE INDEX IF NOT EXISTS idx_chat_ai_run_errors_ai_run_id ON chat_ai_run_errors (ai_run_id);
