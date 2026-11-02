# 1. Migration strategy and scope

## Strategy

| Decision | Recommendation | Source |
|---|---|---|
| Tooling | DMT for extracting and mapping AX 2009 data into data entities; data management framework (DMF) for loads, templates, staging and packages; Excel workbook designer for small manual sets | [Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool); [Learn: DMF overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities-data-packages); [Solution Architect, ch. 5 'Planning for Successful Data Migration'] |
| Large volumes | Consider an ETL tool or staged loads; measure duration against the downtime window | [Implementing D365 F&O Apps, ch. 6 'Configuration and Data Management'] |
| Transactions | Migrate **open transactions plus opening balances**, leave closed history behind | [Newell, ch. 16 'Data Migration, Early and Often'] |
| Configuration | Build configuration once in a golden environment, move with data packages or copy into legal entity | [Implementing D365 F&O Apps, ch. 6]; [Learn: templates](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/configuration-data-templates) |
| Repeatability | Iterate in every environment, at least four iterations starting with Iteration 0 | [Newell, ch. 16]; [Implementing D365 F&O Apps, ch. 6] |
| History | Archive database or BYOD for reporting | [Solution Architect, ch. 5] |

## Pre-migration decisions required by DMT

Before migrating with DMT you must ([Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool)):

1. Select the legal entities to migrate (virtual companies can be viewed).
2. Choose target financial dimensions.
3. Review inventory dimensions.
4. Choose the chart of accounts per legal entity, or consolidate.
5. Complete basic ledger setup in the target.
6. Define conversions based on extended data types (EDT), for example field length changes.

## Scope rules

| In scope | Out of scope (default) |
|---|---|
| Reference data (units, terms of payment, groups) | Closed sales, purchase and production orders |
| Master data (customers, vendors, released products, BOMs, routes, resources, warehouses, locations) | Posted inventory transactions older than cutover |
| Open documents (open purchase orders, sales orders, production orders where agreed) | Old prices and trade agreements no longer valid |
| Opening balances (GL trial balance, open AR and AP items, on hand inventory with cost) | Obsolete items, blocked inactive customers and vendors (subject to cleansing rules) |
| Fixed assets with net book value | Audit and log tables |

Scope is confirmed per object in [templates/data-object-inventory.csv](templates/data-object-inventory.csv) and signed by the data owner.

## Strategy principles for the role

* Start early: data work begins before the project and continues in every iteration ([Newell, ch. 2 'What to Do Before You Begin a Project']; [Newell, ch. 16]).
* Clean in the source (AX 2009) where possible, transform in mapping only for structural changes.
* Everything repeatable: no manual one off fixes without a logged rule.
