# Phase 6: Cutover and go-live

The detailed data runbook is in [03-data-migration/07-cutover-runbook.md](../03-data-migration/07-cutover-runbook.md).

## Go-live readiness checklist

- [ ] Mock cutover completed within the downtime window ([Newell, ch. 16]; [Implementing D365 F&O Apps, ch. 6])
- [ ] Configuration frozen about one week before go-live and code frozen ([Learn: Upgrade from AX 2012](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/upgrade-overview-2012), transferable practice)
- [ ] Go/no go criteria agreed ([Newell, ch. 20]; [Implementing D365 F&O Apps, ch. 12 'Managing Go-Live and Post Go-Live'])
- [ ] Users trained, support model live ([Newell, ch. 22])
- [ ] Rollback plan (stay on AX 2009) documented
- [ ] Data owners available for sign off during the cutover weekend

## Lessons from the literature

* A typical cutover starts at end of business on Friday and finishes over the weekend ([Newell, ch. 16]).
* A documented example: a date field mapping error from AX 2009 surfaced only at go-live, which shows why field level validation matters ([Implementing D365 F&O Apps, ch. 12]).

## Handlungskompetenzbereiche

Relevant competences from the official qualification profile of the Berufsprüfung Wirtschaftsinformatiker/in ([Wegleitung vom 2. Dezember 2024](https://www.ict-berufsbildung.ch/resources/20241202_WL_QP_FAWIR_de.pdf)):

* **c4: Die Einführung von ICT Lösungen steuern** (Bereich c: ICT Lösungen evaluieren und einführen). The go-live readiness checklist and go/no go criteria steer the introduction.
* **b5: Kosten-Nutzen sowie Risikobeurteilung von ICT Projekten erstellen, aktualisieren und überwachen** (Bereich b: ICT Projekten leiten). The rollback plan addresses the main go-live risk.
* **c3: ICT Betriebsprozesse erstellen und implementieren** (Bereich c: ICT Lösungen evaluieren und einführen). The support model that goes live establishes the operating processes.
