-- =====================================================================
-- V24__create_table_encounter_statusses.sql
-- Crea la tabla encounter_statusses
-- =====================================================================

CREATE TABLE IF NOT EXISTS encounter_statusses (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code                     VARCHAR(20) NOT NULL,
    name                     VARCHAR(50) NOT NULL,
    active                   BOOLEAN NOT NULL DEFAULT TRUE,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_encounter_statusses_code UNIQUE (code),
    CONSTRAINT uq_encounter_statusses_name UNIQUE (name)
);
