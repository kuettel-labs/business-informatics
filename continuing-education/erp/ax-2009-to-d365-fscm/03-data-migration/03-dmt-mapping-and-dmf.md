# 3. DMT mapping files and the data management framework

## 3.1 Data Migration Tool (DMT)

DMT is the supported way to migrate from AX 2009 ([Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool)). Key mechanics from the documentation:

| Element | What it does |
|---|---|
| Excel mapping file | Maps AX 2009 source tables and fields to target data entities |
| Conversions | Transform values (including EDT based conversions for changed field lengths or types) |
| Default values | Fill target fields that have no source |
| Query filters | Limit records extracted (for example only active items, only open documents) |
| Legal entity selection | Choose companies to migrate; virtual companies can be viewed |

### Working practice for the ERP Project Specialist

1. Keep the DMT mapping workbook under version control (file name with iteration number).
2. Mirror every DMT mapping row in [templates/field-mapping-template.csv](templates/field-mapping-template.csv) with a business rule in plain language so data owners can review it.
3. Every query filter must map to a scope rule in [01-strategy-and-scope.md](01-strategy-and-scope.md).
4. Every default value needs a named data owner approval.
5. Record value translations (for example old item groups to new item groups) in [templates/value-mapping-template.csv](templates/value-mapping-template.csv).
6. Pay particular attention to date fields and time zones; a mapping error on a date field from AX 2009 is a documented go-live issue ([Implementing D365 F&O Apps, ch. 12 'Managing Go-Live and Post Go-Live']).

## 3.2 Data management framework concepts

From [Learn: DMF overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities-data-packages):

| Concept | Meaning | Role usage |
|---|---|---|
| Data entity | Abstraction of one or more tables representing a business concept such as Customers or Vendors; reusable for Excel, import/export and integration | Choose and document one entity per object |
| Data project | Configured entities with mapping and default processing options | One project per wave |
| Data job | Execution instance of a project, with files, schedule and options | One job run per iteration and wave |
| Job history | History of source to staging and staging to target runs | Evidence for the iteration log |
| Data package | Single compressed file with a manifest and data files | Transport of configuration and master data between environments |

DMF supports data migration, copying configuration between companies and environments, and integration. For migration you can select only the needed entities, skip error records and continue with good data, then fix and import the bad data later ([Learn: DMF overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities-data-packages)).

Data entities replace the AX 2009 era mix of tools (Excel add-ins, AIF, DIXF) with one concept ([Learn: DMF overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities-data-packages); [Learn: entities](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities)).

## 3.3 Templates

Configuration data templates are predefined, sequenced lists of entities per module, managed on the Template page of the Data management workspace. You can create a template (status Draft), add entities, resequence by unit, level and sequence, add filters, exclude fields with View map, validate it (status Validated), edit in Excel and publish, import and replace templates, or create a template from an existing project ([Learn: templates](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/configuration-data-templates)).

Practice: build one project specific template per wave from the inventory, validate it, and reuse it in every iteration so the sequence never drifts.

## 3.4 Import job steps and staging

The documented import or export process ([Learn: import/export jobs](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-import-export-job)):

1. Define the project category.
2. Identify entities, or apply a template.
3. Set the data format (Excel, XML, delimited; check delimiters and text qualifier, use Unicode).
4. Sequence the entities.
5. Decide whether to use staging tables.
6. Validate the source to target mapping.
7. Verify security for the job.
8. Run the job.
9. Review the job history.
10. Clean up the staging tables.

Staging tables let you verify, clean up or convert data before it reaches the target ([Learn: import/export jobs](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-import-export-job)). Use the form refresh icon, not the browser refresh, to watch progress; a browser refresh interrupts jobs not running in batch (same source).

### Staging checks (SQL or Excel export of staging)

| Check | Example |
|---|---|
| Row count equals source extract | Customers extracted 1,000; staging 1,000 |
| Mandatory fields filled | No empty customer group |
| Referenced values exist | Every item group exists in target |
| No duplicate keys | One row per item number |
| Field length within target | No truncated names |

## 3.5 Data packages and automation

* Use data packages to move configuration and test data between environments.
* The package REST API automates import and export of packages with scheduling outside the system; the recurring integrations API supports scheduling inside the system and XSLT ([Learn: package API](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-management-api)).
* Error files for records that failed source to staging can be retrieved through the API (GetImportStagingErrorFileUrl) for automated error reports (same source).

## 3.6 Other data movement options

| Option | Use | Source |
|---|---|---|
| Copy into legal entity | Duplicate configuration from a template company | [Implementing D365 F&O Apps, ch. 6] |
| Database backup and restore between environments | Move a fully loaded golden or migration environment | [Solution Architect, ch. 5] |
| Excel workbook designer | Small manual data sets and corrections | [Solution Architect, ch. 5] |
| Data sharing | Shared reference data across legal entities | [Solution Architect, ch. 5] |

## Handlungskompetenzbereiche

Relevant competences from the official qualification profile of the Berufsprüfung Wirtschaftsinformatiker/in ([Wegleitung vom 2. Dezember 2024](https://www.ict-berufsbildung.ch/resources/20241202_WL_QP_FAWIR_de.pdf)):

* **b2: Bedürfnisse in technische Anforderungen übersetzen** (Bereich b: ICT Projekten leiten). Field and value mappings translate business data rules into technical specifications.
* **c4: Die Einführung von ICT Lösungen steuern** (Bereich c: ICT Lösungen evaluieren und einführen). Entities, templates and data packages are the technical vehicle of the introduction.
