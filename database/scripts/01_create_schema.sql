-- =====================================================
-- Project: NovaMart E-commerce & Retail Intelligence
-- Phase: 5 - PostgreSQL Schema Development
-- Purpose: Create the initial retail schema & check it 
-- =====================================================

CREATE SCHEMA IF NOT EXISTS retail;

-- Check the schema name 
SELECT schema_name
FROM information_schema.schemata
WHERE schema_name = 'retail';