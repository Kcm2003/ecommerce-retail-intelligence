# NovaMart — Initial Entity Register

## Project
E-commerce & Retail Intelligence Platform

## Purpose
Identify the initial database entities needed to support NovaMart's customer, product, order, payment, inventory, shipping and return operations.

## Customer Module
- customers
- customer_addresses
- reviews

## Product Module
- products
- categories
- suppliers

## Order Module
- orders
- order_items

## Payment Module
- payments
- refunds

## Inventory Module
- warehouses
- inventory

## Shipping Module
- shipments
- shipment_tracking_history

## Returns Module
- returns

## Initial Entity Count
15 entities.

## Important Design Decisions
- Every entity will have an identifier.
- Primary keys will uniquely identify records.
- Foreign keys will enforce relationships between entities.
- Many-to-many relationships will be resolved using junction tables.
- Relationships and constraints will be validated before schema implementation.

## Status
Initial entity identification completed. Relationships and ER diagram are under development.
