# Kuettel Labs AG (KLAB) - Dynamics 365 Finance & Operations Manufacturing Demo Setup

# Manufacturing Setup

## Step 1 - Create Site

Navigate to:

```text
Inventory management
→ Setup
→ Inventory breakdown
→ Sites
```

Create:

```text
Site ID : CH01
Name    : Musterstadt Plant
```

Optional address:

```text
Kuettel Labs AG
Musterstrasse 1
1234 Musterstadt
Switzerland
```

Save.

---

# Step 9 - Create the Main Warehouse

## Objective

Create the primary warehouse for the KLAB manufacturing site.

Current site:

```text
Site ID : CH01
Name    : Bremgarten Plant
```

---

## Navigate

```text
Inventory management
→ Setup
→ Inventory breakdown
→ Warehouses
```

---

## Create Warehouse

Click:

```text
New
```

Enter:

```text
Warehouse : MAIN
Name      : Main Warehouse
Site      : CH01
```

---

## Recommended Demo Settings

```text
Use warehouse management processes : No
Allow negative inventory           : No
```

Keep other settings at their default values.

---

## Save

Click:

```text
Save
```

---

## Expected Result

You should have:

```text
Warehouse : MAIN
Name      : Main Warehouse
Site      : CH01
```

---

## Target Inventory Structure

```text
CH01 - Bremgarten Plant
└── MAIN - Main Warehouse
```

---

## Validation

Confirm that the warehouse appears in the warehouse list:

```text
MAIN | Main Warehouse | CH01
```

---

# Step 10 - Create Item Model Group


## Objective

Create an inventory valuation model for Kuettel Labs AG manufacturing products.

Required for:
- Raw Materials
- Finished Goods
- Production Orders
- Inventory Valuation
- BOM Consumption

Current inventory structure:

```text
KLAB
└── CH01 (Bremgarten Plant)
    └── MAIN (Main Warehouse)
```

---

## Navigate

```text
Inventory management
→ Setup
→ Inventory
→ Item model groups
```

---

## Create Inventory Model Group

Click:

```text
New
```

Enter:

```text
Inventory model group : STD
Name                  : Standard Manufacturing
```

---

## Recommended Settings

Enable:

```text
Stocked product             : Yes
Physical inventory          : Yes
Financial inventory         : Yes
Post physical inventory     : Yes
Post financial inventory    : Yes
```

---

## Inventory Valuation Method

Select:

```text
Inventory model : FIFO
```

### Why FIFO?

FIFO is:

- Easy to understand
- Common in manufacturing environments
- Suitable for demo scenarios
- Fully supported for production orders

---

## Save

Click:

```text
Save
```

---

## Expected Result

You should have:

```text
Inventory model group : STD
Name                  : Standard Manufacturing
Inventory model       : FIFO
```

---

## Validation

Verify the new inventory model group appears in the list:

```text
STD | Standard Manufacturing | FIFO
```

---

## Purpose

This inventory model group will later be assigned to:

```text
Raw Materials
Finished Goods
Semi-Finished Goods
```

and used by:

```text
Purchase Orders
Inventory Transactions
Production Orders
BOM Consumption
Inventory Closing
```

---

## Inventory Flow

```text
Purchase Order
       ↓
Raw Material Inventory
       ↓
Production Order
       ↓
BOM Consumption
       ↓
Finished Goods Inventory
       ↓
Sales Order
```

---

# Step 11 - Assign Storage Dimension Group

## Objective

Use a standard Microsoft Storage Dimension Group for Kuettel Labs AG manufacturing products.

Current manufacturing structure:

```text
KLAB
└── CH01 (Bremgarten Plant)
    └── MAIN (Main Warehouse)
```

Existing storage dimension groups available include:

```text
Site
SiteWH
SiteWHLoc
Ware
STD
```

---

## Navigate

```text
Product information management
→ Setup
→ Dimension and variant gropus
→ Storage dimension groups
```

---

## Recommended Configuration

Instead of creating a custom storage dimension group, use the standard Microsoft group:

```text
SiteWH
```

Description:

```text
Site, Warehouse
```

This group already supports:

```text
✔ Site
✔ Warehouse
```

and does not require:

```text
✘ Location
✘ License Plate
✘ Inventory Status
✘ Pallet ID
```

for our manufacturing demo. 【1-caa314】

---

## Storage Hierarchy

```text
Site      = CH01
Warehouse = MAIN
```

Result:

```text
CH01 (Bremgarten Plant)
└── MAIN (Main Warehouse)
```

---

## Validation

Verify that the following group exists:

```text
SiteWH
```

Description:

```text
Site, Warehouse
```

