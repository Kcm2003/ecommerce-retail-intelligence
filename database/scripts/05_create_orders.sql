
-- =====================================================
-- Project: NovaMart
-- >> PostgreSQL Schema Development
-- >> Orders Table
-- Purpose: Store customer order information
-- =====================================================

CREATE TABLE IF NOT EXISTS retail.orders (
    order_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INTEGER,
    order_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30),
    total_amount NUMERIC(12,2)
);

-- Verify the table and schema name created or not 
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'retail'
    AND table_name = 'orders';

-- Inspect table structure
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'retail'
    AND table_name = 'orders'
ORDER BY ordinal_position;

-- Insert data into order table
INSERT INTO retail.orders
(customer_id, order_date, status, total_amount)
VALUES
(1, CURRENT_TIMESTAMP, 'confirmed', 58998.00),
(2, CURRENT_TIMESTAMP, 'pending', 26998.00),
(3, CURRENT_TIMESTAMP, 'delivered', 2799.00);

-- Verify the table
SELECT *
FROM retail.orders
ORDER BY order_id;