# Phase 2: Solution design

Goal: design the target on standard F&SCM ("in the box" first) and document gaps.

## Activities

| Activity | Notes | Source |
|---|---|---|
| Fit/gap per process | Prefer standard functionality, record each gap with a decision | [Newell, ch. 12 'In the Box']; [Implementing D365 F&O Apps, ch. 5] |
| Conference room pilots (CRP) | Walk key users through processes on the new system | [Newell, ch. 13] |
| Solution blueprint | Processes, integrations, security, data, environments | [Solution Architect, ch. 12] |
| Target data design | Financial dimensions, inventory dimensions, chart of accounts per legal entity or consolidated | [Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool) |
| Security design | Roles, duties, segregation of duties | [Solution Architect, ch. 4] |
| Environment plan | Development, test, UAT, data migration, production; unified environments in Power Platform admin center | [Newell, ch. 17]; [Learn](https://learn.microsoft.com/en-us/power-platform/admin/unified-experience/tutorial-copy-lifecycle-services-environment-unified-environment) |
| Change management plan | Stakeholders, communication, training | [Newell, ch. 7]; [Solution Architect, ch. 11] |

## Design principles

* Functional concepts from AX 2009 largely carry over; the technical platform is new ([Luszczak, ch. 1]).
* Overlayering is not allowed; customisations are built as extensions ([Implementing D365 F&O Apps, ch. 9 'Customization and Extension']).
* Data design decisions (dimensions, chart of accounts) must be fixed before DMT mapping ([Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool)).

## Deliverables

Fit/gap list, blueprint, functional design documents, security matrix, environment plan, data design decisions log.

## Handlungskompetenzbereiche

Relevant competences from the official qualification profile of the Berufsprüfung Wirtschaftsinformatiker/in ([Wegleitung vom 2. Dezember 2024](https://www.ict-berufsbildung.ch/resources/20241202_WL_QP_FAWIR_de.pdf)):

* **b1: Bedürfnisse von Anspruchsgruppen erheben und diese mit geeigneten Methoden abbilden** (Bereich b: ICT Projekten leiten). CRPs and the change management plan capture stakeholder needs with suitable methods.
* **b2: Bedürfnisse in technische Anforderungen übersetzen** (Bereich b: ICT Projekten leiten). Fit/gap and functional design documents translate business needs into technical requirements.
* **d3: Geschäftsprozesse mit geeigneten ICT-Mitteln modellieren und optimieren** (Bereich d: Geschäftsprozesse optimieren). Designing processes on standard F&SCM models and optimises the target business processes.
* **c1: ICT Systeme und Dienstleistungen evaluieren** (Bereich c: ICT Lösungen evaluieren und einführen). Choosing standard functionality, ISV or extension per gap is an evaluation of ICT solutions.
* **e3: Compliance-Anforderungen überwachen** (Bereich e: Den Betrieb von ICT-Lösungen steuern). Security design with roles, duties and segregation of duties addresses compliance requirements.
