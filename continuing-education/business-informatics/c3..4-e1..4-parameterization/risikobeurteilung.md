# Risikobeurteilung für Parameteränderungen

[Zurück zur Übersicht](README.md) · [Geführte Parametrisierung](gefuehrte-parametrisierung.md) · [Parameterregister](parameterregister.md) · [Change Control](change-control.md) · [Risikobeurteilung](risikobeurteilung.md)

## Ziel und Einordnung
Mit einer einheitlichen Risikobeurteilung wird jede Parameteränderung einer Risikoklasse zugeordnet. Die Klasse bestimmt, welche Kontrollen nötig sind.

- **Kernkompetenzen:** e1, e3, e4
- **Sekundäre Kompetenzen:** b5, c2, c4

> Die Zuordnung ist eine eigene Interpretation; die offiziellen Dokumente nennen D365 nicht. Massgebend ist das Qualifikationsprofil.

## Geschäftsnutzen
Typische Risiken ohne Risikobeurteilung (keine gemessenen Werte):
- Kritische Änderungen laufen mit zu wenig Test.
- Triviale Änderungen werden durch unnötige Freigaben verzögert.
- IKS-relevante Änderungen werden nicht als solche erkannt.

## Kriterien
| Kriterium | Niedrig (1) | Mittel (2) | Hoch (3) |
|---|---|---|---|
| Finanzielle Auswirkung | keine Buchungswirkung | indirekte Wirkung | direkte Buchungs- oder Bewertungswirkung |
| Umfang Legal Entities | eine | mehrere | alle / shared |
| Reversibilität | sofort umkehrbar | umkehrbar mit Aufwand | nicht oder nur mit Datenkorrektur umkehrbar |
| Compliance / IKS | nicht betroffen | indirekt | Schlüsselkontrolle betroffen |
| Prozesskritikalität | Randprozess | Kernprozess | Monatsabschluss, Zahlungen, Lieferung |
| Testabdeckung | RSAT-Fälle vorhanden | teilweise | keine |

## Bewertungsmatrix (Wahrscheinlichkeit x Auswirkung)
- **Auswirkung:** Maximum aus finanzieller Auswirkung, Umfang, Compliance und Prozesskritikalität.
- **Wahrscheinlichkeit:** abgeleitet aus Reversibilität, Testabdeckung und Komplexität.

| Wahrscheinlichkeit \ Auswirkung | 1 niedrig | 2 mittel | 3 hoch |
|---|---|---|---|
| 3 hoch | mittel | hoch | hoch |
| 2 mittel | niedrig | mittel | hoch |
| 1 niedrig | niedrig | niedrig | mittel |

Die Schwellenwerte sind eine Vorlage und für die eigene Organisation festzulegen.

## Risikoklasse und Kontrollen
| Risiko | Change-Typ | Freigabe | Testtiefe |
|---|---|---|---|
| niedrig, vorab definiert | Standard Change | vorab genehmigt, Prozess-Owner informiert | Smoke-Test |
| mittel / hoch | Normal Change | Prozess-Owner; bei hohem Risiko zusätzlich CAB | betroffene Testfälle plus RSAT-Regression; bei hohem Risiko volle Regression |
| dringend (Störung) | Notfall-Change | Notfall-CAB, mindestens zwei Rollen | minimaler Test, nachträgliche Dokumentation und Review |

## Beispiele (fiktiv)
**1. Niedriges Risiko:** Ein Beschreibungstext eines Lieferbedingungscodes wird in einer Gesellschaft angepasst.
- Bewertung: Auswirkung 1, Wahrscheinlichkeit 1, also niedrig.
- Change-Typ: Standard Change mit Smoke-Test.

