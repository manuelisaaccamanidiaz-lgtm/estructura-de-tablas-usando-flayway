-- =====================================================================
-- V48__create_table_chat_ai_run_metrics.sql
-- Crea la tabla chat_ai_run_metrics (depende de: chat_ai_runs)
-- =====================================================================

CREATE TABLE IF NOT EXISTS chat_ai_run_metrics (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ai_run_id                UUID NOT NULL,
    prompt_tokens            INTEGER NOT NULL,
    completion_tokens        INTEGER NOT NULL,
    total_tokens             INTEGER NOT NULL,
    cost                     DECIMAL(10,6),
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chat_ai_run_metrics_ai_run_id FOREIGN KEY (ai_run_id) REFERENCES chat_ai_runs (id)
);

CREATE INDEX IF NOT EXISTS idx_chat_ai_run_metrics_ai_run_id ON chat_ai_run_metrics (ai_run_id);
