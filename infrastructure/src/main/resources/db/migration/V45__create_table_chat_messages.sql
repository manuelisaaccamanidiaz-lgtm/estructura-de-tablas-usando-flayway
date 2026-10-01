-- =====================================================================
-- V45__create_table_chat_messages.sql
-- Crea la tabla chat_messages (depende de: chat_conversations, chat_participants, message_types)
-- =====================================================================

CREATE TABLE IF NOT EXISTS chat_messages (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id          UUID NOT NULL,
    message_type_id          UUID NOT NULL,
    participant_id           UUID NOT NULL,
    content                  JSONB NOT NULL,
    metadata                 JSONB,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chat_messages_conversation_id FOREIGN KEY (conversation_id) REFERENCES chat_conversations (id),
    CONSTRAINT fk_chat_messages_message_type_id FOREIGN KEY (message_type_id) REFERENCES message_types (id),
    CONSTRAINT fk_chat_messages_participant_id FOREIGN KEY (participant_id) REFERENCES chat_participants (id)
);

CREATE INDEX IF NOT EXISTS idx_chat_messages_conversation_id ON chat_messages (conversation_id);
CREATE INDEX IF NOT EXISTS idx_chat_messages_message_type_id ON chat_messages (message_type_id);
CREATE INDEX IF NOT EXISTS idx_chat_messages_participant_id ON chat_messages (participant_id);
