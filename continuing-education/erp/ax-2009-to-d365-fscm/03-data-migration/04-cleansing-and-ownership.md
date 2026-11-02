# 4. Data cleansing and data ownership

Data cleanup should start before the project and run as repeated iterations ([Newell, ch. 2]; [Solution Architect, ch. 5]).

## Ownership model

| Role | Responsibility |
|---|---|
| Data owner (business, per domain) | Decides rules, approves scope, defaults and value mappings, signs off reconciliation |
| Data steward / key user | Does the cleanup in AX 2009, checks samples |
| ERP Project Specialist | Profiles data, proposes rules, maintains logs, runs extracts and loads, reports progress |
| Consultant / solution architect | Target design, entity choice, complex transformations |
| Project manager | Prioritises, escalates, approves plan changes |

Typical domains in a manufacturing company: finance, customers and sales, vendors and purchasing, products and engineering (BOM, routes), inventory and warehouse, production.

## Cleansing rules catalogue (examples)

| Domain | Rule | Fix where |
|---|---|---|
| Customers / vendors | Not used in the last N years and zero balance: do not migrate | DMT query filter |
| Customers / vendors | Duplicates (same tax ID or name and address): merge | Source |
| Addresses | Missing country, postal code format | Source |
| Products | Obsolete, no stock, no open orders: do not migrate | Query filter |
| Products | Missing unit conversions | Source or target setup |
| BOMs / routes | Only active versions, no references to blocked items | Source |
| Inventory | Negative on hand or stock on non existing locations resolved before cutover | Source |
| Finance | Unposted journals posted or deleted before cutover | Source |
| Open orders | Old open orders closed or cancelled | Source |

N and other thresholds are business decisions (**UNVERIFIED** examples).

## Process

1. Profile (counts, nulls, duplicates, orphans) per object.
2. Log findings in [templates/cleansing-issue-log.csv](templates/cleansing-issue-log.csv).
3. Data owner decides: fix in source, transform in mapping, or exclude.
4. Steward fixes; specialist re-profiles in the next iteration.
5. Trend the open issue count in the status report.
