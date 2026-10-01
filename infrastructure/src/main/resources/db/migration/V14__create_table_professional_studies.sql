-- =====================================================================
-- V14__create_table_professional_studies.sql
-- Crea la tabla professional_studies (depende de: countries, professionals, studies)
-- =====================================================================

CREATE TABLE IF NOT EXISTS professional_studies (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    study_id                 UUID NOT NULL,
    professional_id          UUID NOT NULL,
    title                    VARCHAR(100) NOT NULL,
    university               VARCHAR(100) NOT NULL,
    is_valid                 BOOLEAN NOT NULL DEFAULT TRUE,
    resolution_number        VARCHAR(60),
    country_id               UUID NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_professional_studies_study_id FOREIGN KEY (study_id) REFERENCES studies (id),
    CONSTRAINT fk_professional_studies_professional_id FOREIGN KEY (professional_id) REFERENCES professionals (id),
    CONSTRAINT fk_professional_studies_country_id FOREIGN KEY (country_id) REFERENCES countries (id)
);

CREATE INDEX IF NOT EXISTS idx_professional_studies_study_id ON professional_studies (study_id);
CREATE INDEX IF NOT EXISTS idx_professional_studies_professional_id ON professional_studies (professional_id);
CREATE INDEX IF NOT EXISTS idx_professional_studies_country_id ON professional_studies (country_id);
