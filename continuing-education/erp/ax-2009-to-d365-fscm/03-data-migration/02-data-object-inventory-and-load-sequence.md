# 2. Data object inventory and load sequence

The data management framework processes entities by **sequence** (unit, level, sequence) and the default templates are already sequenced so dependent data loads in the correct order ([Learn: templates](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/configuration-data-templates)). Load default and setup data first, then master data, then open transactions ([Newell, ch. 16]).

## Load waves

| Wave | Category | Typical objects (manufacturing) | Typical method |
|---|---|---|---|
| 0 | System and organisation setup | Legal entities, number sequences, parameters, calendars, currencies, exchange rates | Configuration template, golden environment |
| 1 | Finance foundation | Chart of accounts, main accounts, financial dimensions, posting profiles, tax codes, payment terms | Template plus DMT where values come from AX 2009 |
| 2 | Supply chain setup | Units and conversions, item groups, item model groups, storage and tracking dimension groups, sites, warehouses, locations | Template |
| 3 | Party master data | Customers, vendors, contacts, addresses, bank accounts | DMT and entities |
| 4 | Product master data | Products, released products, item coverage, default order settings, trade agreements (valid only) | DMT and entities |
| 5 | Engineering and production master | Resources, resource groups, operations, routes, BOMs, BOM versions, route versions | DMT and entities |
| 6 | Fixed assets | Asset groups, assets, books, acquisition values and depreciation to date | Entities |
| 7 | Opening balances | GL trial balance at cutover, open AR invoices, open AP invoices | Entities (journals) |
| 8 | Inventory on hand | Quantities per site, warehouse, location, batch or serial, with cost | Inventory journal entities |
| 9 | Open documents | Open purchase orders, open sales orders, firmed or released production orders | Entities |
| 10 | Post load setup | Re-enable number sequences, batch jobs, workflows | Manual checklist |

The exact entity names must be checked in the target version in the Data management workspace (they change between releases); this guide intentionally does not hard code entity names (**UNVERIFIED** per release).

## Dependency rules

* A record can only load when every referenced value exists (for example vendor group before vendor).
* Released products need item model group, storage and tracking dimension groups first.
* BOMs and routes need released products and resources.
* Opening balance journals need main accounts, dimensions and posting setup.
* On hand loads must match the GL inventory balance (see reconciliation).

## How to maintain the inventory

AX 2009 table names in the template are illustrative examples from general product knowledge (**UNVERIFIED**); confirm them in the AX 2009 AOT.

Use [templates/data-object-inventory.csv](templates/data-object-inventory.csv). Each row: object, source tables, target entity, wave, sequence, owner, volume, method, status. Update it after each iteration and attach it to the status report.

## Handlungskompetenzbereiche

Relevant competences from the official qualification profile of the Berufsprüfung Wirtschaftsinformatiker/in ([Wegleitung vom 2. Dezember 2024](https://www.ict-berufsbildung.ch/resources/20241202_WL_QP_FAWIR_de.pdf)):

* **c4: Die Einführung von ICT Lösungen steuern** (Bereich c: ICT Lösungen evaluieren und einführen). The load sequence and dependencies plan how the solution is introduced step by step.
* **a4: ICT-Ressourcen planen** (Bereich a: Bei der Umsetzung der ICT Strategie mitwirken). Volumes and load order feed the planning of people, environments and time.
