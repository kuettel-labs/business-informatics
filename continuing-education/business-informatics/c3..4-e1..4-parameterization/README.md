# Geführte Parametrisierung im ERP (Beispiel: D365 Finance / Supply Chain Management)

## Ziel und Einordnung
Diese Lerneinheit richtet sich an Lernende mit ERP-Hintergrund. Sie zeigt, wie Parameter kontrolliert, nachvollziehbar und wiederholbar verwaltet werden. Parameter sind Setup-Daten wie Buchungsprofile, Nummernkreise, Workflows und Modulparameter.

**Kernkompetenzen:** c3, c4, e1, e2, e3, e4
**Sekundäre Kompetenzen:** b4, b5, c2, d3

**Prüfungsbezug**
- **Teil 2** (schriftlich, Bereiche a, c, d, e): als Fallmaterial.
- **Teil 1:** als mögliches Thema der Projektarbeit.
- **b4/b5:** nur als Bezug für Teil 3.

> Die Zuordnung ist eine eigene Interpretation; die offiziellen Dokumente nennen D365 nicht. Massgebend ist das Qualifikationsprofil (siehe [Quellen](../resources.md)).

## Voraussetzungen
- Grundkenntnisse eines ERP-Systems: Hauptbuch, Kreditoren, Einkauf.
- Grundbegriffe Release- und Change-Management.
- Vorteilhaft ist der Zugang zu einer Test- oder Demo-Umgebung.

## Lernziele
Die Lernenden können …
1. **erklären**, wie sich Konfigurationsdaten (Parameter, Referenzdaten) von Stammdaten unterscheiden. *(c3, e2)*
2. den 6-Schritt-Pfad von der Golden Config bis Prod **beschreiben**. *(c4, e1)*
3. einen Change Request mit Risiko, Freigabe, Test und Rollback **erstellen**. *(e1, b5)*
4. Rollenzuweisungen auf SoD-Konflikte **prüfen**. *(e3)*
5. einen Governance-Baustein einer Handlungskompetenz **zuordnen** und die Zuordnung **begründen**. *(c3, c4, e1–e4)*

## Begriffe
- **Konfigurationsdaten:** Parameter und Referenzdaten, die das Verhalten von Prozessen steuern.
- **Stammdaten:** Debitoren, Kreditoren und Produkte.
- **Golden Config:** die nicht-produktive Referenzumgebung, die als einzige Quelle aller Parameter gilt.
- **Datenpaket / Konfigurationsvorlage (Template):** exportierte und versionierte Setup-Daten. Die Reihenfolge wird über Unit, Level und Sequence gesteuert.
- **SoD (Funktionstrennung):** Unverträgliche Aufgaben werden auf verschiedene Rollen verteilt.
- **Drift:** eine Abweichung von Prod gegenüber der Golden Config.

## Was ist geführte Parametrisierung?
Parameter werden wie Code behandelt:
- Es gibt eine einzige Quelle.
- Jede Änderung hat einen Owner, eine Begründung und eine Freigabe.
- Ausgeliefert wird als versioniertes Paket über Dev → Test → Prod.
- Ein Audit-Trail ist vorhanden.
- Regelmässig wird geprüft, ob Prod noch der Golden Config entspricht.

## Geschäftsnutzen
Typische Risiken ungesteuerter Änderungen (keine gemessenen Werte):
- Ein geändertes Buchungsprofil führt zu Fehlbuchungen.
- Lücken in Nummernkreisen führen zu Feststellungen in der Revision.
- Nach einer Änderung direkt in Prod fällt das System aus oder Prozesse stehen still.
- Beim Monatsabschluss entsteht Nacharbeit, weil Auswertungen und Abstimmungen nicht mehr stimmen.

