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
1234 Musterstadt
Switzerland
```
Save the record.

---

# Step 2 - Verify Company

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

---

## Step 6 - Configure Account Structures

The account structure defines 
- Which dimensions can be used 
- Which main accounts are valid 
- Financial posting validation 
- Journal posting behavior.  

Without at least one account structure, the ledger cannot properly validate financial entries.

For a manufacturing company, we need both:
- Balance Sheet accounts
- Profit & Loss accounts

Without a P&L account structure, you'll later run into posting issues for revenue and expense accounts. We want to fix that before creating vendors, items, production orders, and warehouses.

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

This means KLAB can support both:

- Balance Sheet postings
- Profit & Loss postings
- Manufacturing cost analysis

---

# Phase 4 - Financial Dimensions

Because the account structures use:
- BusinessUnit
- Department
- CostCenter

we need to create dimension values before posting transactions because the account structures require:
- Balance Sheet (MainAccount-BusinessUnit-Department)
- Profit & Loss (MainAccount-BusinessUnit-Department-CostCenter-ItemGroup)

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
