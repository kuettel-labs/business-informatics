# Parameterregister und Dokumentation

[Zurück zur Übersicht](README.md) · [Geführte Parametrisierung](gefuehrte-parametrisierung.md) · [Parameterregister](parameterregister.md) · [Change Control](change-control.md) · [Risikobeurteilung](risikobeurteilung.md)

## Ziel und Einordnung
Das Parameterregister hält fest, welche Einstellung welchen Wert hat, wer dafür verantwortlich ist, warum sie geändert wurde und wie die Änderung geprüft wurde.

- **Kernkompetenzen:** c3, e2, e3
- **Sekundäre Kompetenzen:** c4, e1, e4, d3

> Die Zuordnung ist eine eigene Interpretation; die offiziellen Dokumente nennen D365 nicht. Massgebend ist das Qualifikationsprofil.

## Geschäftsnutzen
Typische Risiken ohne Register (keine gemessenen Werte):
- Die Revision kann eine Änderung nicht nachvollziehen, was zu einer Feststellung führt.
- Fehlerursachen nach einem Release lassen sich nicht finden.
- Wissen ist an Personen gebunden; fallen sie aus, fehlt es.
- Drift zwischen Golden Config und Prod bleibt unentdeckt.

## Pflichtfelder
| Feld | Bedeutung |
|---|---|
| Parameter/Tabelle | Name der Einstellung bzw. der Tabelle oder Entität |
| Modul | z. B. Hauptbuch, Kreditoren, Lager |
| Legal Entity | betroffene Gesellschaft(en) oder «shared» |
| Wert alt / Wert neu | Werte vor und nach der Änderung |
| Owner / Prozessverantwortliche | fachlich zuständige Rolle |
| Begründung | geschäftlicher Grund für die Änderung |
| Change-ID | Verweis auf das Backlog-Item bzw. den Change Request |
| Datum | Datum der Wirksamkeit in Prod |
| Freigabe | Rolle, die freigegeben hat |
| Paket/Version | Datenpaket bzw. Release-Version |
| Test-Nachweis | Testfall, RSAT-Lauf oder Protokoll |

## Vorlage (Markdown)
| Parameter/Tabelle | Modul | Legal Entity | Wert alt | Wert neu | Owner | Begründung | Change-ID | Datum | Freigabe | Paket/Version | Test-Nachweis |
|---|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | | |

## Vorlage (CSV-Kopfzeile)
```csv
Parameter_Tabelle;Modul;Legal_Entity;Wert_alt;Wert_neu;Owner;Begruendung;Change_ID;Datum;Freigabe;Paket_Version;Test_Nachweis
```

## Beispiele (fiktiv)
| Parameter/Tabelle | Modul | Legal Entity | Wert alt | Wert neu | Owner | Begründung | Change-ID | Datum | Freigabe | Paket/Version | Test-Nachweis |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Kreditoren-Buchungsprofil «GEN», Sammelkonto | Kreditoren | CH01 | 2000 | 2010 | Leitung Kreditoren | Trennung Inland/Ausland | CHG-0001 | TT.MM.JJJJ | Leitung Finanzen | PKG-AP-CH01-1.3.0 | RSAT TC-AP-04 grün |
| Nummernkreis Kreditorenrechnungen | Organisation | CH01 | fortlaufend = Nein | fortlaufend = Ja | Leitung Rechnungswesen | Lückenlose Nummerierung (IKS) | CHG-0002 | TT.MM.JJJJ | Leitung Finanzen | PKG-SYS-SHARED-2.0.0 | Testprotokoll T-17 |
| Feature-Flag (Feature management) | System | alle | deaktiviert | aktiviert | Applikationsverantwortliche | Neue Funktion für Release | CHG-0003 | TT.MM.JJJJ | Change Advisory Board | Release R-5 | RSAT-Suite Regression grün |

> Releases (z. B. R-5) werden getrennt von den Paketen benannt; ein Release kann mehrere Pakete nach dem Schema `PKG-<Bereich>-<LE|SHARED>-<Major>.<Minor>.<Patch>` umfassen.

