-- =====================================================================
-- V46__create_table_chat_conversation_ai_settings.sql
-- Crea la tabla chat_conversation_ai_settings (depende de: ai_models, chat_conversations)
-- =====================================================================

CREATE TABLE IF NOT EXISTS chat_conversation_ai_settings (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id          UUID NOT NULL,
    ai_enabled               BOOLEAN NOT NULL DEFAULT TRUE,
    default_model_id         UUID NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chat_conversation_ai_settings_conversation_id FOREIGN KEY (conversation_id) REFERENCES chat_conversations (id),
    CONSTRAINT fk_chat_conversation_ai_settings_default_model_id FOREIGN KEY (default_model_id) REFERENCES ai_models (id)
);

CREATE INDEX IF NOT EXISTS idx_chat_conversation_ai_settings_conversation_id ON chat_conversation_ai_settings (conversation_id);
CREATE INDEX IF NOT EXISTS idx_chat_conversation_ai_settings_default_model_id ON chat_conversation_ai_settings (default_model_id);
