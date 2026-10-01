-- =====================================================================
-- V16__create_table_patient_allergies.sql
-- Crea la tabla patient_allergies (depende de: patients, professionals)
-- =====================================================================

CREATE TABLE IF NOT EXISTS patient_allergies (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    patient_id               UUID NOT NULL,
    substance                VARCHAR(200) NOT NULL,
    reaction                 TEXT,
    severity                 VARCHAR(20),
    active                   BOOLEAN NOT NULL DEFAULT TRUE,
    recorded_at              TIMESTAMPTZ,
    recorded_by              UUID NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_patient_allergies_patient_id FOREIGN KEY (patient_id) REFERENCES patients (id),
    CONSTRAINT fk_patient_allergies_recorded_by FOREIGN KEY (recorded_by) REFERENCES professionals (id)
);

CREATE INDEX IF NOT EXISTS idx_patient_allergies_patient_id ON patient_allergies (patient_id);
CREATE INDEX IF NOT EXISTS idx_patient_allergies_recorded_by ON patient_allergies (recorded_by);
