-- =====================================================================
-- V30__create_table_clinical_notes.sql
-- Crea la tabla clinical_notes (depende de: encounters, professionals)
-- =====================================================================

CREATE TABLE IF NOT EXISTS clinical_notes (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    encounter_id             UUID NOT NULL,
    professional_id          UUID NOT NULL,
    subjective               TEXT,
    objective                TEXT,
    assessment               TEXT,
    plan                     TEXT,
    additional_notes         TEXT,
    signed_at                TIMESTAMPTZ,
    created_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_clinical_notes_encounter_id FOREIGN KEY (encounter_id) REFERENCES encounters (id),
    CONSTRAINT fk_clinical_notes_professional_id FOREIGN KEY (professional_id) REFERENCES professionals (id)
);

CREATE INDEX IF NOT EXISTS idx_clinical_notes_encounter_id ON clinical_notes (encounter_id);
CREATE INDEX IF NOT EXISTS idx_clinical_notes_professional_id ON clinical_notes (professional_id);
