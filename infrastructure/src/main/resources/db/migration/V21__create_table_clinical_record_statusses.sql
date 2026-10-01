-- =====================================================================
-- V21__create_table_clinical_record_statusses.sql
-- Crea la tabla clinical_record_statusses
-- =====================================================================

CREATE TABLE IF NOT EXISTS clinical_record_statusses (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code                     VARCHAR(20) NOT NULL,
    name                     VARCHAR(50) NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_clinical_record_statusses_code UNIQUE (code),
    CONSTRAINT uq_clinical_record_statusses_name UNIQUE (name)
);