【1-caa314】

---

## Why Use SiteWH?

Advantages:

```text
✓ Standard Microsoft Configuration
✓ No Additional Setup Required
✓ Supports Manufacturing
✓ Supports Inventory Management
✓ Supports Purchase Orders
✓ Supports Sales Orders
✓ Supports Production Orders
✓ Easier Upgrades and Maintenance
```

---

## Product Dimension Framework

```text
Item Model Group (STD)
           ↓
Storage Dimension Group (SiteWH)
           ↓
Tracking Dimension Group
           ↓
Released Product
```

---

## Current Project Status

```text
✅ KLAB Legal Entity
✅ Fiscal Calendar
✅ Ledger (CHF)
✅ Manufacturing B/S
✅ Manufacturing P&L
✅ Financial Dimensions
✅ General Journal (GEN)
✅ Voucher Series (Gene_704)
✅ First Journal (KLAB-000001)
✅ Site (CH01)
✅ Warehouse (MAIN)
✅ Item Model Group (STD)
✅ Storage Dimension Group (SiteWH)
```

---

# Step 12 - Tracking Dimension Group

## Objective

Assign a standard Microsoft tracking dimension group for Kuettel Labs AG manufacturing products.

Tracking dimensions control:

```text
Batch Tracking
Serial Number Tracking
Product Traceability
Production Lot Control
```

For the KLAB manufacturing demo, we want:

```text
✔ Batch Tracking
✘ Serial Number Tracking
```

The standard Microsoft tracking dimension group **Batch-CP** already provides this configuration and is available in the environment. 【1-ee54b2】

---

## Navigate

```text
Product information management
→ Setup
→ Dimension and variant groups
→ Tracking dimension groups
```

---

## Recommended Tracking Dimension Group

Use the existing Microsoft tracking dimension group:

```text
Batch-CP
```

Description:

```text
Batch - Coverage plan
```

---

## Configuration

The Batch-CP group includes:

```text
✔ Batch number
✘ Serial number
```

No additional configuration is required.

---

## Why Use Batch-CP?

Advantages:

```text
✓ Standard Microsoft Configuration
✓ Manufacturing Ready
✓ Batch Traceability
✓ Lower Maintenance
✓ Supports Production Orders
✓ Supports Inventory Tracking
✓ Supports Quality Processes
```

Batch tracking allows inventory traceability from:

```text
Supplier
    ↓
Raw Material Batch
    ↓
Production Order
    ↓
Finished Goods Batch
    ↓
Customer
```

---

## Example

Raw material receipt:

```text
RAW-1001
Batch: RM2026-001
```

Production order:

```text
P000001
```

Finished good:

```text
FG-1001
Batch: FG2026-001
```
---

## Product Dimension Framework

```text
Item Model Group          : STD
Storage Dimension Group   : SiteWH
Tracking Dimension Group  : Batch-CP
```

---

## Expected Product Configuration

Future released products should use:

```text
Item Model Group        = STD
Storage Dimension Group = SiteWH
Tracking Group          = Batch-CP
```

---

## Current Project Status

```text
✅ KLAB Legal Entity
✅ Fiscal Calendar
✅ Ledger (CHF)
✅ Manufacturing B/S
✅ Manufacturing P&L
✅ Financial Dimensions
✅ Journal GEN
✅ Voucher Series (Gene_704)
✅ First Journal (KLAB-000001)
✅ Site CH01
✅ Warehouse MAIN
✅ Item Model Group STD
✅ Storage Dimension Group SiteWH
✅ Tracking Dimension Group Batch-CP
```
---
# Step 13 - Create Item Groups

## Objective

Create Item Groups for Kuettel Labs AG before creating Released Products.

Item Groups are used to classify inventory items and drive:

```text
Inventory Posting
Purchase Posting
Production Posting
Sales Posting
Cost Accounting
Financial Integration
```

Every manufacturing item should belong to an Item Group.

---

## Navigate

```text
Inventory management
→ Setup
→ Inventory
→ Item groups
```

---

## Create Raw Material Item Group

Click:

```text
New
```

Create:

```text
Item group : RM
Name       : Raw Materials
```

Purpose:

```text
Purchased components
Purchased materials
Production consumption
```

Examples:

```text
RAW-1001 Aluminum Sheet
RAW-1002 Electronic Controller
```

---

## Create Finished Goods Item Group

Click:

```text
New
```

Create:

```text
Item group : FG
Name       : Finished Goods
```

Purpose:

```text
Manufactured products
Finished inventory
Sales items
```

Examples:

```text
FG-1001 Smart Sensor
```

---

## Expected Item Groups

