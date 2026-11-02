# Phase 4: Development and integration

Goal: rebuild required gaps as extensions and rebuild integrations on supported interfaces.

## Key points

| Topic | Guidance | Source |
|---|---|---|
| No code migration from AX 2009 | DMT moves data only; code is redesigned | [Learn: DMT](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/data-migration-tool) |
| Extensions only | Overlayering deprecated since platform 8.0 | [Implementing D365 F&O Apps, ch. 9] |
| Legacy integrations | AIF and .NET Business Connector integrations must be replaced | [Inside AX 2009, ch. 17]; [Inside AX 2009, ch. 10] |
| Integration patterns | Data entities via OData, recurring integrations, package API, events | [Solution Architect, ch. 3]; [Learn: entities](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities) |
| File based integration choice | Recurring integrations API (scheduling inside, XSLT) versus package REST API (scheduling outside, data packages only) | [Learn: package API](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-management-api) |
| Custom data entities | Build where no standard entity covers a migrated object | [Learn: entities](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities) |
| ISV replacement | Check ISV availability on the new platform | [Newell, ch. 9] |

## Checklist

- [ ] Every gap has a design, estimate and owner
- [ ] Every AX 2009 interface mapped to a new pattern
- [ ] Custom entities needed by data migration delivered before migration iteration 2
- [ ] Code freeze date set before go-live ([Learn: Upgrade from AX 2012](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/migration-upgrade/upgrade-overview-2012), practice transferable)

## Deliverables

Technical designs, extension code in source control, integration specifications, interface test evidence.

## Handlungskompetenzbereiche

Relevant competences from the official qualification profile of the Berufsprüfung Wirtschaftsinformatiker/in ([Wegleitung vom 2. Dezember 2024](https://www.ict-berufsbildung.ch/resources/20241202_WL_QP_FAWIR_de.pdf)):

* **b2: Bedürfnisse in technische Anforderungen übersetzen** (Bereich b: ICT Projekten leiten). Technical designs translate approved gaps into technical requirements.
* **c1: ICT Systeme und Dienstleistungen evaluieren** (Bereich c: ICT Lösungen evaluieren und einführen). Choosing integration patterns (OData, recurring integrations, package API) evaluates ICT services.
* **e1: Releasemanagement betreiben** (Bereich e: Den Betrieb von ICT-Lösungen steuern). Extensions in source control and a code freeze prepare controlled release management.
