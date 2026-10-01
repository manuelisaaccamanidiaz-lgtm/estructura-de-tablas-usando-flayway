-- =====================================================================
-- V13__create_table_professionals.sql
-- Crea la tabla professionals (depende de: city_municipalities, document_types, professional_types)
-- =====================================================================

CREATE TABLE IF NOT EXISTS professionals (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    document_type_id         UUID NOT NULL,
    document_number          VARCHAR(30) NOT NULL,
    first_name               VARCHAR(60) NOT NULL,
    last_name                VARCHAR(60) NOT NULL,
    professional_type        UUID NOT NULL,
    license_number           VARCHAR(100) NOT NULL,
    active                   BOOLEAN NOT NULL DEFAULT TRUE,
    city_id                  UUID NOT NULL,
    created_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_professionals_document_number UNIQUE (document_number),
    CONSTRAINT uq_professionals_license_number UNIQUE (license_number),
    CONSTRAINT fk_professionals_document_type_id FOREIGN KEY (document_type_id) REFERENCES document_types (id),
    CONSTRAINT fk_professionals_professional_type FOREIGN KEY (professional_type) REFERENCES professional_types (id),
    CONSTRAINT fk_professionals_city_id FOREIGN KEY (city_id) REFERENCES city_municipalities (id)
);

CREATE INDEX IF NOT EXISTS idx_professionals_document_type_id ON professionals (document_type_id);
CREATE INDEX IF NOT EXISTS idx_professionals_professional_type ON professionals (professional_type);
CREATE INDEX IF NOT EXISTS idx_professionals_city_id ON professionals (city_id);
