-- =====================================================================
-- V17__create_table_contacts.sql
-- Crea la tabla contacts (depende de: city_municipalities, professionals)
-- =====================================================================

CREATE TABLE IF NOT EXISTS contacts (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    full_name                VARCHAR(200) NOT NULL,
    email                    VARCHAR(150),
    notes                    TEXT,
    city_id                  UUID NOT NULL,
    created_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by               UUID NOT NULL,
    updated_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by               UUID,
    CONSTRAINT fk_contacts_city_id FOREIGN KEY (city_id) REFERENCES city_municipalities (id),
    CONSTRAINT fk_contacts_created_by FOREIGN KEY (created_by) REFERENCES professionals (id),
    CONSTRAINT fk_contacts_updated_by FOREIGN KEY (updated_by) REFERENCES professionals (id)
);

CREATE INDEX IF NOT EXISTS idx_contacts_city_id ON contacts (city_id);
CREATE INDEX IF NOT EXISTS idx_contacts_created_by ON contacts (created_by);
CREATE INDEX IF NOT EXISTS idx_contacts_updated_by ON contacts (updated_by);
