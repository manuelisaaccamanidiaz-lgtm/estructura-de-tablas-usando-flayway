-- =====================================================================
-- V35__create_table_sender_types.sql
-- Crea la tabla sender_types
-- =====================================================================

CREATE TABLE IF NOT EXISTS sender_types (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_type                VARCHAR(50) NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_sender_types_name_type UNIQUE (name_type)
);
