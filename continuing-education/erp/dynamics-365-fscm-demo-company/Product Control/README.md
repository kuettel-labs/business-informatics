# Step 18 - Create Route Group

## Navigate

```text
Production control
→ Setup
→ Routes
→ Route groups
```

---

## Create Route Group

```text
Route group : STD
Name        : Standard Manufacturing Route
```

---

## Settings

### Estimation and Costing

```text
✔ Run time
✔ Quantity
✘ Setup time
```

### Automatic Route Consumption

```text
✘ Setup time
✘ Run time
✘ Quantity
```

### Feedback

```text
✘ Report operation as finished
```

---

## Validation

Verify:

```text
Route group : STD
Name        : Standard Manufacturing Route
```

---

## Purpose

The route group will be assigned to production operations for:

```text
FG-1001 Smart Sensor
```

---

# Step 19 - Create Operations

## Navigate

```text
Production control
→ Setup
→ Routes
→ Operations
```

---

## Create Operation 10

```text
Operation : 10
Name      : Material Preparation
```

Purpose:

```text
Material staging
Material preparation
Component verification
```

Save.

---

## Create Operation 20

```text
Operation : 20
Name      : Assembly
```

Purpose:

```text
Product assembly
Manufacturing activity
Component consumption
```

Save.

---

## Create Operation 30

```text
Operation : 30
Name      : Quality Inspection
```

Purpose:

```text
Final inspection
Quality verification
Production acceptance
```

Save.

---

## Validation

Verify:

```text
10 Material Preparation
20 Assembly
30 Quality Inspection
```

---

## Target Manufacturing Route

```text
FG-1001 Smart Sensor

10 Material Preparation
        ↓
20 Assembly
        ↓
30 Quality Inspection
```

---

# Step 20 - Create Route and Route Version

## Navigate

```text
Released products
→ FG-1001
→ Engineer
→ Route versions
```

---

## Create Route

Click:

```text
New
→ Route and route version
```

Enter:

```text
Description : FG-1001 Smart Sensor Route
Site        : CH01
Copy        : No
```

Click:

```text
OK
```

---

## Add Route Operations

### Operation 10

```text
Oper. No.   : 10
Operation   : 10
Name        : Material Preparation
Run time    : 5
Route group : STD
```

### Operation 20

```text
Oper. No.   : 20
Operation   : 20
Name        : Assembly
Run time    : 15
Route group : STD
```

### Operation 30

```text
Oper. No.   : 30
Operation   : 30
Name        : Quality Inspection
Run time    : 2
Route group : STD
```

Save.

---

# Manufacturing Costing Prerequisites

## Create Worker

Navigate:

```text
Human resources
→ Workers
→ Workers
```

Create:

```text
First Last
```

Associate the worker with your D365 user account.

This enables:

```text
BOM Approval
Route Approval
```

---

## Create Shared Category

Navigate:

```text
Production control
→ Setup
→ Routes
→ Shared categories
```

Create:

```text
Category ID   : LABOR
Category name : Direct Labor
```

Enable:

```text
Can be used in Production = Yes
```

Save.

---

## Create Cost Group

Navigate:

```text
Production control
→ Setup
→ Routes
→ Cost groups
```

Create:

```text
Cost group : STD
Name       : Standard Manufacturing
```

Save.

---

## Create Cost Category

Navigate:

```text
Production control
→ Setup
→ Routes
→ Cost categories
```

Create:

```text
Category ID   : LABOR
Category name : Direct Labor
Cost group    : STD
```

Save.

---

## Create Costing Version

Navigate:

```text
Cost management
→ Setup
→ Costing versions
```

Create:

```text
Costing version : STD
Name            : Standard Costing
Costing type    : Planned cost
```

Recommended:

```text
Block changes    : No
Block activation : No
```

Save.

---

## Create Cost Category Price

Navigate:

```text
Cost categories
→ LABOR
→ Category setup
```

Create:

```text
Version   : STD
Site      : CH01
Price     : 80.00
From date : Today
```

Save.

---

## Assign Costing to Products

For:

```text
RAW-1001
RAW-1002
FG-1001
```

Verify:

```text
Calculation group : STD
Cost group        : STD
```

---

## Assign Cost Categories to Route Operations

For each operation:

```text
10 Material Preparation
20 Assembly
30 Quality Inspection
```

Open:

```text
Setup tab
```

Assign:

```text
Setup category    : LABOR
Run time category : LABOR
Quantity category : LABOR
```

Save.

---

## Approve Route

Click:

```text
Route version
→ Approval
```

Verify:

```text
Approved : Yes
```

Save.

---

## Activate Route

Click:

```text
Route version
→ Activate
```

When prompted:

```text
The resource requirements cannot be met...
```

select:

```text
Yes
```

This is expected because resources have not yet been configured.

