-- =====================================================================
-- V51__create_table_chat_escalation_assignments.sql
-- Crea la tabla chat_escalation_assignments (depende de: chat_escalations, professionals)
-- =====================================================================

CREATE TABLE IF NOT EXISTS chat_escalation_assignments (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    escalation_id            UUID NOT NULL,
    professional_id          UUID NOT NULL,
    assigned_at              TIMESTAMP NOT NULL,
    CONSTRAINT fk_chat_escalation_assignments_escalation_id FOREIGN KEY (escalation_id) REFERENCES chat_escalations (id),
    CONSTRAINT fk_chat_escalation_assignments_professional_id FOREIGN KEY (professional_id) REFERENCES professionals (id)
);

CREATE INDEX IF NOT EXISTS idx_chat_escalation_assignments_escalation_id ON chat_escalation_assignments (escalation_id);
CREATE INDEX IF NOT EXISTS idx_chat_escalation_assignments_professional_id ON chat_escalation_assignments (professional_id);
