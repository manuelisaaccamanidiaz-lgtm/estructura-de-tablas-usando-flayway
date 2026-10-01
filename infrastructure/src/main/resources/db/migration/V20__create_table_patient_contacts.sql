-- =====================================================================
-- V20__create_table_patient_contacts.sql
-- Crea la tabla patient_contacts (depende de: contacts, patients, relationship_types)
-- =====================================================================

CREATE TABLE IF NOT EXISTS patient_contacts (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    contact_id               UUID NOT NULL,
    patient_id               UUID NOT NULL,
    is_primary_contact       BOOLEAN NOT NULL DEFAULT FALSE,
    is_emergency_contact     BOOLEAN NOT NULL DEFAULT FALSE,
    relationship_type_id     UUID NOT NULL,
    CONSTRAINT fk_patient_contacts_contact_id FOREIGN KEY (contact_id) REFERENCES contacts (id),
    CONSTRAINT fk_patient_contacts_patient_id FOREIGN KEY (patient_id) REFERENCES patients (id),
    CONSTRAINT fk_patient_contacts_relationship_type_id FOREIGN KEY (relationship_type_id) REFERENCES relationship_types (id)
);

CREATE INDEX IF NOT EXISTS idx_patient_contacts_contact_id ON patient_contacts (contact_id);
CREATE INDEX IF NOT EXISTS idx_patient_contacts_patient_id ON patient_contacts (patient_id);
CREATE INDEX IF NOT EXISTS idx_patient_contacts_relationship_type_id ON patient_contacts (relationship_type_id);
