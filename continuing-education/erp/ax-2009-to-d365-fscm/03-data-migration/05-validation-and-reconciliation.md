# 5. Validation and reconciliation

Validation must be planned with a checklist and repeated each iteration ([Newell, ch. 16]). Measure load duration against the downtime window ([Implementing D365 F&O Apps, ch. 6]).

## Validation levels

| Level | What | Who | Evidence |
|---|---|---|---|
| 1 Technical | Job history: records staged, inserted, errors | Specialist | Job history export ([Learn: import/export jobs](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-import-export-job)) |
| 2 Counts | Source count = staging = target, minus documented exclusions | Specialist | Iteration log |
| 3 Totals | Sums of key amounts and quantities | Specialist, finance | Reconciliation checklist |
| 4 Sample | Random and risk based record comparison, field by field | Key users | Sample sheet |
| 5 Business | Process test with migrated data (post a receipt, invoice, production order) | Key users | Test scripts |
| 6 Sign off | Data owner accepts | Data owner | Sign off form |

## Reconciliation checklist (summary)

Full template: [templates/reconciliation-checklist.md](templates/reconciliation-checklist.md).

| Object | Reconcile | Tolerance |
|---|---|---|
| GL | Trial balance per main account and dimension, AX 2009 vs target opening balance | Zero |
| AR | Open items total per customer and in total, equal to GL receivables control | Zero |
| AP | Open items total per vendor and in total, equal to GL payables control | Zero |
| Inventory | Quantity per item, site, warehouse (and batch or serial); value equal to GL inventory accounts | Zero quantity; value agreed rounding |
| Fixed assets | Acquisition value, accumulated depreciation, net book value | Zero |
| Open purchase orders | Count, open quantity, open value | Zero |
| Open sales orders | Count, open quantity, open value | Zero |
| Masters | Count by status; mandatory fields filled | Count zero; fields 100% |
| BOMs / routes | Count of active versions, line counts | Zero |

Tolerances are suggestions (**UNVERIFIED**); finance owners set the final values.

## Common errors and checks

* Date fields shifted or wrong (documented AX 2009 example, [Implementing D365 F&O Apps, ch. 12]).
* Truncated text after field length change (EDT conversions, [Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool)).
* Dimension values mapped to the wrong dimension.
* Unit conversions missing, causing wrong quantities.

## Handlungskompetenzbereiche

Relevant competences from the official qualification profile of the Berufsprüfung Wirtschaftsinformatiker/in ([Wegleitung vom 2. Dezember 2024](https://www.ict-berufsbildung.ch/resources/20241202_WL_QP_FAWIR_de.pdf)):

* **c2: Die Erfüllung von Anforderungen von ICT Lösungen analysieren und beurteilen** (Bereich c: ICT Lösungen evaluieren und einführen). Validation levels and reconciliation check whether the migrated solution meets its requirements.
* **e2: Datenqualität überwachen und steuern** (Bereich e: Den Betrieb von ICT-Lösungen steuern). Reconciliation checklists are a data quality control.
* **e3: Compliance-Anforderungen überwachen** (Bereich e: Den Betrieb von ICT-Lösungen steuern). Reconciled financial balances support audit and compliance evidence.
