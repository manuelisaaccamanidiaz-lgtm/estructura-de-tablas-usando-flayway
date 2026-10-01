-- =====================================================================
-- V44__create_table_chat_participants.sql
-- Crea la tabla chat_participants (depende de: chat_conversations, patients, professionals, sender_types)
-- =====================================================================

CREATE TABLE IF NOT EXISTS chat_participants (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id          UUID NOT NULL,
    participant_type_id      UUID NOT NULL,
    patient_id               UUID,
    professional_id          UUID,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chat_participants_conversation_id FOREIGN KEY (conversation_id) REFERENCES chat_conversations (id),
    CONSTRAINT fk_chat_participants_participant_type_id FOREIGN KEY (participant_type_id) REFERENCES sender_types (id),
    CONSTRAINT fk_chat_participants_patient_id FOREIGN KEY (patient_id) REFERENCES patients (id),
    CONSTRAINT fk_chat_participants_professional_id FOREIGN KEY (professional_id) REFERENCES professionals (id)
);

CREATE INDEX IF NOT EXISTS idx_chat_participants_conversation_id ON chat_participants (conversation_id);
CREATE INDEX IF NOT EXISTS idx_chat_participants_participant_type_id ON chat_participants (participant_type_id);
CREATE INDEX IF NOT EXISTS idx_chat_participants_patient_id ON chat_participants (patient_id);
CREATE INDEX IF NOT EXISTS idx_chat_participants_professional_id ON chat_participants (professional_id);
