-- =====================================================================
-- V15__create_table_patients.sql
-- Crea la tabla patients (depende de: city_municipalities, document_types, genders, professionals)
-- =====================================================================

CREATE TABLE IF NOT EXISTS patients (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    document_type_id         UUID NOT NULL,
    document_number          VARCHAR(30) NOT NULL,
    first_name               VARCHAR(50) NOT NULL,
    middle_name              VARCHAR(50),
    last_name                VARCHAR(50) NOT NULL,
    second_last_name         VARCHAR(50),
    birth_date               DATE NOT NULL,
    biological_sex_id        UUID NOT NULL,
    gender_identity          UUID NOT NULL,
    email                    VARCHAR(150) NOT NULL,
    phone                    VARCHAR(30),
    address                  VARCHAR(250),
    active                   BOOLEAN NOT NULL DEFAULT TRUE,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by               UUID,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by               UUID,
    city_id                  UUID NOT NULL,
    CONSTRAINT uq_patients_email UNIQUE (email),
    CONSTRAINT fk_patients_document_type_id FOREIGN KEY (document_type_id) REFERENCES document_types (id),
    CONSTRAINT fk_patients_biological_sex_id FOREIGN KEY (biological_sex_id) REFERENCES genders (id),
    CONSTRAINT fk_patients_gender_identity FOREIGN KEY (gender_identity) REFERENCES genders (id),
    CONSTRAINT fk_patients_created_by FOREIGN KEY (created_by) REFERENCES professionals (id),
    CONSTRAINT fk_patients_updated_by FOREIGN KEY (updated_by) REFERENCES professionals (id),
    CONSTRAINT fk_patients_city_id FOREIGN KEY (city_id) REFERENCES city_municipalities (id)
);

CREATE INDEX IF NOT EXISTS idx_patients_document_type_id ON patients (document_type_id);
CREATE INDEX IF NOT EXISTS idx_patients_biological_sex_id ON patients (biological_sex_id);
CREATE INDEX IF NOT EXISTS idx_patients_gender_identity ON patients (gender_identity);
CREATE INDEX IF NOT EXISTS idx_patients_created_by ON patients (created_by);
CREATE INDEX IF NOT EXISTS idx_patients_updated_by ON patients (updated_by);
CREATE INDEX IF NOT EXISTS idx_patients_city_id ON patients (city_id);
