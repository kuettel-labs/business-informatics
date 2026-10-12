# d – Geschäftsprozesse optimieren

**Prüfung:** Teil 2 (schriftlich, Fallstudie und Mini-Cases); wählbar in der Projektarbeit (Teil 1).
**Orientierungsmodule:** 644 (Geschäftsprozesse modellieren), 645 (Geschäftsprozesse analysieren und optimieren) (Anhang 1, Abbildung)

Worum es geht: Als Business Analyst Prozesse erheben, modellieren, Schwachstellen finden, Varianten bewerten, Ergebnisse adressatengerecht präsentieren und die Umsetzung begleiten.

## Lernziele (eigene Zusammenfassung des Qualifikationsprofils)

| HK | Kompetenz | Du kannst … |
|---|---|---|
| d1 | Geschäftsprozesse mit geeigneten Methoden analysieren | Scope festlegen, Ist-Zustand erheben (Dokumentenanalyse, Interview, Befragung, Beobachtung), Prozesse in Teilprozesse zerlegen und klassifizieren (z. B. automatisiert/manuell), Beteiligte und Prozessdaten (Dauer, Menge, Häufigkeit) erfassen, mit ICT-Mitteln visualisieren, Daten plausibilisieren und dokumentieren |
| d2 | Ergebnis einer Prozessanalyse zielgruppengerecht aufbereiten und vertreten | Zielgruppen bestimmen, Analyse interpretieren, Rahmen der Präsentation klären, Schwerpunkte setzen, Präsentation mit passenden Medien entwickeln, Feedback einholen, präsentieren und Diskussion leiten |
| d3 | Geschäftsprozesse mit ICT-Mitteln modellieren und optimieren | Optimierungsvorschläge entwickeln und strukturieren, mit Methoden bewerten und priorisieren, Massnahmen auswählen, Umsetzung begleiten und Wirkung messen |

Haltungen: strukturiert, unvoreingenommen und kritisch analysieren, transparent und wertschätzend auftreten, ökonomische und kulturelle Aspekte erkennen.

## Schlüsselkonzepte

- **Prozessarten und Landkarte:** Management-, Kern- und Unterstützungsprozesse, Prozesslandkarte, Wertschöpfungskette
- **Notationen:** BPMN 2.0 (Pools, Lanes, Ereignisse, Gateways), EPK, Swimlane, SIPOC, Wertstromanalyse
- **Analyse:** Ist-Aufnahme, Kennzahlen (Durchlaufzeit, Bearbeitungszeit, Fehlerquote, Kosten pro Fall), Schwachstellen (Medienbrüche, Doppelerfassung, Wartezeiten, Schnittstellen), Ursachenanalyse (Ishikawa, 5 Why), Pareto
- **Optimierung:** Lean (Muda), Kaizen/KVP, Six Sigma (DMAIC), Automatisierung (Workflow, RPA, ERP-Standardprozesse), Soll-Prozess, Variantenbewertung (Nutzwertanalyse, Aufwand-Nutzen-Matrix)
- **Umsetzung:** Change Management, Prozessverantwortliche (Process Owner), Wirkungsmessung (Vorher/Nachher-KPI)
- **Präsentation:** Pyramidenprinzip (Kernaussage zuerst), zielgruppengerechte Visualisierung

## Empfohlene Library-Bücher

- `Leimeister - Einführung in die Wirtschaftsinformatik (14. Aufl., Springer Gabler, 2025) - ISBN 9783662706466.pdf` (Geschäftsprozessmanagement)
- `Krallmann, Bobrik, Levina - Systemanalyse im Unternehmen (6. Aufl., Oldenbourg, 2013) - ISBN 9783486717686.pdf` (Ist-Analyse, Modellierung)
- `Alpar et al. - Anwendungsorientierte Wirtschaftsinformatik (9. Aufl., Springer Vieweg, 2019) - ISBN 9783658255800.pdf` (Prozesse und Informationssysteme)
- `Portmann (Hrsg.) - Wirtschaftsinformatik in Theorie und Praxis (Springer Vieweg, 2017) - ISBN 9783658176129.pdf` (Praxisbeispiele)

Repetition Grundbildung: Module 254, 230, 348, 349, 367 (siehe [resources.md](../resources.md)).

### Aus deiner Bibliothek (Calibre)

- Hans-Erik Eriksson: Business Modeling With UML (vor BPMN 2.0, Notation abweichend)
- Microsoft: Cross Industry Process Classification (Prozesslandkarte)
- Odoo 17 Scale Up! The Business Game (ERP-Prozesse durchspielen)

BPMN 2.0 fehlt in der Bibliothek. Details: [resources.md](../resources.md#eigene-bibliothek-calibre)

## Übungen und Fallstudien

- [ ] **RE-Übung 2:** [Chargenrückverfolgbarkeit](../../../exercises/requirements-engineering/batch-traceability/) – den Rückrufprozess als Ist- und Soll-BPMN modellieren (d1, d3)
- [ ] **RE-Kurs:** [Systemkontext](../../requirements-engineering/course/02-system-context/) und [Ermittlungstechniken](../../requirements-engineering/course/03-elicitation-techniques/) für Scope und Ist-Aufnahme
- [ ] **Labor:** Einen Beschaffungsprozess (Bestellung bis Zahlung) in [ERPNext](../../erp/erpnext-docker/) durchspielen und Medienbrüche identifizieren (d1, d3)
- [ ] **Mini-Case d1:** Ist-Prozess aus einer Fallbeschreibung modellieren und 5 Schwachstellen benennen. *Platzhalter*
- [ ] **Mini-Case d2:** 5-Minuten-Präsentation der Analyse für die Geschäftsleitung (3 Folien). *Platzhalter*
- [ ] **Mini-Case d3:** Zwei Soll-Varianten mit Nutzwertanalyse vergleichen und Wirkungs-KPI festlegen. *Platzhalter*

## Selbstcheck

1. Wie unterscheiden sich Kern- und Unterstützungsprozesse? Nenne je zwei Beispiele aus deinem Umfeld.
2. Wann nutzt du ein exklusives und wann ein paralleles Gateway in BPMN?
3. Nenne fünf typische Schwachstellen in Prozessen und je eine Massnahme.
4. Wie plausibilisierst du erhobene Prozessdaten?
5. Mit welchen KPI belegst du die Wirkung einer Optimierung?
6. Wie passt du die Präsentation für Geschäftsleitung vs. Sachbearbeitende an?

## Unterstützende Kurse (Digicomp)

Optional, siehe [digicomp-courses.md](../digicomp-courses.md) und [preparation-courses.md](../preparation-courses.md):

- BPMN 2.0 (PZ1): d1, d3

## Fortschritts-Checkliste

- [ ] d1 Prozessanalyse (Methoden, Daten, Visualisierung)
- [ ] d2 Ergebnisse präsentieren
- [ ] d3 Modellieren, optimieren, Wirkung messen
- [ ] BPMN 2.0 sicher (mind. 3 Modelle erstellt)
- [ ] Mini-Cases gelöst
