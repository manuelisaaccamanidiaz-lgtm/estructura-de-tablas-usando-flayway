-- =====================================================================
-- V29__create_table_encounters.sql
-- Crea la tabla encounters (depende de: clinical_records, encounter_modalities, encounter_statusses, encounter_types, professionals)
-- =====================================================================

CREATE TABLE IF NOT EXISTS encounters (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    clinical_record_id       UUID NOT NULL,
    professional_id          UUID NOT NULL,
    encounter_type_id        UUID NOT NULL,
    started_at               TIMESTAMPTZ NOT NULL,
    ended_at                 TIMESTAMPTZ,
    reason_for_visit         TEXT,
    current_condition        TEXT,
    modality_id              UUID NOT NULL,
    status_id                UUID NOT NULL,
    created_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by               UUID,
    updated_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by               UUID,
    CONSTRAINT fk_encounters_clinical_record_id FOREIGN KEY (clinical_record_id) REFERENCES clinical_records (id),
    CONSTRAINT fk_encounters_professional_id FOREIGN KEY (professional_id) REFERENCES professionals (id),
    CONSTRAINT fk_encounters_encounter_type_id FOREIGN KEY (encounter_type_id) REFERENCES encounter_types (id),
    CONSTRAINT fk_encounters_modality_id FOREIGN KEY (modality_id) REFERENCES encounter_modalities (id),
    CONSTRAINT fk_encounters_status_id FOREIGN KEY (status_id) REFERENCES encounter_statusses (id)
);

CREATE INDEX IF NOT EXISTS idx_encounters_clinical_record_id ON encounters (clinical_record_id);
CREATE INDEX IF NOT EXISTS idx_encounters_professional_id ON encounters (professional_id);
CREATE INDEX IF NOT EXISTS idx_encounters_encounter_type_id ON encounters (encounter_type_id);
CREATE INDEX IF NOT EXISTS idx_encounters_modality_id ON encounters (modality_id);
CREATE INDEX IF NOT EXISTS idx_encounters_status_id ON encounters (status_id);