```text
RM  Raw Materials
FG  Finished Goods
```

---

## Inventory Classification

```text
Raw Materials
    ↓
RM
```

```text
Finished Goods
    ↓
FG
```

---

## Manufacturing Structure

```text
FG-1001 Smart Sensor
│
├── RAW-1001 Aluminum Sheet
└── RAW-1002 Electronic Controller
```

Resulting Item Group assignment:

```text
RAW-1001 → RM
RAW-1002 → RM
FG-1001  → FG
```

---

## Validation

Verify the Item Groups exist:

```text
RM | Raw Materials
FG | Finished Goods
```

---

## Why Create Item Groups First?

Released Products require several foundational configurations:

```text
Item Model Group
Storage Dimension Group
Tracking Dimension Group
Item Group
```

Creating Item Groups first ensures products can be configured consistently and prevents inventory posting issues later.

---

# Step 14 - Create Released Products

## Objective

Create the initial products for the Kuettel Labs AG manufacturing demo.

These products will be used for:

```text
Purchase Orders
Inventory Management
Bills of Materials (BOM)
Production Orders
Sales Orders
Costing
```

---

## Product Master Data Prerequisites

Verify the following setup exists before creating products:

```text
Item Model Group        : STD
Storage Dimension Group : SiteWH
Tracking Dimension Group: Batch-CP

Item Groups:
RM - Raw Materials
FG - Finished Goods
```

---

## Navigate

```text
Product information management
→ Products
→ Released products
```

---

# Create Product RAW-1001

Click:

```text
New
```

Enter:

```text
Product number : RAW-1001
Product name   : Aluminum Sheet
Product type   : Item
Product subtype: Product
```

### Product Configuration

Assign:

```text
Item Model Group         : STD
Item Group               : RM
Storage Dimension Group  : SiteWH
Tracking Dimension Group : Batch-CP
```

### Units of Measure

Recommended:

```text
Inventory unit : ea
Purchase unit  : ea
Sales unit     : ea
BOM unit       : ea
```

Save.

---

# Create Product RAW-1002

Create:

```text
Product number : RAW-1002
Product name   : Electronic Controller
Product type   : Item
Product subtype: Product
```

### Product Configuration

Assign:

```text
Item Model Group         : STD
Item Group               : RM
Storage Dimension Group  : SiteWH
Tracking Dimension Group : Batch-CP
```

### Units of Measure

```text
Inventory unit : ea
Purchase unit  : ea
Sales unit     : ea
BOM unit       : ea
```

Save.

---

# Create Product FG-1001

Create:

```text
Product number : FG-1001
Product name   : Smart Sensor
Product type   : Item
Product subtype: Product
```

### Product Configuration

Assign:

```text
Item Model Group         : STD
Item Group               : FG
Storage Dimension Group  : SiteWH
Tracking Dimension Group : Batch-CP
```

### Units of Measure

```text
Inventory unit : ea
Purchase unit  : ea
Sales unit     : ea
BOM unit       : ea
```

Save.

---

# Manufacturing Structure

```text
FG-1001 Smart Sensor
│
├── RAW-1001 Aluminum Sheet
└── RAW-1002 Electronic Controller
```

---

# Item Group Assignment

### Raw Materials

```text
RAW-1001 → RM
RAW-1002 → RM
```

### Finished Goods

```text
FG-1001 → FG
```

---

# Standard Product Configuration

All products should use:

```text
Item Model Group         = STD
Storage Dimension Group  = SiteWH
Tracking Dimension Group = Batch-CP
```

Item Group assignment:

```text
Raw Materials  = RM
Finished Goods = FG
```

---

# Validation

Verify the released products list contains:

```text
RAW-1001  Aluminum Sheet
RAW-1002  Electronic Controller
FG-1001   Smart Sensor
```

---

# Expected Inventory Hierarchy

```text
Company: KLAB
    ↓
Site: CH01
    ↓
Warehouse: MAIN
    ↓
Released Products
```

---

# Current Project Status

```text
✅ KLAB Legal Entity
✅ Fiscal Calendar
✅ Ledger (CHF)
✅ Manufacturing Account Structures
✅ Financial Dimensions
✅ General Journal (GEN)
✅ Voucher Series (Gene_704)
✅ First Journal (KLAB-000001)

✅ Site CH01
✅ Warehouse MAIN

✅ Item Model Group STD
✅ Storage Dimension Group SiteWH
✅ Tracking Dimension Group Batch-CP

✅ Item Group RM
✅ Item Group FG

✅ Released Products
```

---

# Next Step

```text
Step 15 - Create Product Categories
```

Followed by:

