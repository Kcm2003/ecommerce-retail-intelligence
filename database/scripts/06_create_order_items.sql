
-- =====================================================
-- Project: NovaMart
-- >> PostgreSQL Schema Development
-- >> Order Items Table
-- Purpose: Store individual products in each order
-- =====================================================

CREATE TABLE IF NOT EXISTS retail.order_items (
    order_item_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price NUMERIC(10,2)
);

-- Verify the table and schema name created or not 
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'retail'
    AND table_name = 'order_items';

-- Inspect table structure
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'retail'
    AND table_name = 'order_items'
ORDER BY ordinal_position;

-- Insert data into the order_items
INSERT INTO retail.order_items 
(order_id, product_id, quantity, unit_price)
VALUES
-- Order 1: Rahul
(1, 1, 1, 55000.00),
(1, 3, 2, 1999.00),

-- Order 2: Priya
(2, 2, 1, 25000.00),
(2, 3, 1, 1999.00),

-- Order 3: Amit
(3, 8, 1, 650.00),
(3, 9, 1, 1500.00),
(3, 5, 1, 649.00);

-- Verify the table
SELECT *
FROM retail.order_items
ORDER BY product_id;


-- Retrieve complete order details using JOIN
SELECT
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS item_total,
    o.status
FROM retail.orders AS o
INNER JOIN retail.customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN retail.order_items AS oi
    ON o.order_id = oi.order_id
INNER JOIN retail.products AS p
    ON oi.product_id = p.product_id
ORDER BY o.order_id, oi.order_item_id;

