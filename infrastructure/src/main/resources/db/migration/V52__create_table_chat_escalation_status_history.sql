-- =====================================================================
-- V52__create_table_chat_escalation_status_history.sql
-- Crea la tabla chat_escalation_status_history (depende de: chat_escalations, escalations_statuses)
-- =====================================================================

CREATE TABLE IF NOT EXISTS chat_escalation_status_history (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    escalation_id            UUID NOT NULL,
    escalation_status_id     UUID NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    changed_at               TIMESTAMP NOT NULL,
    CONSTRAINT fk_chat_escalation_status_history_escalation_id FOREIGN KEY (escalation_id) REFERENCES chat_escalations (id),
    CONSTRAINT fk_chat_escalation_status_history_escalation_status_id FOREIGN KEY (escalation_status_id) REFERENCES escalations_statuses (id)
);

CREATE INDEX IF NOT EXISTS idx_chat_escalation_status_history_escalation_id ON chat_escalation_status_history (escalation_id);
CREATE INDEX IF NOT EXISTS idx_chat_escalation_status_history_escalation_status_id ON chat_escalation_status_history (escalation_status_id);
