# Step 16 - Create Bill of Materials (BOM)

## Objective

Create the first manufacturing Bill of Materials (BOM) for the finished product:

```text
FG-1001 Smart Sensor
```

using the raw materials:

```text
RAW-1001 Aluminum Sheet
RAW-1002 Electronic Controller
```

---

## Navigate

```text
Product information management
→ Bills of materials and formulas
→ Bills of materials
```

---

## Create BOM Header

Click:

```text
New
```

Enter:

```text
BOM        : BOM-FG1001
Name       : FG-1001 Smart Sensor BOM
Site       : CH01
Item group : FG
```

Leave:

```text
Approved    : No
Approved by : Blank
```

for now.

Click:

```text
Save
```

---

## Add BOM Components

In the:

```text
Bill of materials lines
```

section, click:

```text
New
```

### Component 1

Enter:

```text
Item number : RAW-1001
Quantity    : 1
Unit        : ea
```

Save the line.

---

### Component 2

Click:

```text
New
```

Enter:

```text
Item number : RAW-1002
Quantity    : 1
Unit        : ea
```

Save the line.

---

## BOM Structure

Resulting BOM:

```text
FG-1001 Smart Sensor
│
├── RAW-1001 Aluminum Sheet
│      Quantity: 1
│
└── RAW-1002 Electronic Controller
       Quantity: 1
```

---

## Save BOM

Click:

```text
Save
```

---

## Validation

Verify the BOM contains:

```text
BOM-FG1001

Lines:
RAW-1001  Qty 1
RAW-1002  Qty 1
```

---

## Important Note

At this stage:

```text
BOM-FG1001
```

is only a component list.

The BOM is not yet linked to:

```text
FG-1001 Smart Sensor
```

That linkage will be created in the next step using a:

```text
BOM Version
```

---

## Manufacturing Flow

```text
FG-1001 Smart Sensor
│
├── RAW-1001 Aluminum Sheet
└── RAW-1002 Electronic Controller
```

Production process:

```text
Purchase Raw Materials
        ↓
Receive Inventory
        ↓
Production Order
        ↓
Consume BOM Materials
        ↓
Produce FG-1001
        ↓
Receive Finished Goods
```

---

## Current Project Status

```text
✅ KLAB Legal Entity
✅ Fiscal Calendar
✅ Ledger (CHF)
✅ Manufacturing Account Structures
✅ Financial Dimensions
✅ Journal Setup
✅ Site CH01
✅ Warehouse MAIN

✅ Item Model Group STD
✅ Storage Dimension Group SiteWH
✅ Tracking Dimension Group Batch-CP

✅ Item Groups
   ├── RM
   └── FG

✅ Released Products
   ├── RAW-1001
   ├── RAW-1002
   └── FG-1001

✅ KLAB Product Hierarchy

✅ BOM-FG1001
```

---

# Step 17 - Create BOM Version

## Objective

Create and activate a BOM Version that links:

```text
FG-1001 Smart Sensor
```

to:

```text
BOM-FG1001
```

Without a BOM Version, Production Orders cannot determine which BOM should be used.

---

## Current BOM Structure

```text
BOM-FG1001

RAW-1001 Aluminum Sheet          Qty 1
RAW-1002 Electronic Controller   Qty 1
```

---

## Navigate

Open:

```text
Product information management
→ Released products
→ Engineer
→ BOM versions
```

Select:

```text
BOM-FG1001
```

Click:

```text
BOM versions
```

---

## Create BOM Version

Click:

```text
New
```

Enter:

```text
Item number : FG-1001
Site        : CH01
BOM         : BOM-FG1001
```

---

## Effective Dates

Recommended:

```text
From date : Today
To date   : Blank
```

This makes the BOM version effective immediately.

---

## Approval

If approval is required:

Click:

```text
Approve
```

Enter:

```text
Approved by : Your user ID
```

Save.

---

## Activation

If the BOM Version contains an Active checkbox:

```text
✔ Active
```

Save.

---

## Expected Result

```text
FG-1001
   │
   ▼
BOM Version
   │
   ▼
BOM-FG1001
   │
   ├── RAW-1001 Qty 1
   └── RAW-1002 Qty 1
```

---

## Validation

Verify:

```text
Item number : FG-1001
Site        : CH01
BOM         : BOM-FG1001
Approved    : Yes
Active      : Yes
```

---

## Manufacturing Structure

```text
FG-1001 Smart Sensor
│
├── RAW-1001 Aluminum Sheet
└── RAW-1002 Electronic Controller
```

Linked through:

```text
BOM Version
```

---

## Current Project Status

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

✅ Item Groups
   ├── RM
   └── FG

✅ Released Products
   ├── RAW-1001
   ├── RAW-1002
   └── FG-1001

✅ KLAB Product Hierarchy

✅ BOM-FG1001

✅ BOM Version
   └── FG-1001 → BOM-FG1001
```

---