### KPI (alle Werte sind Platzhalter)
| KPI | Messung | Quelle in D365 | Ziel [festzulegen] |
|---|---|---|---|
| Prod-Änderungen ausserhalb eines Pakets | Anzahl pro Monat | Database Log | 0 |
| Anteil Änderungen mit freigegebenem Backlog-Item | Änderungen mit Item / alle Änderungen | Database Log und Backlog (z. B. Azure DevOps) | [festzulegen] |
| Drift-Befunde pro Monatsprüfung | Anzahl Abweichungen | Exportvergleich der Datenpakete | [festzulegen] |
| Incidents durch Setup-Änderungen | Anzahl pro Quartal | Incident-Tool | [festzulegen] |
| Offene SoD-Konflikte | Anzahl | SoD-Regeln / Security-Reports | [festzulegen] |
| RSAT-Erfolgsquote vor Release | bestandene / alle Testfälle | RSAT / Azure DevOps Test Plans | [festzulegen] |

### Wertgeschichte (fiktiv)
- **Ad hoc:** Eine Buchhalterin ändert ein Buchungsprofil direkt in Prod. Erst beim Monatsabschluss fallen Fehlbuchungen auf. Die Korrektur dauert mehrere Tage, und die Ursache lässt sich nur mühsam nachvollziehen.
- **Geführt:** Die gleiche Änderung läuft als Change Request mit Risikoeinstufung. Sie wird in der Golden Config umgesetzt, mit RSAT getestet und vom Prozess-Owner freigegeben. Danach wird sie als Paket nach Prod ausgeliefert und im Register dokumentiert. Der Fehler fällt bereits im Test auf.

### Product-Owner-Perspektive
- Jede Parameteränderung ist ein Backlog-Item (User Story) mit Akzeptanzkriterien.
- Der Prozess-Owner gibt frei.
- **Definition of Done:** «RSAT grün + Register aktualisiert».
- Priorisiert wird nach Risiko und Geschäftswert.

### Kosten und Nutzen (Bezug b4/b5, Fallstudie)
- **Aufwand:** die Golden Config pflegen, die RSAT-Tests warten, längere Durchlaufzeit pro Änderung.
- **Lohnt sich:** bei mehreren Gesellschaften, bei IKS- oder Revisionsanforderungen und bei häufigen Releases.
- **Schlank genügt:** bei einer Gesellschaft mit wenigen, seltenen Änderungen. Dann reichen ein Register, das Vier-Augen-Prinzip und der Database Log.

## Methode in D365 F/SCM
1. **Golden Config.** Eine nicht-produktive Umgebung ist die Referenz für alle Parameter.
2. **Vorlagen und Datenpakete.** Setup-Daten werden mit Data management (DMF) in der richtigen Reihenfolge exportiert und versioniert, zum Beispiel in der LCS-Asset-Library oder in Azure DevOps.
3. **Change Control.** Jede Änderung braucht ein Backlog-Item, eine Risikobeurteilung und die Freigabe des Prozess-Owners. Ausgeliefert wird nur als Paket. Data task automation macht das Laden wiederholbar.
4. **Funktionstrennung.** Duties und Rollen werden über SoD-Regeln gegen Konflikte abgesichert. Nur eine eng definierte Rolle darf Parameter in Prod pflegen.
5. **Audit und Drift.** Der Database Log läuft auf kritischen Setup-Tabellen. Vor jedem Release laufen RSAT-Regressionstests in Azure DevOps.
6. **Mehrere Gesellschaften.** Referenzdaten werden über Cross-company data sharing geteilt oder mit «Copy into legal entity» kopiert. Grenzen von Cross-company data sharing gemäss Microsoft Learn (verifiziert):
   - keine Transaktionsdaten,
   - keine Felder mit Finanzdimensionen,
   - höchstens 2 Mio. Datensätze pro Job (ab 10.0.10),
   - höchstens 300 Gesellschaften pro Policy (ab 10.0.10),
   - nicht mit Dual-write kombinierbar.

Ergänzend gilt: Jede Einstellung wird in einem **Parameterregister** dokumentiert, mit Wert, Owner, Begründung, Datum und Verweis auf die Änderung.

