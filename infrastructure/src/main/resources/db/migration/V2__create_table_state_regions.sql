-- =====================================================================
-- V2__create_table_state_regions.sql
-- Crea la tabla state_regions (depende de: countries)
-- =====================================================================

CREATE TABLE IF NOT EXISTS state_regions (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_region              VARCHAR(50) NOT NULL,
    code_region              VARCHAR(10) NOT NULL,
    description              VARCHAR(100),
    is_active                BOOLEAN NOT NULL DEFAULT TRUE,
    country_id               UUID NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_state_regions_country_id FOREIGN KEY (country_id) REFERENCES countries (id)
);

CREATE INDEX IF NOT EXISTS idx_state_regions_country_id ON state_regions (country_id);
