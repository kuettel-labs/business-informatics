# Dynamics AX 2009 to Dynamics 365 Finance and Supply Chain Management: Implementation Guide

> **Disclaimer.** This is a personal learning guide. It is **not official Microsoft guidance** and is not endorsed by Microsoft. Product behaviour changes often; always confirm against current Microsoft Learn documentation before acting. Points that could not be confirmed against a source are marked **UNVERIFIED**.

The scenario is generic: a mid-sized manufacturing company (production, purchasing, inventory and sales order processes) runs Dynamics AX 2009 and moves to Dynamics 365 Finance and Supply Chain Management (F&SCM).

## Key correction: what "upgrade" means for AX 2009

There is **no in-place technical upgrade** from AX 2009 to F&SCM. The **Data Migration Tool (DMT)** is the only supported path for AX 2009, and it migrates **data only**: it does not bring code, customisations or the full transaction history ([Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool); [Learn: AX 2009/2012 support](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/get-started/mainstream-support-ax-2009-2012)). The technical database upgrade path only starts from AX 2012 R2 or R3 on the latest cumulative update ([Learn: Upgrade from AX 2012](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/upgrade-overview-2012)).

AX 2009 SP1 mainstream support ended 9 October 2018 and extended support ended 12 April 2022 ([Learn: AX 2009/2012 support](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/get-started/mainstream-support-ax-2009-2012)).

## Recommended approach

| Option | Description | Verdict |
|---|---|---|
| A. Reimplementation with DMT and the data management framework | Redesign processes on standard F&SCM, migrate master data and open balances or open transactions with DMT and data entities, keep history in an archive or BYOD database | **Recommended** |
| B. Two-step upgrade (AX 2009 to AX 2012 R3, then database upgrade to F&SCM) | Carries more history, but doubles the project and keeps legacy design | Not recommended; the AX 2009 to AX 2012 R3 leg is **UNVERIFIED** in this guide |
| C. Pure manual reload (spreadsheets only) | No tooling | Only for very small data sets |

Sources: [Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool); [Newell, Mastering D365 Implementations, ch. 16 'Data Migration, Early and Often']; [Implementing D365 F&O Apps 2nd ed., ch. 6 'Configuration and Data Management']; [Luszczak, Using D365 F&O, ch. 1] (D365 is a new technical platform with modest functional change).

## Roadmap

| Phase | Folder | Main outcome | Indicative share of timeline |
|---|---|---|---|
| 1 | [01-assessment](01-assessment/README.md) | Inventory of AX 2009 processes, customisations, data and integrations; go or no go on approach | 10% |
| 2 | [02-solution-design](02-solution-design/README.md) | Fit/gap, solution blueprint, environment and security design | 15% |
| 3 | [03-data-migration](03-data-migration/README.md) | Repeatable, reconciled data migration (runs in parallel with phases 2 to 6) | across the project |
| 4 | [04-development-and-integration](04-development-and-integration/README.md) | Extensions and integrations rebuilt on the new platform | 25% |
| 5 | [05-testing](05-testing/README.md) | Unit, CRP, SIT, UAT, performance and mock cutover passed | 20% |
| 6 | [06-cutover-and-go-live](06-cutover-and-go-live/README.md) | Production go-live with signed off data | 5% |
| 7 | [07-hypercare](07-hypercare/README.md) | Stabilisation and handover to support | 4 to 8 weeks |

The timeline shares are planning assumptions for a mid-sized project, not sourced figures (**UNVERIFIED**).

```
Assessment -> Solution design -> Build (extensions, integrations) -> Test cycles -> Cutover -> Hypercare
                 \______________ Data migration iterations 0..n (mock cutover last) ______________/
```

## How to use this guide

* Each folder has a README with goals, activities, deliverables, checklists and sources.
* `03-data-migration` is deliberately the deepest part and is written for an **ERP Project Specialist**: the person who cleans, maps, loads, validates and documents data, supports testing and go-live preparation, keeps the backlog and supports the project manager.
* Templates are in [03-data-migration/templates](03-data-migration/templates/).

## Sources used across the guide

Books:
* Implementing Microsoft Dynamics 365 for Finance and Operations Apps, 2nd ed. (cited as "Implementing D365 F&O Apps")
* Becoming a Dynamics 365 Finance and Supply Chain Solution Architect (cited as "Solution Architect")
* Newell, Mastering Microsoft Dynamics 365 Implementations (cited as "Newell")
* Inside Microsoft Dynamics AX 2009 (cited as "Inside AX 2009")
* Luszczak, Using Microsoft Dynamics 365 for Finance and Operations (cited as "Luszczak")

Microsoft Learn:
* https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool
* https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/upgrade-overview-2012
* https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/prepare-data-upgrade
* https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-upgrade-self-service
* https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/get-started/mainstream-support-ax-2009-2012
* https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities-data-packages
* https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities
* https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-import-export-job
* https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/configuration-data-templates
* https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-management-api
* https://learn.microsoft.com/en-us/dynamics365/guidance/migrate/overview
* https://learn.microsoft.com/en-us/power-platform/admin/unified-experience/tutorial-copy-lifecycle-services-environment-unified-environment

## UNVERIFIED items (summary)

1. Whether a supported AX 2009 to AX 2012 R3 upgrade leg is still practical today (option B).
2. Whether LCS Upgrade analysis still accepts AX 2009 models today; the book describes it ([Implementing D365 F&O Apps, ch. 3 'Lifecycle Services (LCS) and Tools']) but current availability was not confirmed.
3. Phase timeline shares and hypercare duration.
4. Concrete volume thresholds, durations and tolerances in the data migration templates (examples only).

## Handlungskompetenzbereiche (Berufsprüfung Wirtschaftsinformatik)

Mapping of the phases to the official Handlungskompetenzbereiche a to e:

* a: Bei der Umsetzung der ICT Strategie mitwirken
* b: ICT Projekten leiten
* c: ICT Lösungen evaluieren und einführen
* d: Geschäftsprozesse optimieren
* e: Den Betrieb von ICT-Lösungen steuern

| Phase | Handlungskompetenzbereiche | Kompetenzen |
|---|---|---|
| 1 Assessment | a, b, c, d | a1, b5, c1, d1 |
| 2 Solution design | b, c, d, e | b1, b2, c1, d3, e3 |
| 3 Data migration | a, b, c, d, e | a4, b1, b2, b3, b4, b5, b6, c1, c2, c4, d1, e2, e3 |
| 4 Development and integration | b, c, e | b2, c1, e1 |
| 5 Testing | b, c, e | b4, c2, e2 |
| 6 Cutover and go-live | b, c | b5, c3, c4 |
| 7 Hypercare | c, e | c3, c5, e2, e4 |

Source: ICT-Berufsbildung Schweiz, Wegleitung und Qualifikationsprofil Berufsprüfung Wirtschaftsinformatiker/in, 2. Dezember 2024, https://www.ict-berufsbildung.ch/resources/20241202_WL_QP_FAWIR_de.pdf (linked from https://www.ict-berufsbildung.ch/berufspruefung-wirtschaftsinformatik-2026). Full titles per competence are in each phase README.
