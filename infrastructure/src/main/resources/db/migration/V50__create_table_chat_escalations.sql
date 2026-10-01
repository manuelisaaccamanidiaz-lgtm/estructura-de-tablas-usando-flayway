-- =====================================================================
-- V50__create_table_chat_escalations.sql
-- Crea la tabla chat_escalations (depende de: chat_conversations, escalations_statuses)
-- =====================================================================

CREATE TABLE IF NOT EXISTS chat_escalations (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id          UUID NOT NULL,
    status_id                UUID NOT NULL,
    from_ai                  BOOLEAN NOT NULL DEFAULT FALSE,
    reason                   TEXT,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chat_escalations_conversation_id FOREIGN KEY (conversation_id) REFERENCES chat_conversations (id),
    CONSTRAINT fk_chat_escalations_status_id FOREIGN KEY (status_id) REFERENCES escalations_statuses (id)
);

CREATE INDEX IF NOT EXISTS idx_chat_escalations_conversation_id ON chat_escalations (conversation_id);
CREATE INDEX IF NOT EXISTS idx_chat_escalations_status_id ON chat_escalations (status_id);
