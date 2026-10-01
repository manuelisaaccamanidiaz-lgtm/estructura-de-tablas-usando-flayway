-- =====================================================================
-- V33__create_table_treatment_plans.sql
-- Crea la tabla treatment_plans (depende de: encounters, professionals, treatment_statusses)
-- =====================================================================

CREATE TABLE IF NOT EXISTS treatment_plans (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    encounter_id             UUID NOT NULL,
    professional_id          UUID NOT NULL,
    title                    VARCHAR(200) NOT NULL,
    description              TEXT,
    start_date               DATE NOT NULL,
    end_date                 DATE,
    treatment_status_id      UUID NOT NULL,
    created_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_treatment_plans_encounter_id FOREIGN KEY (encounter_id) REFERENCES encounters (id),
    CONSTRAINT fk_treatment_plans_professional_id FOREIGN KEY (professional_id) REFERENCES professionals (id),
    CONSTRAINT fk_treatment_plans_treatment_status_id FOREIGN KEY (treatment_status_id) REFERENCES treatment_statusses (id)
);

CREATE INDEX IF NOT EXISTS idx_treatment_plans_encounter_id ON treatment_plans (encounter_id);
CREATE INDEX IF NOT EXISTS idx_treatment_plans_professional_id ON treatment_plans (professional_id);
CREATE INDEX IF NOT EXISTS idx_treatment_plans_treatment_status_id ON treatment_plans (treatment_status_id);