**2. Hohes Risiko:** Das Sammelkonto im Kreditoren-Buchungsprofil wird für alle Auslandkreditoren geändert.
- Bewertung: Auswirkung 3 (direkte Buchungswirkung, IKS), Wahrscheinlichkeit 2 (umkehrbar mit Aufwand), also hoch.
- Change-Typ: Normal Change mit CAB und voller RSAT-Regression.
- Siehe [Change Control, Beispiel](change-control.md).

## KPI (Platzhalter)
| KPI | Messung | Quelle | Ziel |
|---|---|---|---|
| Anteil Changes mit dokumentierter Risikoklasse | Quote | Backlog | [festzulegen] |
| Notfall-Changes | Anzahl pro Quartal | Change-Log | [festzulegen] |
| Incidents nach als «niedrig» eingestuften Changes | Anzahl | Incident-Tool | [festzulegen] |

## Übungen
- **Ü1 (e3, b5, ca. 30 Min.):** Drei fiktive Änderungen mit Kriterien und Matrix bewerten.
  *Erwartetes Ergebnis:* drei Bewertungen mit begründeter Risikoklasse und abgeleitetem Change-Typ.
- **Ü2 (e1, e4, ca. 30 Min.):** Einen Katalog von Standard Changes (mindestens 5) für ein Modul definieren.
  *Erwartetes Ergebnis:* eine Liste mit Begründung, warum das Risiko jeweils niedrig ist.

## Selbstcheck
1. Welche Kriterien bestimmen die Auswirkung?
2. Was unterscheidet einen Standard Change von einem Normal Change?
3. Was ist nach einem Notfall-Change zwingend?

<details><summary>Lösungen</summary>

1. Finanzielle Auswirkung, Umfang der Legal Entities, Compliance/IKS und Prozesskritikalität.
2. Ein Standard Change ist vorab genehmigt und risikoarm; ein Normal Change wird einzeln beurteilt und freigegeben.
3. Nachträgliche Dokumentation, ein Review und ein Eintrag im Register.
</details>

## Quellen
- [Test your Dynamics 365 solution before deployment (Implementation Guide)](https://learn.microsoft.com/en-us/dynamics365/guidance/implementation-guide/testing-strategy)
- [Security capabilities for finance and operations apps](https://learn.microsoft.com/en-us/dynamics365/guidance/implementation-guide/security-strategy-product-oa)
- [Regression suite automation tool (RSAT)](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/perf-test/rsat/rsat-overview)
- [ITIL (Axelos, Übersicht ITIL 4 inkl. Change Enablement)](https://www.axelos.com/certifications/itil-service-management): Seite verifiziert; eine eigene Seite zur Practice «Change Enablement» ist nicht verifiziert.
- [COBIT (ISACA)](https://www.isaca.org/resources/cobit): Seite verifiziert; eine Seite speziell zu BAI06 «Managed IT Changes» ist nicht verifiziert.
- [ISO/IEC 27001:2022](https://www.iso.org/standard/27001): Seite verifiziert; der Inhalt der Controls zu Change Management (Annex A) ist kostenpflichtig, daher nicht verifiziert.
- Die Begriffe Standard Change, Normal Change und Notfall-Change sind an ITIL angelehnt; die Definitionen im Originaltext sind nicht verifiziert.

## Literatur
Seitenzahlen gemäss Inhaltsverzeichnis, nicht geprüft.
- Heuermann: *Strategisches IT-Management*, 2014. Kap. 4.2 «IT-Governance und Compliance» (S. 108), Kap. 8.4 «Kritische IT-Prozesse nach COBIT» (S. 310).
- Dawson: *Becoming a Dynamics 365 Finance and Supply Chain Solution Architect*, 2023. «Segregation of duties» (S. 59), «Change boards» (S. 124).
- Leimeister: *Einführung in die Wirtschaftsinformatik*, 14. Aufl., 2025. Kap. 3.1 «Data Governance» (S. 133).
- Mohta, Yadav, Shukla: *Implementing Microsoft Dynamics 365 for Finance and Operations Apps*, 2. Aufl., 2020. «Change management» (S. 433).
