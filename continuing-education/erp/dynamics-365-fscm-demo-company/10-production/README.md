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

## Future Manufacturing Steps

### Warehousing

Create:

```text
Warehouse : MAIN
Site      : CH01
```

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
