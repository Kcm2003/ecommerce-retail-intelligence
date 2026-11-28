-- 1. CUSTOMER ADDRESSES
CREATE TABLE retail.customer_addresses (
    address_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    address_type VARCHAR(30) NOT NULL,
    address_line TEXT NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    postal_code VARCHAR(15),
    country VARCHAR(100) DEFAULT 'India',
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_customer_addresses_customer
        FOREIGN KEY (customer_id)
        REFERENCES retail.customers(customer_id)
);


-- 2. SUPPLIERS
CREATE TABLE retail.suppliers (
    supplier_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


-- 3. SUPPLIER PRODUCTS
CREATE TABLE retail.supplier_products (
    supplier_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    supplier_price NUMERIC(10,2) NOT NULL CHECK (supplier_price >= 0),

    PRIMARY KEY (supplier_id, product_id),

    FOREIGN KEY (supplier_id)
        REFERENCES retail.suppliers(supplier_id),

    FOREIGN KEY (product_id)
        REFERENCES retail.products(product_id)
);


-- 4. WAREHOUSES
CREATE TABLE retail.warehouses (
    warehouse_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    warehouse_name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


-- 5. INVENTORY
CREATE TABLE retail.inventory (
    inventory_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id INTEGER NOT NULL,
    warehouse_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 0 CHECK (quantity >= 0),
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_inventory_product_warehouse
        UNIQUE (product_id, warehouse_id),

    FOREIGN KEY (product_id)
        REFERENCES retail.products(product_id),

    FOREIGN KEY (warehouse_id)
        REFERENCES retail.warehouses(warehouse_id)
);


-- 6. PAYMENTS
CREATE TABLE retail.payments (
    payment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INTEGER NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,
    amount NUMERIC(12,2) NOT NULL CHECK (amount >= 0),
    transaction_reference VARCHAR(150) UNIQUE,
    paid_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_id)
        REFERENCES retail.orders(order_id)
);


-- 7. REFUNDS
CREATE TABLE retail.refunds (
    refund_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    payment_id INTEGER NOT NULL,
    refund_amount NUMERIC(12,2) NOT NULL CHECK (refund_amount > 0),
    refund_reason TEXT,
    refund_status VARCHAR(30) DEFAULT 'pending',
    refunded_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (payment_id)
        REFERENCES retail.payments(payment_id)
);


-- 8. SHIPMENTS
CREATE TABLE retail.shipments (
    shipment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INTEGER NOT NULL,
    tracking_number VARCHAR(100) UNIQUE,
    courier_name VARCHAR(100),
    shipment_status VARCHAR(30) DEFAULT 'processing',
    shipped_at TIMESTAMPTZ,
    delivered_at TIMESTAMPTZ,

    FOREIGN KEY (order_id)
        REFERENCES retail.orders(order_id)
);


-- 9. SHIPMENT TRACKING HISTORY
CREATE TABLE retail.shipment_tracking_history (
    tracking_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    shipment_id INTEGER NOT NULL,
    shipment_status VARCHAR(30) NOT NULL,
    location VARCHAR(150),
    status_time TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (shipment_id)
        REFERENCES retail.shipments(shipment_id)
);


-- 10. RETURNS
CREATE TABLE retail.returns (
    return_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_item_id INTEGER NOT NULL,
    return_reason TEXT NOT NULL,
    return_status VARCHAR(30) DEFAULT 'requested',
    requested_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_item_id)
        REFERENCES retail.order_items(order_item_id)
);


-- 11. REVIEWS
CREATE TABLE retail.reviews (
    review_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    rating SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_customer_product_review
        UNIQUE (customer_id, product_id),

    FOREIGN KEY (customer_id)
        REFERENCES retail.customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES retail.products(product_id)
);

-- To verify the all tables
SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'retail'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