---

## Validation

Verify:

```text
Route number : KLAB-000001
Item         : FG-1001
Site         : CH01

Approved     : Yes
Active       : Yes
```

Operations:

```text
10 Material Preparation
20 Assembly
30 Quality Inspection
```

Costing:

```text
Shared Category     : LABOR
Cost Group          : STD
Cost Category       : LABOR
Costing Version     : STD
Cost Category Price : 80.00
```

---

# Step 21 - Create Production Order

## Navigate

```text
Production control
→ Production orders
→ All production orders
```

---

## Create Production Order

Click:

```text
New production order
```

Enter:

```text
Item number       : FG-1001
Quantity          : 1
Site              : CH01
Warehouse         : MAIN
Production group  : STD
```

Create the production order.

---

## Verify

Confirm:

```text
BOM   : BOM-FG1001
Route : KLAB-000001
```

were automatically assigned.

---

## Estimate Production Order

Click:

```text
Production order
→ Estimate
```

Accept defaults.

Expected:

```text
Status : Estimated
```

---

## Troubleshooting

If estimation fails after making changes to:

```text
Cost Categories
Cost Category Prices
Route Costing
Routes
Route Versions
```

create a brand-new production order and rerun:

```text
Estimate
```

Existing production orders may continue using older BOM, route, and costing snapshots.

---

## Validation

Verify:

```text
Status : Estimated
```

---

# Step 22 - Create Manufacturing Resources and Scheduling Capacity

## Create Resource Group

Navigate:

```text
Organization administration
→ Resources
→ Resource groups
```

Create:

```text
Resource group : MFG
Name           : Manufacturing Resources
Site           : CH01
```

Save.

---

## Create Resources

Navigate:

```text
Organization administration
→ Resources
→ Resources
```

Create:

```text
MFG-PREP
MFG-ASSY
MFG-QC
```

Assign:

```text
Site           : CH01
Resource group : MFG
```

Save.

---

## Assign Resource Requirements

Navigate:

```text
Released products
→ FG-1001
→ Engineer
→ Route versions
→ KLAB-000001
```

Assign:

```text
Operation 10 → MFG-PREP
Operation 20 → MFG-ASSY
Operation 30 → MFG-QC
```

using:

```text
Resource requirements
```

Save.

---

## Create Scheduling Calendar

### Create Working Time Template

Navigate:

```text
Organization administration
→ Calendars
→ Working time templates
```

Create:

```text
Template : STANDARD
Name     : Standard 8-5
```

Configure:

```text
Monday-Friday
08:00 - 17:00
```

Save.

---

### Create Working Time Calendar

Navigate:

```text
Organization administration
→ Calendars
→ Working time calendars
```

Create:

```text
Calendar : KLAB-CAL
Name     : KLAB Manufacturing Calendar
```

Save.

---

### Compose Working Times

Assign:

```text
Template : STANDARD
Period   : Today to +1 Year
```

Verify:

```text
Monday-Friday Open
08:00-17:00
```

---

### Assign Calendar to Resources

Assign:

```text
KLAB-CAL
```

to:

```text
MFG-PREP
MFG-ASSY
MFG-QC
```

---

## Validation

Verify:

```text
Operation 10 → MFG-PREP
Operation 20 → MFG-ASSY
Operation 30 → MFG-QC

Calendar : KLAB-CAL
```

---

# Step 23 - Configure Manufacturing Execution Journals

## Create Production Journal Names

Navigate:

```text
Production control
→ Setup
→ Journals
→ Production journal names
```

Create:

```text
PICK  → Picking List
ROUTE → Route Card
JOB   → Job Card
RAF   → Report as Finished
```

Assign:

```text
Voucher sequence : Prod_493
Selection by     : Entry
```

Save.

---

## Validation

Verify:

```text
PICK
ROUTE
JOB
RAF
```

exist and are active.

---

# Step 24 - Configure Production Order Defaults

## Navigate

```text
Production control
→ Setup
→ Production order defaults
```

---

## Start Tab

Assign:

```text
Route card   : ROUTE
Picking list : PICK
```

---

## Operations Tab

Assign:

```text
Route consumption journal : ROUTE
Picking list              : PICK
```

---

## Report as Finished Tab

Assign:

```text
Route card         : ROUTE
Picking list       : PICK
Report as finished : RAF
```

Save.

---

# Step 25 - Configure Production Control Parameters by Site

## Navigate

```text
Production control
→ Setup
→ Production control parameters by site
```

---

## Create CH01 Site Record

```text
Site : CH01
```

---

## Journals

Assign:

```text
Picking list       : PICK
Route card         : ROUTE
Job card           : JOB
Report as finished : RAF
```

---

## Number Sequences

Verify:

