# Phase 5: Testing

| Test type | Purpose | Data used | Source |
|---|---|---|---|
| Unit | Each extension and entity works | Test data | [Implementing D365 F&O Apps, ch. 11 'Testing and Training'] |
| CRP | Process validation with key users | Early migrated master data | [Newell, ch. 13] |
| System integration (SIT) | End to end processes and interfaces | Migrated data from iteration 2 or later | [Newell, ch. 18] |
| Data migration testing | Reconciliation and business validation of loads | Every iteration | [Newell, ch. 16] |
| UAT | Business sign off | Migrated data, near production quality | [Newell, ch. 18] |
| Performance | Volume and batch timing, migration duration versus downtime window | Full volume | [Implementing D365 F&O Apps, ch. 6] |
| Mock cutover | Rehearse the cutover runbook end to end | Full production copy | [Newell, ch. 16]; [Learn: Upgrade from AX 2012](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/upgrade-overview-2012) |

## Defect handling (ERP Project Specialist tasks)

* Record every defect with steps, expected and actual result, severity, owner (template: [defect-log.csv](../03-data-migration/templates/defect-log.csv)).
* Separate data defects (fix in source or mapping) from configuration and code defects.
* Retest and document evidence; report status to the project manager.

## Exit criteria

- [ ] No open severity 1 or 2 defects
- [ ] Reconciliation checklist passed in the last mock cutover
- [ ] UAT sign off by process owners
- [ ] Training delivered ([Implementing D365 F&O Apps, ch. 11])
