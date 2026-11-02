# 8. History and archive

DMT migrates data, not the full history ([Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool)). The recommended pattern is open transactions plus opening balances, leaving history behind ([Newell, ch. 16]).

| Option | Description | Source |
|---|---|---|
| AX 2009 read only | Keep the old system available read only for a retention period | Common practice (**UNVERIFIED** licensing and infrastructure implications) |
| Archive database | Copy AX 2009 database into a reporting database with views and reports | [Solution Architect, ch. 5] |
| BYOD | Export history or entities to your own Azure SQL database for reporting | [Solution Architect, ch. 5] |
| Summary history migration | Migrate monthly GL balances for prior years for comparison reports | [Solution Architect, ch. 5] |

## Checklist

- [ ] Legal retention requirements confirmed by finance (country specific; **UNVERIFIED** in this guide)
- [ ] History needs per department listed (sales history for planning, purchase history, quality records)
- [ ] Archive tested with real user questions before go-live
- [ ] Attachments: decide where documents from AX 2009 live
- [ ] Decommission date for AX 2009 servers
