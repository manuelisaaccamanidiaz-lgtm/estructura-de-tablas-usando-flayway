-- =====================================================================
-- V19__create_table_email_contacts.sql
-- Crea la tabla email_contacts (depende de: contacts)
-- =====================================================================

CREATE TABLE IF NOT EXISTS email_contacts (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    contact_id               UUID NOT NULL,
    email                    VARCHAR(150) NOT NULL,
    notes                    TEXT,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_email_contacts_email UNIQUE (email),
    CONSTRAINT fk_email_contacts_contact_id FOREIGN KEY (contact_id) REFERENCES contacts (id)
);

CREATE INDEX IF NOT EXISTS idx_email_contacts_contact_id ON email_contacts (contact_id);