```text
Step 16 - Create Bills of Material (BOM)
Step 17 - Create Production Route
Step 18 - Create Production Order
```

At that point Kuettel Labs AG will be capable of executing a complete end-to-end manufacturing process.
---

## Next Step

```text
Step 14 - Create Product Number Group and Item Number Sequences
```

Then:

```text
Step 15 - Create Product Categories
Step 16 - Create BOM for FG-1001
Step 17 - Create Production Route
Step 18 - Create Production Order
```

At that point Kuettel Labs AG will be capable of executing an end-to-end manufacturing scenario.

These products will be used later for:

```text
Bills of Materials (BOM)
Production Orders
Inventory Transactions
Purchase Orders
Sales Orders
```

---

## Why Batch Tracking?

Manufacturing companies frequently need to trace:

```text
Raw Material Lots
Production Runs
Quality Issues
Supplier Deliveries
Inventory Recalls
```

Example:

```text
RAW-1001
Batch: RM2026-001

FG-1001
Batch: FG2026-001
```

This allows tracking from:

```text
Supplier
    ↓
Raw Material
    ↓
Production Order
    ↓
Finished Good
    ↓
Customer
```

---

## Product Dimension Framework

```text
Item Model Group (STD)
           ↓
Storage Dimension Group (SiteWH)
           ↓
Tracking Dimension Group (KLAB)
           ↓
Released Product
```

---

## Example Manufacturing Flow

```text
Purchase Order
       ↓
Raw Material Batch RM2026-001
       ↓
Production Order P000001
       ↓
Finished Goods Batch FG2026-001
       ↓
Sales Order
```

---

## Current Project Status

```text
✅ KLAB Legal Entity
✅ Fiscal Calendar
✅ Ledger (CHF)
✅ Manufacturing B/S
✅ Manufacturing P&L
✅ Financial Dimensions
✅ General Journal (GEN)
✅ Voucher Series (Gene_704)
✅ First Journal (KLAB-000001)
✅ Site (CH01)
✅ Warehouse (MAIN)
✅ Item Model Group (STD)
✅ Storage Dimension Group (SiteWH)
✅ Tracking Dimension Group (KLAB)
```

---

## Next Step

```text
Step 13 - Create Product Number Group
```

Used for automatic item numbering of:

```text
Raw Materials
Finished Goods
Spare Parts
Packaging Materials
```

Example numbering:

```text
RAW-1001
RAW-1002
FG-1001
FG-1002
```

---

## Why These Settings?

For the Kuettel Labs manufacturing demo we only need:

```text
Site      = CH01
Warehouse = MAIN
```

This provides a simple inventory structure without advanced warehouse management complexity.

---

## Inventory Structure

```text
CH01 (Site)
└── MAIN (Warehouse)
```

---

## Save

Click:

```text
Save
```

---

## Expected Result

```text
Storage dimension group : STD
Name                    : Standard Storage

Dimensions:
✔ Site
✔ Warehouse
✘ Location
✘ License Plate
✘ Inventory Status
✘ Pallet ID
```

---

## Validation

Verify the new storage dimension group appears in the list:

```text
STD | Standard Storage
```

---

## Purpose

This storage dimension group will later be assigned to:

```text
RAW-1001  Raw Material
RAW-1002  Raw Material
FG-1001   Finished Good
```

and used by:

```text
Inventory Transactions
Purchase Orders
Production Orders
Sales Orders
Warehouse Movements
```

---

## Product Dimension Framework

```text
Item Model Group
        ↓
Storage Dimension Group
        ↓
Tracking Dimension Group
        ↓
Released Product
```

---

## Next Step

After creating the Storage Dimension Group:

```text
Step 12 - Create Tracking Dimension Group
```

Recommended configuration:

```text
Tracking Dimension Group : STD

Batch Number : Yes
Serial Number: No
```

This allows material traceability for manufacturing while keeping the setup simple.


### Vendors

Create:

```text
SUI-001
Swiss Components AG
```

### Customers

Create:

```text
CUS-001
Demo Customer AG
```

### Released Products

Create:

```text
RAW-1001
RAW-1002
FG-1001
```

### Product Groups

Configure:

```text
Raw Materials
Finished Goods
Services
```

### Manufacturing

Create:

```text
BOM
Routes
Resource Groups
Resources
```

### Production

Create:

```text
Production Orders
BOM Consumption
Report as Finished
Inventory Transactions
```

### Swiss Localization

Configure:

```text
CHF Currency
Swiss VAT Codes
Bank Accounts
Payment Formats
```

### Go-Live Validation

Test:

```text
Purchase Order
Production Order
Sales Order
Inventory Posting
General Ledger Posting
```
