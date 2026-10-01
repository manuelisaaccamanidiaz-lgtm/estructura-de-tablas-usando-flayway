-- =====================================================================
-- V18__create_table_phone_contacts.sql
-- Crea la tabla phone_contacts (depende de: contacts)
-- =====================================================================

CREATE TABLE IF NOT EXISTS phone_contacts (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    contact_id               UUID NOT NULL,
    phone                    VARCHAR(30) NOT NULL,
    notes                    TEXT,
    CONSTRAINT fk_phone_contacts_contact_id FOREIGN KEY (contact_id) REFERENCES contacts (id)
);

CREATE INDEX IF NOT EXISTS idx_phone_contacts_contact_id ON phone_contacts (contact_id);
