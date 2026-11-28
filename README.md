
# E-commerce & Retail Intelligence Platform

## Project Overview
A company-level e-commerce database and business intelligence project built using PostgreSQL and Python.

## Objectives
- Manage customers and products.
- Manage orders and payments.
- Track inventory and shipments.
- Analyze sales and business performance.
- Generate management reports.

## Technology Stack
- PostgreSQL
- SQL
- Python
- Pandas
- Power BI
- Git and GitHub

## Project Status
Currently in the planning phase.

-----------------------------------------------------
## PostgreSQL Schema Development

**Status:** Completed

### Database Configuration
- Database: `novamart`
- Schema: `retail`
- DBMS: PostgreSQL 18

### Database Structure
Implemented 16 business tables:

1. customers
2. customer_addresses
3. product_categories
4. products
5. suppliers
6. supplier_products
7. warehouses
8. inventory
9. orders
10. order_items
11. payments
12. refunds
13. shipments
14. shipment_tracking_history
15. returns
16. reviews
17. 
### Database Features
- Primary Keys and Foreign Keys
- NOT NULL constraints
- UNIQUE constraints
- CHECK constraints
- DEFAULT values
- Identity columns
- Referential integrity
- Composite primary and unique constraints

### Verification
- Verified table structures and data types.
- Verified primary and foreign key relationships.
- Inspected indexes.
- Checked order totals against order items.

### SQL Scripts
All schema development scripts are stored in `database/scripts/`.
