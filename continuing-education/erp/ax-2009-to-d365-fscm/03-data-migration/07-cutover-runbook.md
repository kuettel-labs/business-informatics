# 7. Cutover runbook (data)

Rehearsed in the go-live iteration (mock cutover) ([Newell, ch. 16]; [Learn: Upgrade from AX 2012](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/upgrade-overview-2012) for mock cutover practice). A typical window starts Friday at end of business ([Newell, ch. 16]). Timed template: [templates/cutover-runbook.csv](templates/cutover-runbook.csv).

## Before the window (T minus 4 weeks to T minus 1 day)

| # | Step | Owner |
|---|---|---|
| 1 | Configuration freeze (about one week before) and code freeze | PM, solution architect |
| 2 | Static master data loaded and frozen in production (pre-load), change log for later deltas | Specialist |
| 3 | Final cleansing actions completed in AX 2009 | Data stewards |
| 4 | Communicate blackout: no new transactions in AX 2009 after cutoff | PM |
| 5 | Confirm roster, contact list, escalation path | PM |
| 6 | Verify backups of AX 2009 | IT |

## During the window

| # | Step | Owner | Check |
|---|---|---|---|
| 7 | Close AX 2009 for posting; final period postings | Finance | No unposted journals |
| 8 | Run AX 2009 closing reports (trial balance, open AR/AP, on hand, open orders) and store as signed baseline | Specialist, finance | Reports archived |
| 9 | Final AX 2009 backup, set to read only | IT | Backup verified |
| 10 | Extract delta master data, load with DMT and DMF | Specialist | Counts |
| 11 | Load opening balances (GL, AR, AP, fixed assets) | Specialist | Totals = baseline |
| 12 | Load inventory on hand with cost | Specialist | Quantity and value = baseline |
| 13 | Load open purchase, sales and production orders | Specialist | Counts and values |
| 14 | Reconciliation checklist and data owner sign off per object | Data owners | Signed |
| 15 | Set number sequences above migrated values; enable batch jobs and integrations | Consultant | Smoke test |
| 16 | Smoke test key processes | Key users | Pass |
| 17 | Go / no go decision | Steering | Decision logged |

## Rollback

If go/no go fails, AX 2009 is reopened for posting; production target data is not used. Define the latest rollback point in time in advance.
