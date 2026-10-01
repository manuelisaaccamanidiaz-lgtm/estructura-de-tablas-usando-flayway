-- =====================================================================
-- V38__create_table_message_types.sql
-- Crea la tabla message_types
-- =====================================================================

CREATE TABLE IF NOT EXISTS message_types (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_type                VARCHAR(50) NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_message_types_name_type UNIQUE (name_type)
);
