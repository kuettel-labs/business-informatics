# Change Control mit Backlog-Item

[Zurück zur Übersicht](README.md) · [Geführte Parametrisierung](gefuehrte-parametrisierung.md) · [Parameterregister](parameterregister.md) · [Change Control](change-control.md) · [Risikobeurteilung](risikobeurteilung.md)

## Ziel und Einordnung
Jede Parameteränderung durchläuft einen festen Lebenszyklus, vom Antrag bis zum Abschluss.

- **Kernkompetenzen:** e1, c4, e3
- **Sekundäre Kompetenzen:** b4, b5, c2, c3, e4

> Die Zuordnung ist eine eigene Interpretation; die offiziellen Dokumente nennen D365 nicht. Massgebend ist das Qualifikationsprofil.

## Geschäftsnutzen
Typische Risiken ohne Change Control (keine gemessenen Werte):
- Ungetestete Änderungen in Prod führen zu Fehlbuchungen oder zum Stillstand.
- Ohne Rollback-Plan dauert die Wiederherstellung lange.
- Ohne Freigabe fehlt der Nachweis für das IKS.
- Parallele Änderungen kollidieren.

## Lebenszyklus
1. **Antrag:** Der Fachbereich meldet einen Änderungsbedarf.
2. **Backlog-Item:** Der Antrag wird als User Story erfasst und erhält eine Change-ID.
3. **Refinement:** Akzeptanzkriterien, Betroffenheit (Module, Legal Entities) und Abhängigkeiten werden geklärt.
4. **Risikobeurteilung:** Die Änderung wird einer Risikoklasse zugeordnet (siehe [Risikobeurteilung](risikobeurteilung.md)).
5. **Freigabe zur Umsetzung:** durch den Prozess-Owner.
6. **Umsetzung in der Golden Config**
7. **Paket:** Export als Datenpaket mit Version.
8. **Test und RSAT:** Testfälle und die Regressionssuite laufen in Test/UAT.
9. **CAB / Freigabe:** Freigabe für Prod gemäss Risikoklasse.
10. **Deployment nach Prod:** Import des Pakets, kein manuelles Erfassen.
11. **Register-Update:** Eintrag im [Parameterregister](parameterregister.md).
12. **Abschluss:** Die Definition of Done wird geprüft und das Item geschlossen.

## Vorlage Backlog-Item
```text
Change-ID:
Titel:
User Story: Als <Rolle> möchte ich <Änderung>, damit <Nutzen>.
Betroffen: Modul / Legal Entity / Parameter
Risikoklasse: Standard | Normal | Notfall
Akzeptanzkriterien:
  - Gegeben ... wenn ... dann ...
Definition of Done:
  - RSAT grün
  - Register aktualisiert
  - Freigabe dokumentiert
  - Paket versioniert
Rollback-Plan: <Vorgängerpaket / alter Wert / Verantwortliche Rolle / max. Dauer>
```

## Freigabematrix (RACI-Vorlage)
| Schritt | Fachbereich | Prozess-Owner | Applikationsverantwortliche | Test | CAB |
|---|---|---|---|---|---|
| Antrag | R | A | C | | |
| Refinement / Risiko | C | A | R | C | |
| Umsetzung Golden Config | | C | R/A | | |
| Test / RSAT | C | A | C | R | |
| Freigabe Prod | | R | C | C | A |
| Deployment / Register | | I | R/A | | I |

R = Responsible, A = Accountable, C = Consulted, I = Informed. Die Vorlage ist an die eigene Organisation anzupassen.

## Beispiel (fiktiv)
```text
Change-ID: CHG-0001
Titel: Sammelkonto Kreditoren Ausland trennen
User Story: Als Leitung Kreditoren möchte ich für ausländische Kreditoren ein eigenes
  Sammelkonto, damit die Fremdwährungsverbindlichkeiten separat ausgewiesen werden.
Betroffen: Kreditoren / CH01 / Buchungsprofil «GEN»
Risikoklasse: Normal (siehe Risikobeurteilung, Beispiel 2)
Akzeptanzkriterien:
  - Gegeben ein Kreditor mit Gruppe «Ausland», wenn eine Rechnung gebucht wird,
    dann bucht das System auf das Sammelkonto 2010.
  - Inlandkreditoren buchen unverändert auf 2000.
Definition of Done: RSAT TC-AP-04 grün, Register aktualisiert, CAB-Freigabe dokumentiert,
  Paket PKG-AP-CH01-1.3.0 versioniert.
Rollback-Plan: Paket PKG-AP-CH01-1.2.0 erneut importieren; Applikationsverantwortliche; max. 1 Std.
```

