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
