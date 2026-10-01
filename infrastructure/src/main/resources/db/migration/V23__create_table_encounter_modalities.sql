-- =====================================================================
-- V23__create_table_encounter_modalities.sql
-- Crea la tabla encounter_modalities
-- =====================================================================

CREATE TABLE IF NOT EXISTS encounter_modalities (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code                     VARCHAR(20) NOT NULL,
    name                     VARCHAR(50) NOT NULL,
    active                   BOOLEAN NOT NULL DEFAULT TRUE,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_encounter_modalities_code UNIQUE (code)
);
