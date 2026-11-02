# Phase 3: Data migration (ERP Project Specialist workbook)

This section is written for an **ERP Project Specialist**: the hands on role that supports configuration, does data cleansing, data migration and data validation, runs and documents tests, tracks defects, keeps the project backlog and change requests current, supports go-live preparation, training and handover, does first level analysis of system, interface and performance issues, writes technical documentation for the PMO, and supports the project manager with minutes, action items and status reports.

**Remember the core fact:** for AX 2009 the Data Migration Tool (DMT) is the only supported path, and it moves **data only** ([Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool)).

## Contents

| File | Topic |
|---|---|
| [01-strategy-and-scope.md](01-strategy-and-scope.md) | Migration strategy, scope rules, what not to migrate |
| [02-data-object-inventory-and-load-sequence.md](02-data-object-inventory-and-load-sequence.md) | Data objects, entities, dependencies, load order |
| [03-dmt-mapping-and-dmf.md](03-dmt-mapping-and-dmf.md) | DMT mapping files, data management framework: entities, templates, staging, packages, jobs |
| [04-cleansing-and-ownership.md](04-cleansing-and-ownership.md) | Data cleansing rules and data ownership |
| [05-validation-and-reconciliation.md](05-validation-and-reconciliation.md) | Validation levels and reconciliation checklists |
| [06-iteration-plan.md](06-iteration-plan.md) | Iteration 0 to go-live iteration, entry and exit criteria |
| [07-cutover-runbook.md](07-cutover-runbook.md) | Step by step data cutover runbook |
| [08-history-and-archive.md](08-history-and-archive.md) | What happens to history: archive, BYOD, read only AX 2009 |
| [09-raci.md](09-raci.md) | RACI for the ERP Project Specialist role |
| [templates/](templates/) | CSV and markdown templates |

## Templates

| Template | Use |
|---|---|
| [data-object-inventory.csv](templates/data-object-inventory.csv) | Master list of objects, entities, owners, sequence |
| [field-mapping-template.csv](templates/field-mapping-template.csv) | Field level source to target mapping |
| [value-mapping-template.csv](templates/value-mapping-template.csv) | Code and value translations |
| [cleansing-issue-log.csv](templates/cleansing-issue-log.csv) | Data quality findings and fixes |
| [iteration-log.csv](templates/iteration-log.csv) | Results and timings per iteration and entity |
| [reconciliation-checklist.md](templates/reconciliation-checklist.md) | Per object reconciliation and sign off |
| [cutover-runbook.csv](templates/cutover-runbook.csv) | Timed runbook steps |
| [defect-log.csv](templates/defect-log.csv) | Defects found in migration and testing |
| [data-owner-signoff.md](templates/data-owner-signoff.md) | Formal acceptance per data object |
| [status-report.md](templates/status-report.md) | Weekly data migration status for the project manager |

## Handlungskompetenzbereiche

Relevant competences from the official qualification profile of the Berufsprüfung Wirtschaftsinformatiker/in ([Wegleitung vom 2. Dezember 2024](https://www.ict-berufsbildung.ch/resources/20241202_WL_QP_FAWIR_de.pdf)):

* **c4: Die Einführung von ICT Lösungen steuern** (Bereich c: ICT Lösungen evaluieren und einführen). Data migration is a core workstream of steering the introduction of the new ERP solution.
* **e2: Datenqualität überwachen und steuern** (Bereich e: Den Betrieb von ICT-Lösungen steuern). Cleansing, validation and reconciliation monitor and steer data quality.
* **b4: ICT Projektfortschritt steuern** (Bereich b: ICT Projekten leiten). The status report and backlog support the project manager in steering project progress.
