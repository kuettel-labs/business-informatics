# Phase 1: Assessment

Goal: understand what exists in AX 2009 and decide the approach (see the root README: option A recommended).

## Activities

| # | Activity | Output | Source |
|---|---|---|---|
| 1 | Confirm version and support status of AX 2009 | Support statement | [Learn](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/get-started/mainstream-support-ax-2009-2012) |
| 2 | Inventory business processes (procure to pay, plan to produce, order to cash, record to report, inventory) | Process list | [Implementing D365 F&O Apps, ch. 5 'Requirements and Process Analysis'] |
| 3 | Inventory customisations (layers, AOT objects, modified standard objects) | Customisation register | [Inside AX 2009, ch. 18 'Code Upgrade'] |
| 4 | Optional code analysis with LCS Upgrade analysis | Analysis report (**UNVERIFIED** for AX 2009 today) | [Implementing D365 F&O Apps, ch. 3 'Lifecycle Services (LCS) and Tools'] |
| 5 | Inventory integrations (AIF services, .NET Business Connector, file interfaces) | Integration register | [Inside AX 2009, ch. 17 AIF]; [Inside AX 2009, ch. 10 .NET Business Connector] |
| 6 | Data profiling: legal entities, virtual companies, volumes, data quality | Data profile | [Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool) |
| 7 | Start data cleanup early, before the project | Cleanup backlog | [Newell, ch. 2 'What to Do Before You Begin a Project'] |
| 8 | Licensing and FastTrack eligibility | Licence estimate | [Solution Architect, ch. 6]; [Solution Architect, ch. 2] |

## Decision checklist

- [ ] Approach chosen and documented (A, B or C)
- [ ] Legal entities in scope, and virtual company usage known (DMT lets you view virtual companies) ([Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool))
- [ ] History requirement agreed (what stays in archive) ([Newell, ch. 16])
- [ ] Customisations classified: drop, replace with standard, rebuild as extension
- [ ] ISV solutions identified ([Newell, ch. 9])

## Deliverables

Assessment report, process list, customisation register, integration register, data profile, high level plan.

## Handlungskompetenzbereiche

Relevant competences from the official qualification profile of the Berufsprüfung Wirtschaftsinformatiker/in ([Wegleitung vom 2. Dezember 2024](https://www.ict-berufsbildung.ch/resources/20241202_WL_QP_FAWIR_de.pdf)):

* **a1: Strategische und betriebswirtschaftliche Vorgaben analysieren und Massnahmen für die ICT ableiten** (Bereich a: Bei der Umsetzung der ICT Strategie mitwirken). The approach decision (reimplementation versus two-step upgrade) derives ICT measures from the end of AX 2009 support and business goals.
* **c1: ICT Systeme und Dienstleistungen evaluieren** (Bereich c: ICT Lösungen evaluieren und einführen). Inventorying processes, customisations and integrations is an analysis of the existing ICT system as a basis for evaluating the target.
* **d1: Geschäftsprozesse mit geeigneten Methoden analysieren** (Bereich d: Geschäftsprozesse optimieren). The process inventory (procure to pay, order to cash and others) analyses business processes with a structured method.
* **b5: Kosten-Nutzen sowie Risikobeurteilung von ICT Projekten erstellen, aktualisieren und überwachen** (Bereich b: ICT Projekten leiten). The go or no go and high level plan require a first cost-benefit and risk view of the project.