## Product-Owner-Perspektive
- Parameteränderungen sind Backlog-Items wie jede andere Anforderung.
- Priorisiert wird nach Risiko und Geschäftswert.
- Der Prozess-Owner ist Approver.
- Die Akzeptanzkriterien sind testbar formuliert, damit sie als RSAT-Testfälle dienen können.
- Die Definition of Done enthält immer «RSAT grün + Register aktualisiert».

## KPI (Platzhalter)
| KPI | Messung | Quelle | Ziel |
|---|---|---|---|
| Prod-Änderungen ausserhalb eines Pakets | Anzahl pro Monat | Database Log | 0 |
| Anteil Änderungen mit freigegebenem Backlog-Item | Quote | Backlog, Database Log | [festzulegen] |
| Durchlaufzeit Antrag bis Prod | Median in Tagen | Backlog | [festzulegen] |
| Rollbacks | Anzahl pro Quartal | Change-Log | [festzulegen] |

## Übungen
- **Ü1 (e1, b5, ca. 45 Min.):** Ein Backlog-Item für eine eigene, fiktive Änderung mit der Vorlage erstellen.
  *Erwartetes Ergebnis:* eine vollständige Vorlage mit testbaren Akzeptanzkriterien und einem Rollback-Plan.
- **Ü2 (e3, b4, ca. 30 Min.):** Die RACI-Matrix an eine Organisation mit drei Gesellschaften anpassen.
  *Erwartetes Ergebnis:* Es gibt genau ein A pro Schritt, und SoD ist eingehalten (wer umsetzt, gibt nicht frei).

## Selbstcheck
1. Warum wird in Prod nur über Pakete ausgeliefert?
2. Was gehört in die Definition of Done?
3. Wer darf eine Änderung nicht selbst freigeben?

<details><summary>Lösungen</summary>

1. Pakete sind nachvollziehbar, testbar und wiederholbar und verhindern Drift.
2. RSAT grün, Register aktualisiert, Freigabe dokumentiert, Paket versioniert.
3. Die Rolle, die die Änderung umgesetzt hat (Funktionstrennung).
</details>

## Quellen
- [Create and manage your product backlog (Azure Boards)](https://learn.microsoft.com/en-us/azure/devops/boards/backlogs/create-your-backlog)
- [Test your Dynamics 365 solution before deployment (Implementation Guide)](https://learn.microsoft.com/en-us/dynamics365/guidance/implementation-guide/testing-strategy)
- [Regression suite automation tool (RSAT)](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/perf-test/rsat/rsat-overview)
- [Lifecycle Services for finance and operations apps customers](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/lifecycle-services/lcs-works-lcs)
- [Copy configuration data between companies or legal entities overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/copy-configuration)
- [ITIL (Axelos, Übersicht ITIL 4 inkl. Change Enablement)](https://www.axelos.com/certifications/itil-service-management): Seite verifiziert; eine eigene Seite zur Practice «Change Enablement» ist nicht verifiziert.
- [COBIT (ISACA)](https://www.isaca.org/resources/cobit): Seite verifiziert; eine Seite speziell zu BAI06 «Managed IT Changes» ist nicht verifiziert.
- [ISO/IEC 27001:2022](https://www.iso.org/standard/27001): Seite verifiziert; der Inhalt der Controls zu Change Management (Annex A) ist kostenpflichtig, daher nicht verifiziert.
- Versionskontrolle in Azure DevOps für F&O: nicht verifiziert (kein Link).

## Literatur
Seitenzahlen gemäss Inhaltsverzeichnis, nicht geprüft.
- Dawson: *Becoming a Dynamics 365 Finance and Supply Chain Solution Architect*, 2023. «Change boards» (S. 124), «ALM Tools and Applications» (S. 165), RSAT (S. 176).
- Mohta, Yadav, Shukla: *Implementing Microsoft Dynamics 365 for Finance and Operations Apps*, 2. Aufl., 2020. Kap. 6 (S. 186), «Change management» (S. 433).
- Heuermann: *Strategisches IT-Management*, 2014. Kap. 8.4 «Kritische IT-Prozesse nach COBIT» (S. 310).
- Newell: *Mastering Microsoft Dynamics 365 Implementations*, 2021. Seitenzahlen nicht ermittelt.
- Gesto: *Introduction to Enterprise Service Management*, 2023. Seitenzahlen nicht ermittelt; Relevanz für Change Management nicht geprüft.
