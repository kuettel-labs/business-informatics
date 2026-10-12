# e – Den Betrieb von ICT-Lösungen steuern

**Prüfung:** Teil 2 (schriftlich, Fallstudie und Mini-Cases); wählbar in der Projektarbeit (Teil 1).
**Orientierungsmodule:** 650 (e1), 655 (e2), 656 (e3, e4) (Anhang 1, Abbildung)

Worum es geht: Qualität, Daten und Rechtskonformität von ICT-Lösungen im Betrieb sicherstellen, Releases geordnet ausliefern und die Betriebsstabilität auch im Notfall gewährleisten.

## Lernziele (eigene Zusammenfassung des Qualifikationsprofils)

| HK | Kompetenz | Du kannst … |
|---|---|---|
| e1 | Releasemanagement betreiben | Release-Umfang mit Anspruchsgruppen festlegen, Zeitplan mit Change- und Produktmanagement abstimmen, Release-Kriterien überwachen, Releases dokumentieren (z. B. Rückwärtskompatibilität) und Versionshistorie für Reproduzierbarkeit führen |
| e2 | Datenqualität überwachen und steuern | Zu überwachende Datenobjekte, Dimensionen und Qualitätsniveaus gemäss Richtlinien festlegen, überwachen, Verletzungen an Verursacher und Datenverantwortliche melden, nachhaltige Verbesserungen entwickeln und Ergebnisse empfängergerecht berichten |
| e3 | Compliance-Anforderungen überwachen | Relevante Gesetze für Unternehmen und Lösung identifizieren, Einhaltung regelmässig prüfen, Compliance-Risikoanalyse erstellen, Resultate berichten und Verbesserungen bei Abweichungen vorschlagen |
| e4 | Betriebsstabilität managen | Kritische Systeme, Applikationen und Daten identifizieren, Risiken bewerten und visualisieren, Massnahmenkatalog mit Spezialisten erstellen und mit Entscheidungsträgern priorisieren, Umsetzung begleiten, Business-Continuity-Pläne und Checklisten erstellen und testen |

Haltungen: Datenflüsse ganzheitlich analysieren, Risikobewusstsein (rechtlich und ökonomisch), Risiken klar und zeitnah kommunizieren, vernetztes Denken.

## Schlüsselkonzepte

- **Release und Change:** Release-Typen (Major/Minor/Patch, semantische Versionierung), Release-Kalender, Go/No-Go-Kriterien, Change Advisory Board, Rollback-Plan, Release Notes, Umgebungen (Dev/Test/Prod), CI/CD
- **Datenqualität:** Dimensionen (Vollständigkeit, Korrektheit, Konsistenz, Aktualität, Eindeutigkeit, Gültigkeit), Data Owner/Data Steward, Stammdatenmanagement (MDM), DQ-Regeln und -Monitoring, Ursachenbehebung statt Symptombereinigung
- **Compliance (Schweiz):** DSG (revidiert, seit 1.9.2023), DSV, Auftragsbearbeitung, Datenschutz-Folgenabschätzung, Aufbewahrungspflichten (OR, GeBüV), Vertragsrecht (OR), Urheberrecht/Lizenzen (URG), Branchenregeln; EU-DSGVO bei EU-Bezug. Gesetzesverweise vor Verwendung auf fedlex.admin.ch prüfen.
- **Informationssicherheit:** Schutzziele (Vertraulichkeit, Integrität, Verfügbarkeit), ISMS nach ISO/IEC 27001, IKT-Minimalstandard (BWL), Schutzbedarfsanalyse
- **Betriebsstabilität:** Business Impact Analysis, RTO/RPO, Risikomatrix, BCM/BCP, Disaster Recovery, Backup-Konzept (3-2-1), Notfallübungen

## Empfohlene Library-Bücher

- `Unland, Pernul - Datenbanken im Einsatz - Analyse, Modellbildung und Umsetzung (De Gruyter Oldenbourg, 2015) - ISBN 9783486721416.pdf` (e2: Datenmodell und Datenqualität)
- `Leimeister - Einführung in die Wirtschaftsinformatik (14. Aufl., Springer Gabler, 2025) - ISBN 9783662706466.pdf` (IT-Sicherheit, Datenmanagement)
- `Bächle, Daurer, Kolb - Einführung in die Wirtschaftsinformatik (5. Aufl., De Gruyter Oldenbourg, 2021) - ISBN 9783110722253.pdf` (Datenschutz und Sicherheit, Grundlagen)

Lücke: Schweizer Rechtsgrundlagen, ITIL 4 und ISO/IEC 27001 sind nicht in der Library (siehe [resources.md](../resources.md)).

### Aus deiner Bibliothek (Calibre)

- Michael Kaufmann: SQL- und NoSQL-Datenbanken (deutsch)
- Alfred Basta: Database Security; Alex Meyer: Least Privilege (Berechtigungen)
- Jose Angel Fernandez: Cloud Observability With Azure Monitor (Monitoring, SLA)

ITIL fehlt in der Bibliothek. Details: [resources.md](../resources.md#eigene-bibliothek-calibre)

## Übungen und Fallstudien

- [ ] **RE-Übung 2:** [Chargenrückverfolgbarkeit](../../../exercises/requirements-engineering/batch-traceability/) – Datenqualitätsregeln für Chargendaten und Compliance-Bezüge herleiten (e2, e3)
- [ ] **AZ-900:** [Identität, Sicherheit und Governance](../../azure-fundamentals-az-900/) als Basis für e3 und e4
- [ ] **Mini-Case e1:** Release-Plan für ein ERP-Update mit Go/No-Go-Kriterien und Rollback. *Platzhalter*
- [ ] **Mini-Case e2:** DQ-Konzept für Kundenstammdaten (Dimensionen, Messregeln, Verantwortliche). *Platzhalter*
- [ ] **Mini-Case e3:** Compliance-Check einer Cloud-Lösung mit Personendaten (DSG). *Platzhalter*
- [ ] **Mini-Case e4:** BIA mit RTO/RPO für drei Systeme und BCP-Checkliste. *Platzhalter*

## Selbstcheck

1. Welche Go/No-Go-Kriterien legst du für ein Release fest?
2. Nenne sechs Datenqualitätsdimensionen und je eine Messregel.
3. Was ist der Unterschied zwischen Data Owner und Data Steward?
4. Welche Pflichten hat ein Unternehmen nach DSG bei einer Datensicherheitsverletzung? (zu prüfen am Gesetzestext)
5. Erkläre RTO und RPO an einem Beispiel.
6. Wie testest du einen Business-Continuity-Plan, ohne den Betrieb zu gefährden?

## Unterstützende Kurse (Digicomp)

Optional, siehe [digicomp-courses.md](../digicomp-courses.md) und [preparation-courses.md](../preparation-courses.md):

- ITIL Version 5 Foundation (IT5L/IT5): e1 Release, e4 Betriebsstabilität
- ISO/IEC 27001 Foundation (IS27F): e3, e4
- Das Schweizer Datenschutzgesetz (NDSGT) / Kurspaket (NDSG): e2, e3

## Fortschritts-Checkliste

- [ ] e1 Releasemanagement
- [ ] e2 Datenqualität
- [ ] e3 Compliance (DSG, OR, URG)
- [ ] e4 Betriebsstabilität und BCM
- [ ] Mini-Cases gelöst