```text
Production         : Prod_491
Journal            : Prod_492
Voucher            : Prod_493
Job identification : Prod_494
Costing voucher    : Prod_495
Batch              : Prod_496
Route number       : Rout_32
```

---

# Step 26 - Schedule and Release Production Order

## Job Scheduling

```text
Production order
→ Scheduling
→ Job scheduling
```

Expected:

```text
Scheduling status : Job scheduled
```

---

## Release

```text
Production order
→ Release
```

Expected:

```text
Status : Released
```

---

# Step 27 - Resolve Production Start Journal Cache Issue

## Symptom

Production Start failed with:

```text
Journal name does not exist.
```

---

## Root Cause

Debugger analysis showed:

```text
ProdParmStartUp.BOMJournalNameId   = ""
ProdParmStartUp.RouteJournalNameId = ""
```

The values were loaded from:

```text
SysLastValue
```

through:

```text
standardParmStartUp
```

during startup parameter initialization.

---

## Resolution

Clear cached usage data:

```text
Settings
→ User Options
→ Usage Data
```

or clear relevant:

```text
SysLastValue
```

records in a development environment.

---

## Validation

Verify:

```text
BOMJournalNameId   = PICK
RouteJournalNameId = ROUTE
```

during debugging.

---

# Step 28 - Resolve Batch Controlled Material Consumption

## Symptom

Production Start failed with:

```text
Inventory dimension Batch number must be specified.
```

for:

```text
RAW-1001
RAW-1002
```

---

## Cause

Both raw materials use:

```text
Tracking dimension group : Batch-CD
```

and inventory must exist in a valid batch.

---

## Resolution

Verify on-hand inventory:

```text
RAW-1001
Batch : RM2026-001
```

```text
RAW-1002
Batch : RM2026-002
```

Ensure inventory transactions are posted with batch numbers.

---

# Step 29 - Start Production Order Successfully

## Start

```text
Production order
→ Start
```

Accept defaults.

---

## Expected Result

D365 creates and posts:

```text
Picking List Journal
```

Example:

```text
Journal : KLAB-000015
```

Result:

```text
Journal has been posted.
```

---

## Validation

Verify:

```text
Status:
Released
    ↓
Started
```

and confirm:

```text
✅ BOM Consumption Posted
✅ Picking List Journal Posted
✅ Materials Consumed
✅ Production Order Started
```

---

# Current Project Status

```text
✅ BOM Active
✅ Route Active
✅ Costing Configured
✅ Resources Configured
✅ Calendars Configured
✅ Production Journals Configured
✅ Site Parameters Configured
✅ Production Order Estimated
✅ Production Order Scheduled
✅ Production Order Released
✅ Production Order Started
✅ BOM Consumption Posted
✅ Picking List Journal Posted
```

---

# Step 30 - Report as Finished (RAF)

## Objective

Complete manufacturing of the finished product and receive it into inventory.

This process:

```text
Receives FG-1001 into inventory
Posts finished production quantity
Completes route operations
Moves production order to Reported as finished
```

---

## Prerequisites

Verify:

```text
✅ Production Order Started
✅ Picking List Journal Posted
✅ BOM Consumption Posted
✅ Route Card Journal Posted
✅ Raw Materials Consumed
```

Production status should be:

```text
Started
```

---

## Navigate

```text
Production control
→ Production orders
→ All production orders
```

Open:

```text
KLAB-000001
```

(or your current Started production order)

---

## Report as Finished

Click:

```text
Production order
→ Report as finished
```

---

## Overview Tab

Verify:

```text
Good quantity : 1.00

Site      : CH01
Warehouse : MAIN
```

---

## Assign Batch Number

If:

```text
FG-1001
```

uses:

```text
Tracking dimension group : Batch-CD
```

a batch number is required.

Click:

```text
Inventory
→ Dimensions display
```

or enter a batch number on the RAF line.

Example:

```text
FG20261103-001
```

---

## Create Finished Goods Batch

If RAF reports:

```text
Batch number FG20261103-001 is not created for item FG-1001.
```

Navigate:

```text
Released products
→ FG-1001
→ Manage inventory
→ Batches
```

Create:

```text
Batch number : FG20261103-001
```

Save.

Return to RAF and use the same batch number.

---

## General Tab

Set:

```text
End-mark route        : Yes
End-mark picking list : Yes
```

Recommended:

```text
Automatic route consumption : Never
Automatic BOM consumption   : Never
```

Leave default values unless your environment requires otherwise.

---

## Route Feedback Validation

Before RAF, verify route operations have been reported.

Navigate:

```text
Production order
→ Jobs
```

Operations should eventually contain:

```text
10 Material Preparation
20 Assembly
30 Quality Inspection
```

Expected:

```text
Job status : Finished
Good quantity : 1
```

If RAF reports:

```text
Feedback from the last operation is 0.00
```

verify Route Card reporting has been completed.

