# c – ICT Lösungen evaluieren und einführen

**Prüfung:** Teil 2 (schriftlich, Fallstudie und Mini-Cases); wählbar in der Projektarbeit (Teil 1).
**Orientierungsmodule:** 648, 649, 650, 687, 689 (Anhang 1, Abbildung)

Worum es geht: Den Lebenszyklus von ICT-Lösungen steuern, von der Ablösung alter Systeme über Evaluation, Test und Einführung bis zur Überwachung mit KPI im Betrieb.

## Lernziele (eigene Zusammenfassung des Qualifikationsprofils)

| HK | Kompetenz | Du kannst … |
|---|---|---|
| c1 | ICT-Systeme und Dienstleistungen evaluieren | Bestehende Systeme analysieren und Ablösekandidaten erkennen, Bedürfnisse als Anforderungen beschreiben, validieren und priorisieren, Lösungsvarianten erarbeiten, Offerten einholen und bewerten (z. B. Kosten-Nutzen), Entscheidungsgrundlage aufbereiten |
| c2 | Erfüllung von Anforderungen analysieren und beurteilen | Teststrategie und Testkonzept aufbauen, aus User Stories/Use Cases Testanforderungen und Testfälle ableiten, regelmässige Tests steuern (z. B. nach Upgrades), Tests überwachen und auswerten |
| c3 | ICT-Betriebsprozesse erstellen und implementieren | Betriebsprozesse nach ITSM-Methoden modellieren, detailliert dokumentieren und an die Betriebsorganisation übergeben |
| c4 | Einführung von ICT-Lösungen steuern | Beschaffungszeitplan erstellen, Entwicklung, Implementierung, Rollout und Ausserbetriebnahme planen, Einführung bezüglich Anforderungen, Termin und Budget überwachen, Lösung demonstrieren, Schulungskonzept umsetzen, Betriebsorganisation und Monitoring festlegen |
| c5 | ICT-Services mit KPI überwachen und optimieren | KPI aus übergeordneten Vorgaben bestimmen und erheben, gegen Sollwerte interpretieren, mit Spezialisten validieren und Optimierungen ableiten |

Haltungen: Objektivität bei Anforderungen und Kennzahlen, Übersetzen zwischen Business und ICT, aktuelle Technologien berücksichtigen.

## Schlüsselkonzepte

- **Evaluation:** Pflichten-/Lastenheft, Muss-/Kann-Kriterien, Ausschlusskriterien, Kriterienkatalog, Nutzwertanalyse, Longlist/Shortlist, RFI/RFP, Referenzbesuche, Proof of Concept; öffentliche Beschaffung (BöB/IVöB, zu prüfen falls relevant)
- **Make or Buy, Cloud-Modelle:** SaaS/PaaS/IaaS, Standardsoftware vs. Individualentwicklung
- **Testen:** Teststrategie, Teststufen (Unit, Integration, System, Abnahme/UAT), Testarten (funktional, Last, Regression), Testfall-Aufbau, Fehlerklassen, Testendekriterien, ISTQB-Begriffe
- **ITSM:** ITIL 4 Practices (Incident, Problem, Change, Service Request, Release, Service Level), RACI, Prozesslandkarte Betrieb
- **Einführung:** Rollout-Strategien (Big Bang, phasenweise, Pilot, Parallelbetrieb), Cutover-Plan, Datenmigration, Hypercare, Schulungskonzept (Train-the-Trainer, Key User), Ausserbetriebnahme/Archivierung
- **KPI:** Verfügbarkeit, MTTR/MTBF, First Time Fix Rate, Ticketvolumen, Kundenzufriedenheit; Soll-Ist-Vergleich, Dashboard

## Empfohlene Library-Bücher

- `Leimeister - Einführung in die Wirtschaftsinformatik (14. Aufl., Springer Gabler, 2025) - ISBN 9783662706466.pdf` (Systementwicklung, Einführung)
- `Alpar et al. - Anwendungsorientierte Wirtschaftsinformatik (9. Aufl., Springer Vieweg, 2019) - ISBN 9783658255800.pdf` (Auswahl und Einführung von Standardsoftware)
- `Kessel, Vogt - Wirtschaftsinformatik - Kurzlehrbuch mit eLearning-Kurs (UVK Verlag, 2024) - ISBN 9783381112739.epub` (Repetition)

Lücke: ITIL 4 und ISTQB-Grundlagen sind nicht in der Library (siehe [resources.md](../resources.md)).

## Übungen und Fallstudien

- [ ] **Labor:** [ERPNext mit Docker](../../erp/erpnext-docker/) aufsetzen und als Evaluationskandidat gegen 10 Muss-Kriterien testen (c1, c2)
- [ ] **RE-Kurs:** [Use Case](../../requirements-engineering/course/09-use-case/) und [User Stories](../../requirements-engineering/course/06-user-stories/) als Basis für Testfälle (c2)
- [ ] **Mini-Case c1:** Kriterienkatalog und Nutzwertanalyse für drei Offerten. *Platzhalter*
- [ ] **Mini-Case c2:** Testkonzept für ein ERP-Upgrade (Umfang, Stufen, Rollen, Endekriterien). *Platzhalter*
- [ ] **Mini-Case c3:** Incident- und Change-Prozess als BPMN mit RACI. *Platzhalter*
- [ ] **Mini-Case c4:** Rollout-Plan mit Cutover, Schulung und Ausserbetriebnahme des Altsystems. *Platzhalter*
- [ ] **Mini-Case c5:** KPI-Dashboard eines Service interpretieren und drei Massnahmen ableiten. *Platzhalter*

## Selbstcheck

1. Was ist der Unterschied zwischen Lastenheft und Pflichtenheft?
2. Wie gehst du vor, wenn eine Offerte ein Muss-Kriterium nicht erfüllt?
3. Nenne die Teststufen und wer jeweils verantwortlich ist.
4. Wann wählst du einen Pilot-Rollout statt Big Bang?
5. Welche Inhalte hat ein Schulungskonzept?
6. Wie unterscheiden sich Incident und Problem Management?
7. MTTR steigt seit drei Monaten. Wie analysierst du die Ursache?

## Unterstützende Kurse (Digicomp)

Optional, siehe [digicomp-courses.md](../digicomp-courses.md) und [preparation-courses.md](../preparation-courses.md):

- ITIL Version 5 Foundation (IT5L/IT5): c3 Betriebsprozesse, c5 KPI
- IREB CPRE Foundation Level (QM2): c2 Anforderungen prüfen

## Fortschritts-Checkliste

- [ ] c1 Evaluation und Offertvergleich
- [ ] c2 Teststrategie und Testfälle
- [ ] c3 ITSM-Betriebsprozesse
- [ ] c4 Einführung und Rollout
- [ ] c5 KPI-Überwachung
- [ ] ERPNext-Labor als Evaluationsübung durchgeführt
