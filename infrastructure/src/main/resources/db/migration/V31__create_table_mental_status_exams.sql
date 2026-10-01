-- =====================================================================
-- V31__create_table_mental_status_exams.sql
-- Crea la tabla mental_status_exams (depende de: encounters, professionals)
-- =====================================================================

CREATE TABLE IF NOT EXISTS mental_status_exams (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    encounter_id             UUID NOT NULL,
    appearance               TEXT,
    behavior                 TEXT,
    attitude                 TEXT,
    consciousness            TEXT,
    orientation              TEXT,
    attention                TEXT,
    memory                   TEXT,
    speech                   TEXT,
    mood                     TEXT,
    affect                   TEXT,
    thought_process          TEXT,
    thought_content          TEXT,
    perception               TEXT,
    judgment                 TEXT,
    insight                  TEXT,
    psychomotor_activity     TEXT,
    observations             TEXT,
    created_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by               UUID NOT NULL,
    CONSTRAINT fk_mental_status_exams_encounter_id FOREIGN KEY (encounter_id) REFERENCES encounters (id),
    CONSTRAINT fk_mental_status_exams_created_by FOREIGN KEY (created_by) REFERENCES professionals (id)
);

CREATE INDEX IF NOT EXISTS idx_mental_status_exams_encounter_id ON mental_status_exams (encounter_id);
CREATE INDEX IF NOT EXISTS idx_mental_status_exams_created_by ON mental_status_exams (created_by);
