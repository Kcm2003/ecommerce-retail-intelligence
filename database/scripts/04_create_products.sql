
-- =====================================================
-- Project: NovaMart
-- >> PostgreSQL Schema Development
-- >> Products Table
-- Purpose: Store product catalogue information
-- =====================================================

CREATE TABLE IF NOT EXISTS retail.products (
    product_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_id INTEGER,
    product_name VARCHAR(150),
    sku VARCHAR(50) UNIQUE NOT NULL,
    price NUMERIC(10,2),
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Verify the table and schema name created or not 
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'retail'
    AND table_name = 'products';

-- Inspect table structure
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'retail'
    AND table_name = 'products'
ORDER BY ordinal_position;

-- Insert data into the products table
INSERT INTO retail.products
(category_id, product_name, sku, price, description)
VALUES
(1, 'Dell Inspiron Laptop', 'ELEC-LAP-001', 55000.00,
 'Dell laptop for work and study'),

(1, 'Samsung Galaxy Mobile', 'ELEC-MOB-001', 25000.00,
 'Samsung smartphone'),

(1, 'Wireless Headphones', 'ELEC-HEAD-001', 1999.00,
 'Bluetooth wireless headphones'),

(2, 'Mens Cotton T-Shirt', 'CLO-TSH-001', 599.00,
 'Cotton casual T-shirt'),

(2, 'Mens Denim Jeans', 'CLO-JEA-001', 1299.00,
 'Regular fit denim jeans'),

(3, 'Mixer Grinder', 'HOME-MIX-001', 2499.00,
 'Kitchen mixer grinder'),

(3, 'Refrigerator', 'HOME-REF-001', 28000.00,
 'Double door refrigerator'),

(4, 'SQL Programming Book', 'BOOK-SQL-001', 650.00,
 'Beginner to advanced SQL book'),

(5, 'Cricket Bat', 'SPORT-BAT-001', 1500.00,
 'Cricket bat for practice');

-- Verify the table
SELECT *
FROM retail.products
ORDER BY product_id;

-- Only for practice JOIN
SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    p.price
FROM retail.products AS p
INNER JOIN retail.product_categories AS c
ON p.category_id = c.category_id
ORDER BY p.product_id;

