
-- CUSTOMERS
ALTER TABLE retail.customers
ALTER COLUMN first_name SET NOT NULL;

ALTER TABLE retail.customers
ALTER COLUMN email SET NOT NULL;

ALTER TABLE retail.customers
ADD CONSTRAINT uq_customers_email UNIQUE (email);


-- PRODUCT CATEGORIES
ALTER TABLE retail.product_categories
ALTER COLUMN category_name SET NOT NULL;

ALTER TABLE retail.product_categories
ADD CONSTRAINT uq_product_categories_name UNIQUE (category_name);


-- PRODUCTS
ALTER TABLE retail.products
ALTER COLUMN product_name SET NOT NULL;

ALTER TABLE retail.products
ALTER COLUMN sku SET NOT NULL;

ALTER TABLE retail.products
ALTER COLUMN price SET NOT NULL;

ALTER TABLE retail.products
ADD CONSTRAINT uq_products_sku UNIQUE (sku);

ALTER TABLE retail.products
ADD CONSTRAINT chk_products_price CHECK (price >= 0);


-- ORDERS
ALTER TABLE retail.orders
ALTER COLUMN customer_id SET NOT NULL;

ALTER TABLE retail.orders
ALTER COLUMN status SET NOT NULL;

ALTER TABLE retail.orders
ALTER COLUMN total_amount SET NOT NULL;

ALTER TABLE retail.orders
ADD CONSTRAINT chk_orders_total_amount
CHECK (total_amount >= 0);


-- ORDER ITEMS
ALTER TABLE retail.order_items
ALTER COLUMN order_id SET NOT NULL;

ALTER TABLE retail.order_items
ALTER COLUMN product_id SET NOT NULL;

ALTER TABLE retail.order_items
ALTER COLUMN quantity SET NOT NULL;

ALTER TABLE retail.order_items
ALTER COLUMN unit_price SET NOT NULL;

ALTER TABLE retail.order_items
ADD CONSTRAINT chk_order_items_quantity
CHECK (quantity > 0);

ALTER TABLE retail.order_items
ADD CONSTRAINT chk_order_items_unit_price
CHECK (unit_price >= 0);

