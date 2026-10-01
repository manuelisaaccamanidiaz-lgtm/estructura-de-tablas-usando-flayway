-- =====================================================================
-- V28__create_table_clinical_records.sql
-- Crea la tabla clinical_records (depende de: clinical_record_statusses, patients, professionals)
-- =====================================================================

CREATE TABLE IF NOT EXISTS clinical_records (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    patient_id               UUID NOT NULL,
    creation_date            TIMESTAMP NOT NULL,
    record_number            VARCHAR(50) NOT NULL,
    opened_at                TIMESTAMPTZ,
    closed_at                TIMESTAMPTZ,
    status_id                UUID NOT NULL,
    created_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by               UUID NOT NULL,
    CONSTRAINT fk_clinical_records_patient_id FOREIGN KEY (patient_id) REFERENCES patients (id),
    CONSTRAINT fk_clinical_records_status_id FOREIGN KEY (status_id) REFERENCES clinical_record_statusses (id),
    CONSTRAINT fk_clinical_records_created_by FOREIGN KEY (created_by) REFERENCES professionals (id)
);

CREATE INDEX IF NOT EXISTS idx_clinical_records_patient_id ON clinical_records (patient_id);
CREATE INDEX IF NOT EXISTS idx_clinical_records_status_id ON clinical_records (status_id);
CREATE INDEX IF NOT EXISTS idx_clinical_records_created_by ON clinical_records (created_by);