---

## Route Card Journal Validation

Navigate:

```text
Production control
→ Adjustments
→ Route card
```

Verify Route Card Journal was created and posted.

Example:

```text
Journal : KLAB-000023
```

Expected:

```text
Journal has been posted.
```

---

## Post Report as Finished

Click:

```text
OK
```

Expected processing:

```text
Posting Report as Finished Journal
```

Example:

```text
Journal : KLAB-000024
```

---

## Expected Result

Production status changes:

```text
Started
    ↓
Reported as finished
```

---

## Inventory Validation

Navigate:

```text
Inventory management
→ On-hand inventory
```

Check:

```text
FG-1001
```

Expected:

```text
Site      : CH01
Warehouse : MAIN
Quantity  : 1
Batch     : FG20261103-001
```

---

## Troubleshooting

### Batch Number Must Be Specified

Error:

```text
Inventory dimension Batch number must be specified.
```

Resolution:

```text
Create a batch for FG-1001
Assign the batch during RAF
```

---

### Batch Does Not Exist

Error:

```text
Batch number FG20261103-001 is not created for item FG-1001.
```

Resolution:

```text
Released products
→ FG-1001
→ Manage inventory
→ Batches
→ New
```

Create:

```text
FG20261103-001
```

---

### Last Operation Feedback Is 0

Error:

```text
Feedback from the last operation is 0.00.
```

Resolution:

```text
Verify Route Card Journal posted
Verify Route operations are finished
Verify Good quantity is reported
```

---

## Validation

Verify:

```text
Status : Reported as finished
```

and:

```text
✅ Finished goods received
✅ Batch assigned
✅ Route ended
✅ Picking list ended
✅ Finished inventory created
```

---

## Production Flow

```text
Created
    ↓
Estimated
    ↓
Scheduled
    ↓
Released
    ↓
Started
    ↓
Reported as finished
```

---

## Current Project Status

```text
✅ BOM Active
✅ Route Active
✅ Costing Configured
✅ Resources Configured
✅ Calendars Configured
✅ Production Journals Configured
✅ Production Order Started
✅ BOM Consumption Posted
✅ Picking List Posted
✅ Route Card Posted
✅ Finished Goods Produced
✅ Production Reported as Finished
```

---

# Step 31 - End Production Order

## Objective

Finalize manufacturing costing and close the production order.

This process:

```text
Calculates final production cost
Calculates material variances
Calculates route variances
Updates inventory value
Closes the production order
```

---

## Prerequisites

Verify:

```text
✅ Production Order Started
✅ Picking List Posted
✅ Route Card Posted
✅ Reported as Finished
✅ Finished Goods Received
```

Status should be:

```text
Reported as finished
```

---

## Navigate

```text
Production control
→ Production orders
→ All production orders
```

Open:

```text
KLAB-000001
```

---

## End Production Order

Click:

```text
Production order
→ End
```

Accept the default parameters.

Click:

```text
OK
```

---

## Expected Processing

D365 performs:

```text
Inventory settlement
Material cost calculation
Route cost calculation
Variance calculation
Production closure
```

---

## Expected Result

Status changes:

```text
Reported as finished
        ↓
Ended
```

---

## Validation

Verify:

```text
Status : Ended
```

---

## Cost Review

Navigate:

```text
Production order
→ Inquiries
→ Estimated cost
```

and:

```text
Production order
→ Inquiries
→ Actual cost
```

Review:

```text
Material cost
Labor cost
Production cost
Variance
```

---

## Inventory Validation

Navigate:

```text
Inventory management
→ On-hand inventory
```

Verify:

```text
FG-1001

Site      : CH01
Warehouse : MAIN
Quantity  : 1
```

and ensure the finished goods inventory was received correctly.

---

## Full Manufacturing Lifecycle

```text
Created
    ↓
Estimated
    ↓
Scheduled
    ↓
Released
    ↓
Started
    ↓
Reported as finished
    ↓
Ended ✅
```

---

## KLAB Manufacturing Demo Complete

```text
✅ Legal Entity Created
✅ Warehouse Created
✅ Raw Materials Created
✅ Finished Good Created
✅ BOM Created
✅ Route Created
✅ Costing Configured
✅ Resources Configured
✅ Calendars Configured
✅ Production Journals Configured
✅ Production Group Configured
✅ Production Order Executed
✅ Materials Consumed
✅ Finished Goods Produced
✅ Production Order Closed
```

---

## Next Recommended Learning Labs

```text
1. Master Planning
2. Planned Production Orders
3. Sales Orders → Production Orders
4. Purchase Orders for Raw Materials
5. Product Costing & Variance Analysis
6. Lean Manufacturing
7. Quality Orders
8. Batch & Serial Tracking
9. Warehouse Management (Advanced)
10. MRP Regeneration
```