-- =====================================================
-- Project: NovaMart
-- >> PostgreSQL Schema Development
-- >> Product Categories
-- Purpose: Store product category information
-- =====================================================

CREATE TABLE IF NOT EXISTS retail.product_categories(
    category_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR(100),
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP 
);

-- Verify the table and schema name created or not 
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'retail'
    AND table_name = 'product_categories';

-- Inspect table structure
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'retail'
    AND table_name = 'product_categories'
ORDER BY ordinal_position;

-- Insert data into product_category table
INSERT INTO retail.product_categories
(category_name, description)
VALUES
('Electronics', 'Electronic devices and accessories'),
('Clothing', 'Men and women clothing products'),
('Home Appliances', 'Appliances used in households'),
('Books', 'Educational and general reading books'),
('Sports', 'Sports equipment and accessories');


-- Verify the category table
SELECT *
FROM retail.product_categories
ORDER BY category_id;

