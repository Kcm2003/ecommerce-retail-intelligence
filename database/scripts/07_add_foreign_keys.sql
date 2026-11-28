
-- Relationship 1: Categories → Products
ALTER TABLE Retail.products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (category_id)
REFERENCES retail.product_categories(category_id);

-- Relationship 2: Customers → Orders
ALTER TABLE retail.orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES retail.customers(customer_id);

-- Relationship 3: Orders → Order Items
ALTER TABLE retail.order_items
ADD CONSTRAINT fk_order_items_orders
FOREIGN KEY (order_id)
REFERENCES retail.orders(order_id);

-- Relationship 4: Products → Order Items
ALTER TABLE retail.order_items
ADD CONSTRAINT fk_order_items_products
FOREIGN KEY (product_id)
REFERENCES retail.products(product_id);

-- Veriify the Foreign Key
SELECT
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS referenced_table,
    ccu.column_name AS referenced_column,
    tc.constraint_name
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.constraint_schema = kcu.constraint_schema
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
    AND ccu.constraint_schema = tc.constraint_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_schema = 'retail'
ORDER BY tc.table_name, tc.constraint_name;