## Kompetenzbezug
| Baustein | Handlungskompetenz | Begründung |
|---|---|---|
| Golden Config | c3, c4, e4 | Eine einzige Referenz ermöglicht eine kontrollierte Einführung und einen stabilen Betrieb. |
| Datenpakete / Versionierung | e1, c4 | Die Pakete sind die Release-Artefakte. |
| Change Control Dev→Test→Prod | e1, b4, b5 | Releasemanagement, Projektsteuerung und Risikobeurteilung. |
| Funktionstrennung (SoD) | e3 | Internes Kontrollsystem (IKS) und Compliance. |
| Database Log / Drift-Check | e2, e3 | Audit-Trail und Kontrolle der Datenqualität. |
| RSAT-Regressionstests | c2, e1, e4 | Die Anforderungen sind auch nach dem Release erfüllt. |
| Mandantenübergreifende Daten | e2, d3 | Konsistente Referenzdaten und harmonisierte Prozesse. |
| Parameterregister | c3, e2, e3 | Ownership, Nachvollziehbarkeit und dokumentierte Betriebsprozesse. |
| Feature Management / Nummernkreise | e1, d3 | Feature-Flags sind Release-Umfang; Nummernkreise sind prozessrelevantes Setup. |

## Übungen
- **Ü1 (c3, c4, ca. 45 Min.):** Golden-Config-Prozess für eine Gesellschaft entwerfen.
  *Erwartetes Ergebnis:* eine Skizze mit Umgebungen, Rollen und den Gates zwischen Dev, Test und Prod.
- **Ü2 (e1, c4, ca. 30 Min.):** Konfigurationsvorlage für Hauptbuch und Kreditoren entwerfen.
  *Erwartetes Ergebnis:* eine Entitätenliste mit Unit, Level und Sequence sowie eine Begründung der Reihenfolge.
- **Ü3 (e1, b5, ca. 45 Min.):** Change Request für eine Parameteränderung erstellen.
  *Erwartetes Ergebnis:* ein Formular mit Begründung, Risiko, Freigabe, Testfall und Rollback.
- **Ü4 (e3, ca. 30 Min.):** Zwei SoD-Regeln für Purchase-to-Pay definieren.
  *Erwartetes Ergebnis:* zwei Konfliktpaare von Duties mit Begründung.
- **Ü5 (e2, e3, ca. 45 Min.):** Parameterregister und Drift-Prüfung aufsetzen.
  *Erwartetes Ergebnis:* ein Register mit 10 Einträgen und ein Ablauf für die monatliche Drift-Prüfung (Database Log und Exportvergleich).
- **Ü6, Brücke zur Projektarbeit (c3, c4, e1, e3, b5, ca. 90 Min.):** Projektskizze «Einführung geführter Parametrisierung» erstellen.
  *Erwartetes Ergebnis:* eine Skizze mit Ausgangslage, Ziel, KPI, Vorgehen, Risiken und den gewählten Handlungskompetenzen. Abgedeckt werden mindestens 4 Kompetenzen aus mindestens 2 Bereichen.

## Selbstcheck mit Lösungen
1. Worin unterscheiden sich Konfigurationsdaten und Stammdaten?
2. Warum werden Änderungen in Prod nur über Pakete ausgeliefert?
3. Wie hängt die Parametrisierung mit e1, e2 und e3 zusammen?
4. Welche Grenzen hat Cross-company data sharing?
5. Wie wirkt RSAT als Regressions-Gate?
6. Wie lautet eine Parameteränderung als User Story mit Akzeptanzkriterien? (Ich kann eine Parameteränderung als User Story mit Akzeptanzkriterien formulieren.)

<details><summary>Lösungen</summary>

