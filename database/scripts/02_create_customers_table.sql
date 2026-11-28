-- =====================================================
-- Project: NovaMart E-commerce & Retail Intelligence
-- >> PostgreSQL Schema Development
-- >> Create Customers Table
-- Purpose: Store customer information
-- =======================================================

CREATE TABLE IF NOT EXISTS retail.customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255),
    phone VARCHAR(20),
    created_at TIMESTAMPTZ
);

-- Verify the table and schema name created or not 
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'retail'
    AND table_name = 'customers';    

-- Verify the table structure
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'retail'
    AND table_name = 'customers'
ORDER BY ordinal_position;

-- Insert the data into the customer table
INSERT INTO retail.customers
(first_name, last_name, email, phone, created_at)
VALUES
('Rahul', 'Das', 'rahul@gmail.com', '+919876543210', CURRENT_TIMESTAMP),
('Priya', 'Patra', 'priya@gmail.com', '+919876543211', CURRENT_TIMESTAMP),
('Amit', 'Sahu', 'amit@gmail.com', '+919876543212', CURRENT_TIMESTAMP),
('Sneha', 'Rout', 'sneha@gmail.com', '+919876543213', CURRENT_TIMESTAMP);

-- Chech the table
SELECT *
FROM retail.customers
ORDER BY customer_id;

