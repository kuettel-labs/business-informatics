# Kuettel Labs AG (KLAB) - Dynamics 365 Finance & Operations Manufacturing Demo Setup

## Objective

Create a new Swiss manufacturing legal entity:

```text
Legal Entity ID : KLAB
Name            : Kuettel Labs AG
Country         : Switzerland
Currency        : CHF
Industry        : Manufacturing
```

---

# Phase 1 - Legal Entity Setup

## Step 1 - Create Legal Entity

Navigate to:

```text
Organization administration
→ Organizations
→ Legal entities
```

Create:

```text
Legal entity ID : KLAB
Name            : Kuettel Labs AG
Country/Region  : Switzerland
Language        : en-US
```

Optional Address:

```text
Kuettel Labs AG
Musterstrasse 1
5620 Bremgarten
Switzerland
```

Save the record.

---

## Step 2 - Verify Company

Confirm:

```text
KLAB appears in the company selector.
```

Switch into:

```text
KLAB
```

---

# Phase 2 - Fiscal Calendar

## Step 3 - Create Fiscal Calendar

Navigate to:

```text
General ledger
→ Ledger setup
→ Fiscal calendars
```

Create:

```text
Fiscal calendar : KLAB
Name            : Kuettel Labs Fiscal Calendar
```

Save.

---

## Step 4 - Create Fiscal Year

Generate:

```text
Fiscal year start : 01.01.2026
Fiscal year end   : 31.12.2026
```

Result:

```text
Period 0  Opening
Period 1  January
Period 2  February
...
Period 12 December
Period 13 Closing
```

---

# Phase 3 - Ledger Setup

## Step 5 - Configure Ledger

Navigate to:

```text
General ledger
→ Ledger setup
→ Ledger
```

For company KLAB configure:

```text
Description         : Kuettel Labs AG
Chart of accounts   : Standard
Fiscal calendar     : KLAB
Accounting currency : CHF
Reporting currency  : CHF
```

Save.

---

## Step 6 - Configure Account Structures

Add:

```text
Manufacturing B/S
Manufacturing P&L
```

Result:

```text
Manufacturing Balance Sheet Structure
Manufacturing Profit & Loss Structure
```

Save.

---

# Phase 4 - Financial Dimensions

## Step 7 - Verify Financial Dimensions

Navigate to:

```text
General ledger
→ Chart of accounts
→ Dimensions
→ Financial dimensions
```

Verify existing values exist for:

```text
BusinessUnit
Department
CostCenter
```

Examples discovered:

### BusinessUnit

```text
001 Home
002 Auto
003 Management Consulting Practice
004 IT Consulting Practice
005 Electronics
```

### Department

```text
022 Sales & Marketing
023 Operations
024 Finance
025 IT Department
026 Human Resources
```

### CostCenter

```text
010 Production
011 Quality Control
012 Logistics
013 Procurement
014 Administration
```

No additional setup required.

---

# Phase 5 - Journal Setup

## Step 8 - Create Journal Name

Navigate to:

```text
General ledger
→ Journal setup
→ Journal names
```

Create:

```text
Name         : GEN
Description  : General Journal
Journal type : Daily
Account type : Ledger
```

---

## Step 9 - Assign Voucher Series

Voucher Series selected:

```text
Gene_704
```

Configure:

```text
Voucher series             : Gene_704
New voucher                : One voucher number only
Number allocation posting  : No
Posting layer              : Current
```

Save.

---

# Phase 6 - Validate Financial Setup

## Step 10 - Create First General Journal

Navigate to:

```text
General ledger
→ Journal entries
→ General journals
```

Create new:

```text
Journal name : GEN
```

Result:

```text
Journal batch number : KLAB-000001
Journal name         : GEN
```

Success criteria:

✅ Journal created  
✅ Number sequence works  
✅ Voucher sequence works  
✅ Ledger setup complete  
✅ KLAB company operational

---

# Current Project Status

Completed:

```text
✅ Legal Entity
✅ Company Creation
✅ Fiscal Calendar
✅ Fiscal Year
✅ Ledger
✅ Manufacturing Account Structures
✅ Financial Dimensions Validation
✅ Journal Name GEN
✅ Voucher Number Sequence
✅ First Journal Creation
```

---

# Next Phase - Manufacturing Setup

## Step 11 - Create Site

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
Name    : Bremgarten Plant
```

Optional address:

```text
Kuettel Labs AG
Musterstrasse 1
5620 Bremgarten
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
