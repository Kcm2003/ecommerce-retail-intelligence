# NovaMart E-commerce Database
## Business Requirements Document (BRD)

**Project ID:** NOVA-DB-001  
**Version:** 1.0  
**Status:** Approved for initial database planning

### 1. Project Overview
NovaMart is an e-commerce company that sells products online. The company requires a centralized relational database to manage customers, products, orders, payments, inventory, shipments and returns.

### 2. Problem Statement
The company currently manages its business data through separate files and manual processes. This leads to duplicate records, stock inaccuracies, difficulties tracking orders, delayed payment reconciliation and slow reporting.

### 3. Project Objectives
- Centralize business data in PostgreSQL.
- Maintain accurate customer, product and order records.
- Track inventory and stock movements.
- Record payments, refunds and shipments.
- Generate reliable business analytics.
- Improve data integrity and query performance.

### 4. Functional Requirements
- FR-01: Customer management
- FR-02: Product and category management
- FR-03: Order and order-item management
- FR-04: Payment management
- FR-05: Inventory management
- FR-06: Warehouse management
- FR-07: Shipment tracking
- FR-08: Returns and refunds
- FR-09: Business reporting and analytics

### 5. Non-Functional Requirements
- NFR-01: Query performance
- NFR-02: Database security
- NFR-03: Data integrity
- NFR-04: Reliability
- NFR-05: Maintainability
- NFR-06: Scalability
- NFR-07: Backup and recovery

### 6. Business Rules
- Customer identifiers must be unique.
- Customer email addresses must be unique when provided.
- Products must have valid categories.
- Orders must belong to valid customers.
- Orders must contain at least one item before being finalized.
- Order quantities must be positive.
- Product prices must not be negative.
- Inventory cannot become negative through valid stock operations.
- Cancelled orders must not count as completed sales.
- Refunds must reference valid payments.
- Shipments must reference valid orders.

### 7. Project Scope
The project covers database design, SQL development, data generation, Python integration, analytics, testing, optimization and documentation.

### 8. Technology Stack
- PostgreSQL
- SQL
- Python
- Pandas
- Power BI
- Git
- GitHub

### 9. Deliverables
- Business requirements document
- ER diagram
- Relational database schema
- SQL scripts
- Sample dataset
- SQL analytics queries
- Python ETL scripts
- Power BI dashboard
- Test cases
- GitHub documentation

### 10. Project Status
Business requirement analysis completed. Database architecture and ER design are the next stages.