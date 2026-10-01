-- =====================================================================
-- V3__create_table_city_municipalities.sql
-- Crea la tabla city_municipalities (depende de: state_regions)
-- =====================================================================

CREATE TABLE IF NOT EXISTS city_municipalities (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_city                VARCHAR(50) NOT NULL,
    code_citi                VARCHAR(10) NOT NULL,
    description              VARCHAR(100),
    is_active                BOOLEAN NOT NULL DEFAULT TRUE,
    region_id                UUID NOT NULL,
    created_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_city_municipalities_region_id FOREIGN KEY (region_id) REFERENCES state_regions (id)
);

CREATE INDEX IF NOT EXISTS idx_city_municipalities_region_id ON city_municipalities (region_id);
