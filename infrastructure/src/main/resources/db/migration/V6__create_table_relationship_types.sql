-- =====================================================================
-- V6__create_table_relationship_types.sql
-- Crea la tabla relationship_types
-- =====================================================================

CREATE TABLE IF NOT EXISTS relationship_types (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    description              VARCHAR(50) NOT NULL,
    CONSTRAINT uq_relationship_types_description UNIQUE (description)
);
