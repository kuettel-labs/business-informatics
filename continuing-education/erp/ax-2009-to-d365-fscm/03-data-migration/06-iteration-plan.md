# 6. Iteration plan

Plan four or more iterations starting with Iteration 0, each in a defined environment, ending with a go-live iteration that is a full mock cutover ([Newell, ch. 16]). Iterate in every environment ([Implementing D365 F&O Apps, ch. 6]); run cleanup iterations ([Solution Architect, ch. 5]).

| Iteration | Goal | Scope | Environment | Entry criteria | Exit criteria |
|---|---|---|---|---|---|
| 0 | Prove tooling end to end | Setup plus a few master objects, small samples | Data migration sandbox | DMT and DMF available, design decisions for dimensions and chart of accounts | One object loaded via DMT and via DMF job, issues logged |
| 1 | All master data | Waves 0 to 6 | Sandbox | Mapping v1 reviewed by owners | Counts reconcile, error rate trend known, timings recorded |
| 2 | Add balances and open documents | Waves 0 to 10 | Test / SIT | Cleansing backlog reduced, custom entities available | Financial reconciliation passes, data used for SIT |
| 3 | UAT quality data | Full scope, full volume | UAT | All mapping signed | Reconciliation passes, UAT runs on migrated data |
| 4 (go-live iteration) | Mock cutover | Full scope, production copy, timed runbook | Production like | Runbook complete, team rostered | Completed inside downtime window, signed reconciliation, go/no go input |
| Go-live | Production load | Full | Production | Go decision | Data owner sign off |

Repeat iteration 3 or 4 if exit criteria fail. Durations per iteration are project specific (**UNVERIFIED**).

## Per iteration routine for the specialist

1. Refresh the source extract (same AX 2009 snapshot time where possible).
2. Apply the current mapping version; log version numbers.
3. Run templates in sequence; record timings per entity in [templates/iteration-log.csv](templates/iteration-log.csv).
4. Export job history errors, classify (data, mapping, configuration, code), log defects.
5. Reconcile; update the inventory status.
6. Lessons learned and status report to the project manager.
