-- =====================================================================
-- V32__create_table_risk_assessments.sql
-- Crea la tabla risk_assessments (depende de: encounters, professionals, risk_levels)
-- =====================================================================

CREATE TABLE IF NOT EXISTS risk_assessments (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    encounter_id             UUID NOT NULL,
    risk_level_id            UUID NOT NULL,
    suicidal_ideation        BOOLEAN NOT NULL DEFAULT FALSE,
    suicide_plan             BOOLEAN NOT NULL DEFAULT FALSE,
    suicide_intent           BOOLEAN NOT NULL DEFAULT FALSE,
    self_harm                BOOLEAN NOT NULL DEFAULT FALSE,
    harm_to_others           BOOLEAN NOT NULL DEFAULT FALSE,
    risk_factors             TEXT,
    protective_factors       TEXT,
    clinical_actions         TEXT,
    observations             TEXT,
    assessed_at              TIMESTAMPTZ NOT NULL,
    assessed_by              UUID NOT NULL,
    CONSTRAINT fk_risk_assessments_encounter_id FOREIGN KEY (encounter_id) REFERENCES encounters (id),
    CONSTRAINT fk_risk_assessments_risk_level_id FOREIGN KEY (risk_level_id) REFERENCES risk_levels (id),
    CONSTRAINT fk_risk_assessments_assessed_by FOREIGN KEY (assessed_by) REFERENCES professionals (id)
);

CREATE INDEX IF NOT EXISTS idx_risk_assessments_encounter_id ON risk_assessments (encounter_id);
CREATE INDEX IF NOT EXISTS idx_risk_assessments_risk_level_id ON risk_assessments (risk_level_id);
CREATE INDEX IF NOT EXISTS idx_risk_assessments_assessed_by ON risk_assessments (assessed_by);
