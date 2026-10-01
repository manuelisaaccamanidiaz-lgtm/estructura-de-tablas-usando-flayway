-- =====================================================================
-- V47__create_table_chat_ai_runs.sql
-- Crea la tabla chat_ai_runs (depende de: ai_models, ai_runs_statuses, chat_conversations, chat_messages)
-- =====================================================================

CREATE TABLE IF NOT EXISTS chat_ai_runs (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id          UUID NOT NULL,
    message_id               UUID NOT NULL,
    model_id                 UUID NOT NULL,
    ai_run_status_id         UUID NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chat_ai_runs_conversation_id FOREIGN KEY (conversation_id) REFERENCES chat_conversations (id),
    CONSTRAINT fk_chat_ai_runs_message_id FOREIGN KEY (message_id) REFERENCES chat_messages (id),
    CONSTRAINT fk_chat_ai_runs_model_id FOREIGN KEY (model_id) REFERENCES ai_models (id),
    CONSTRAINT fk_chat_ai_runs_ai_run_status_id FOREIGN KEY (ai_run_status_id) REFERENCES ai_runs_statuses (id)
);

CREATE INDEX IF NOT EXISTS idx_chat_ai_runs_conversation_id ON chat_ai_runs (conversation_id);
CREATE INDEX IF NOT EXISTS idx_chat_ai_runs_message_id ON chat_ai_runs (message_id);
CREATE INDEX IF NOT EXISTS idx_chat_ai_runs_model_id ON chat_ai_runs (model_id);
CREATE INDEX IF NOT EXISTS idx_chat_ai_runs_ai_run_status_id ON chat_ai_runs (ai_run_status_id);