1. Konfigurationsdaten steuern das Verhalten von Prozessen. Stammdaten beschreiben Geschäftsobjekte.
2. Pakete machen Änderungen nachvollziehbar, testbar und wiederholbar und verhindern Drift.
3. e1: Pakete werden als Releases ausgeliefert. e2: Drift-Prüfung und Register sichern die Datenqualität. e3: SoD und Database Log decken die Compliance ab.
4. Keine Transaktionsdaten, keine Finanzdimensionen, Mengengrenzen bei Datensätzen und Gesellschaften, kein Dual-write.
5. Die aufgezeichneten Tests laufen vor jedem Release über Azure DevOps. Ist ein Test rot, wird nicht ausgeliefert.
6. Beispiel: «Als Prozess-Owner Kreditoren möchte ich das Buchungsprofil X anpassen, damit Y korrekt gebucht wird.» Akzeptanzkriterien: Testbuchung korrekt, RSAT grün, Register aktualisiert.
</details>

## Quellen (Microsoft Learn, verifiziert)
- [Configuration data templates](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/configuration-data-templates)
- [Data management overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities-data-packages)
- [Copy configuration data between companies or legal entities overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/copy-configuration)
- [Data task automation](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-task-automation)
- [Asset library in Lifecycle Services](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/lifecycle-services/asset-library)
- [Configure database logging](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/sysadmin/configure-manage-database-log)
- [Role-based security](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/sysadmin/role-based-security)
- [Security capabilities for finance and operations apps](https://learn.microsoft.com/en-us/dynamics365/guidance/implementation-guide/security-strategy-product-oa)
- [Regression suite automation tool (RSAT)](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/perf-test/rsat/rsat-overview)
- [Regression suite automation tool installation and configuration](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/perf-test/rsat/rsat-install-configure)
- [Cross-company data sharing](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/sysadmin/cross-company-data-sharing)
- [Feature management overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/fin-ops/get-started/feature-management/feature-management-overview)
- [Number sequences overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/fin-ops/organization-administration/number-sequence-overview)
- [Manage your data in Dynamics 365 implementation projects (Success by Design)](https://learn.microsoft.com/en-us/dynamics365/guidance/implementation-guide/data-management)

Nicht verifiziert (keine Seite gefunden, daher ohne Link):
- Einrichtung der Versionskontrolle in Azure DevOps für F&O.
- ALM- bzw. Umgebungsstrategie-Kapitel im Success-by-Design-Implementierungsleitfaden.

## Literatur
Seitenzahlen gemäss Inhaltsverzeichnis, nicht geprüft.
- Mohta, Yadav, Shukla: *Implementing Microsoft Dynamics 365 for Finance and Operations Apps*, 2. Aufl., Packt 2020.
  - Kap. 3 «Lifecycle Services (LCS) and Tools» (S. 70)
  - Kap. 6 «Configuration and Data Management» (S. 186), darin «The golden configuration environment» (S. 188) und «Configuration data templates» (S. 202)
- Dawson: *Becoming a Dynamics 365 Finance and Supply Chain Solution Architect*, Packt 2023.
  - «Segregation of duties» (S. 59)
  - «Change boards» (S. 124)
  - «ALM Tools and Applications» (S. 165), darin RSAT (S. 176)
- Luszczak: *Using Microsoft Dynamics 365 for Finance and Operations*, Springer Vieweg 2023.
  - Kap. 10 (S. 443): Role-Based Security (S. 456), Number Sequences (S. 459), Workflows (S. 464), Feature Management (S. 475)
- Newell: *Mastering Microsoft Dynamics 365 Implementations*, Sybex 2021. Einführung und ALM (Seitenzahlen nicht ermittelt).
- Leimeister: *Einführung in die Wirtschaftsinformatik*, 14. Aufl., Springer Gabler 2025.
  - Kap. 3.1 «Data Governance» (S. 133)
  - Kap. 4.6.1 «ERP-Systeme» (S. 279)
  - Kap. 6 «Systementwicklung und Lifecycle Management» (S. 335)
- Heuermann: *Strategisches IT-Management*, Oldenbourg 2014.
  - Kap. 4.2 «IT-Governance und Compliance» (S. 108)
  - Kap. 8.4 «Kritische IT-Prozesse nach COBIT» (S. 310)
