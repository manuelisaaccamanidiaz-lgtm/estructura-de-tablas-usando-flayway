-- =====================================================================
-- V43__create_table_chat_conversations.sql
-- Crea la tabla chat_conversations (depende de: conversations_statuses, priorities)
-- =====================================================================

CREATE TABLE IF NOT EXISTS chat_conversations (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_status_id   UUID NOT NULL,
    priority_id              UUID NOT NULL,
    last_message_at          TIMESTAMP,
    closed                   BOOLEAN NOT NULL DEFAULT FALSE,
    closed_at                TIMESTAMP,
    closed_by                UUID,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chat_conversations_conversation_status_id FOREIGN KEY (conversation_status_id) REFERENCES conversations_statuses (id),
    CONSTRAINT fk_chat_conversations_priority_id FOREIGN KEY (priority_id) REFERENCES priorities (id)
);

CREATE INDEX IF NOT EXISTS idx_chat_conversations_conversation_status_id ON chat_conversations (conversation_status_id);
CREATE INDEX IF NOT EXISTS idx_chat_conversations_priority_id ON chat_conversations (priority_id);