## Synchronhalten
- **Database Log:** auf den kritischen Setup-Tabellen einschalten und monatlich mit dem Register abgleichen. Jede geloggte Änderung braucht eine Change-ID.
- **Drift-Prüfung:** die Konfiguration aus Prod und aus der Golden Config als Datenpaket exportieren und vergleichen. Jede Abweichung ist entweder eine Change-ID oder ein Befund.
- **Konsistenzprüfung:** Die Database-Log-Konsistenzprüfung stellt sicher, dass die Logging-Trigger aktiv sind.

## Dokumentationsstandards
- Ein Register pro Umgebungslandschaft, versioniert (z. B. in einem Wiki oder Repository).
- Pflichtfelder sind nie leer; fehlt eine Information, wird «n/a» mit Begründung eingetragen.
- Werte werden exakt so eingetragen, wie sie im System erscheinen.
- Einträge werden nur ergänzt, nicht überschrieben. So bleibt die Historie erhalten.
- Ein Review pro Quartal durch den Owner.

## KPI (Platzhalter)
| KPI | Messung | Quelle | Ziel |
|---|---|---|---|
| Register-Abdeckung | geloggte Änderungen mit Change-ID / alle geloggten Änderungen | Database Log, Register | [festzulegen] |
| Unvollständige Einträge | Anzahl Einträge mit leeren Pflichtfeldern | Register | [festzulegen] |
| Drift-Befunde | Abweichungen pro Monatsprüfung | Exportvergleich | [festzulegen] |

## Übungen
- **Ü1 (e2, e3, ca. 30 Min.):** Das Register mit 5 eigenen Einträgen (fiktiv) füllen.
  *Erwartetes Ergebnis:* Alle Pflichtfelder sind ausgefüllt, und jeder Eintrag ist einer Change-ID zugeordnet.
- **Ü2 (e2, c3, ca. 45 Min.):** Einen Ablauf für den monatlichen Abgleich von Database Log und Register beschreiben.
  *Erwartetes Ergebnis:* ein Ablauf mit Rollen, Frequenz, Schwellenwert und Eskalation.

## Selbstcheck
1. Welche Pflichtfelder machen eine Änderung revisionssicher?
2. Wie wird Drift erkannt?
3. Warum werden Einträge nicht überschrieben?

<details><summary>Lösungen</summary>

1. Change-ID, Freigabe, Wert alt/neu, Datum und Test-Nachweis.
2. Durch den Exportvergleich zwischen Prod und Golden Config sowie den Abgleich von Database Log und Register.
3. Damit die Historie und der Audit-Trail erhalten bleiben.
</details>

## Quellen
- [Configure database logging](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/sysadmin/configure-manage-database-log)
- [Data management overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities-data-packages)
- [Feature management overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/fin-ops/get-started/feature-management/feature-management-overview)
- [Number sequences overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/fin-ops/organization-administration/number-sequence-overview)
- [ITIL (Axelos, Übersicht ITIL 4 inkl. Change Enablement)](https://www.axelos.com/certifications/itil-service-management): Seite verifiziert; eine eigene Seite zur Practice «Change Enablement» ist nicht verifiziert.
- [COBIT (ISACA)](https://www.isaca.org/resources/cobit): Seite verifiziert; eine Seite speziell zu BAI06 «Managed IT Changes» ist nicht verifiziert.
- [ISO/IEC 27001:2022](https://www.iso.org/standard/27001): Seite verifiziert; der Inhalt der Controls zu Change Management (Annex A) ist kostenpflichtig, daher nicht verifiziert.

## Literatur
Seitenzahlen gemäss Inhaltsverzeichnis, nicht geprüft.
- Mohta, Yadav, Shukla: *Implementing Microsoft Dynamics 365 for Finance and Operations Apps*, 2. Aufl., 2020. Kap. 6 «Configuration and Data Management» (S. 186).
- Leimeister: *Einführung in die Wirtschaftsinformatik*, 14. Aufl., 2025. Kap. 3.1 «Data Governance» (S. 133).
- Luszczak: *Using Microsoft Dynamics 365 for Finance and Operations*, 2023. Number Sequences (S. 459), Feature Management (S. 475).
