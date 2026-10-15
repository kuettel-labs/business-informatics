# Geführte Parametrisierung im Detail

[Zurück zur Übersicht](README.md) · [Geführte Parametrisierung](gefuehrte-parametrisierung.md) · [Parameterregister](parameterregister.md) · [Change Control](change-control.md) · [Risikobeurteilung](risikobeurteilung.md)

## Ziel und Einordnung
Lernende mit ERP-Hintergrund vertiefen hier das Konzept der geführten Parametrisierung und das Golden-Config-Muster in D365 F/SCM.

- **Kernkompetenzen:** c3, c4, e1, e2, e3, e4
- **Sekundäre Kompetenzen:** b4, b5, c2, d3

> Die Zuordnung ist eine eigene Interpretation; die offiziellen Dokumente nennen D365 nicht. Massgebend ist das Qualifikationsprofil.

## Lernziele
Nach dieser Seite können Lernende:
1. Konfigurations-, Stamm- und Bewegungsdaten **unterscheiden** und dem richtigen Transportweg **zuordnen**. *(c3, e2)*
2. den Umgebungspfad Dev → Golden Config → Test/UAT → Prod **beschreiben**. *(c4, e1)*
3. die Golden-Config-Checkliste auf ein Fallbeispiel **anwenden**. *(e1, e4)*
4. zwischen Cross-company data sharing und «Copy into legal entity» **entscheiden** und den Entscheid **begründen**. *(e2, d3)*
5. Anti-Patterns in einer bestehenden Umgebung **erkennen**. *(e3)*

## Geschäftsnutzen
Typische Risiken ohne geführte Parametrisierung (keine gemessenen Werte):
- Prod und Testumgebungen driften auseinander, deshalb sind Testergebnisse nicht mehr aussagekräftig.
- Neue Gesellschaften werden uneinheitlich aufgesetzt.
- Ein Feature wird ungeplant aktiviert und verändert Prozesse.
- Die Revision kann die Konfiguration nicht nachvollziehen.

Typischer Nutzen (keine gemessenen Werte):
- Neue Gesellschaften und Umgebungen lassen sich aus dem Paket schneller und wiederholbar aufbauen.
- Testergebnisse bleiben aussagekräftig, weil Test und Prod übereinstimmen.

**Kosten:** Betrieb einer eigenen Golden-Config-Umgebung (Umgebungskosten), Pflege der Vorlagen und regelmässige Drift-Prüfungen. **Faustregel:** Es lohnt sich bei mehreren Gesellschaften, häufigen Releases oder IKS-/Revisionsanforderungen (siehe [Kosten und Nutzen](README.md#kosten-und-nutzen-bezug-b4b5-fallstudie) in der Übersicht).

### Product-Owner- und Prozess-Owner-Perspektive
- Die Golden Config ist ein Produkt mit einem Owner.
- Ihre Pflege hat ein eigenes Backlog.
- Eine Feature-Aktivierung wird als Backlog-Item mit Begründung des Geschäftswerts geplant.
- «Testimport erfolgreich» gehört in die Definition of Done des Releases.

## Prinzipien
1. **Single Source of Truth:** Die Golden Config ist die Referenz für alle Parameter.
2. **Pakete:** Änderungen werden nur als versionierte Datenpakete ausgeliefert.
3. **Freigaben:** Jede Änderung hat einen Owner, eine Begründung und eine Freigabe (siehe [Change Control](change-control.md)).
4. **Funktionstrennung (SoD):** Wer umsetzt, gibt nicht frei. Nur eine eng definierte Rolle darf Parameter in Prod pflegen.
5. **Audit:** Database Log, [Parameterregister](parameterregister.md) und regelmässige Drift-Prüfung.

## Datenarten
| Art | Beispiele | Wo gepflegt | Wie transportiert |
|---|---|---|---|
| Konfigurationsdaten (Parameter, Referenzdaten) | Modulparameter, Buchungsprofile, Nummernkreise, Zahlungsbedingungen | Golden Config | Konfigurationsvorlagen / Datenpakete |
| Stammdaten | Debitoren, Kreditoren, Produkte | Prod (bei der Einführung als Migration) | Migration, danach laufende Pflege in Prod |
| Bewegungsdaten | Aufträge, Rechnungen, Buchungen | nur Prod | nicht transportiert (Migration nur als offene Posten / Salden) |

## Golden-Config-Muster
- Eine nicht-produktive Umgebung enthält ausschliesslich freigegebene Konfiguration, ohne Testbewegungen.
- Exportiert wird mit Konfigurationsvorlagen in der richtigen Reihenfolge (Unit, Level, Sequence). Die Microsoft-Vorlagen beginnen mit Systemsetup und gemeinsamen Daten, danach folgen die modulspezifischen Daten (nicht verifiziert).
- Neue Umgebungen und Gesellschaften werden aus diesem Paket aufgebaut, entweder per Import oder mit «Copy into legal entity».
- Das Laden lässt sich mit Data task automation wiederholbar machen; die Seite behandelt auch Funktionstrennung. Getrennte Manifeste für Demodaten und Golden Config (nicht verifiziert).

## Umgebungspfad
Dev → Golden Config → Test/UAT → Prod
- Änderungen entstehen in der Golden Config, oder in Dev mit anschliessender Übernahme in die Golden Config.
- Getestet wird in Test/UAT mit RSAT.
- Nach Prod geht nur das freigegebene Paket.

## Mehrere Gesellschaften
- **Cross-company data sharing** für Referenzdaten. Grenzen gemäss Microsoft Learn (nicht verifiziert, gegen die Learn-Seite zu prüfen):
  - keine Transaktionsdaten,
  - keine Felder mit Finanzdimensionen,
  - höchstens 2 Mio. Datensätze pro Job und 300 Gesellschaften pro Policy (ab 10.0.10),
  - nicht mit Dual-write kombinierbar.
- **Copy into legal entity** für das einmalige Kopieren der Konfiguration einer Gesellschaft. Nummernkreise können dabei mitkopiert werden (nicht verifiziert).

## Feature Management (eigene Praxisempfehlung, nicht aus Microsoft Learn abgeleitet)
- Features werden als Teil des Releases geplant, zuerst in Test aktiviert und im Register dokumentiert.
- Die Aktivierung in Prod ist ein eigener Change.

## Anti-Patterns
- Parameter direkt in Prod ändern («nur schnell»). *Wert:* kein Audit-Trail, Risiko von Fehlbuchungen.
- Golden Config mit Testbewegungen «verschmutzen». *Wert:* Neue Umgebungen erben Testdaten; die Referenz ist nicht mehr sauber.
- Datenbank-Kopie von Prod als Golden Config verwenden, ohne Bereinigung. *Wert:* Testtransaktionen und Personendaten gelangen in die Referenzumgebung (Datenschutz; eigene Einschätzung).
- Pakete ohne Version oder Begründung. *Wert:* Kein Rollback auf einen bekannten Stand und keine Nachvollziehbarkeit für die Revision.
- Database Log auf ganzen Tabellen mit hohem Volumen statt auf ausgewählten Feldern (Performance, nicht verifiziert). *Wert:* langsameres System und schwer auswertbare Protokolle.
- Dieselbe Rolle setzt um und gibt frei. *Wert:* Verstoss gegen die Funktionstrennung, IKS-Feststellung in der Revision.

## Vorlage: Golden-Config-Checkliste
- [ ] Umgebung ist als Golden Config bezeichnet; Zugriff ist auf die Konfigurationsrolle beschränkt.
- [ ] Keine Bewegungsdaten vorhanden.
- [ ] Konfigurationsvorlagen sind pro Modul definiert und sequenziert.
- [ ] Letztes Paket ist exportiert, versioniert und abgelegt.
- [ ] Register stimmt mit der Golden Config überein (Drift-Prüfung durchgeführt).
- [ ] Database Log ist auf den kritischen Setup-Tabellen aktiv.
- [ ] Feature-Status ist dokumentiert.
- [ ] Import in eine leere Testumgebung erfolgreich getestet.

## Vorlage: Paketbenennung und Versionierung
`PKG-<Bereich>-<LE|SHARED>-<Major>.<Minor>.<Patch>`

- **Bereich:** z. B. SYS, GL, AP, AR, INV.
- **Major:** neue Struktur oder neue Gesellschaft.
- **Minor:** fachliche Parameteränderung.
- **Patch:** Korrektur.

Beispiel (fiktiv): `PKG-AP-CH01-1.3.0`. Jede Version verweist auf die Change-ID(s).

## KPI (Platzhalter)
| KPI | Messung | Quelle | Ziel |
|---|---|---|---|
| Prod-Änderungen ausserhalb eines Pakets | Anzahl pro Monat | Database Log | 0 |
| Drift-Befunde | Abweichungen pro Monatsprüfung | Exportvergleich | [festzulegen] |
| Erfolgreiche Testimporte des Golden-Config-Pakets | Quote | Execution summary (Data management) (nicht verifiziert) | [festzulegen] |
| Aufbauzeit neue Gesellschaft/Umgebung aus Golden-Config-Paket | Tage | Projektplan / Release-Protokoll | [festzulegen] |
| Abweichungen Test vs. Prod vor Release | Anzahl | Exportvergleich | [festzulegen] |

## Übungen
- **Ü1 (c3, c4, ca. 30 Min.):** 10 fiktive oder anonymisierte Datensätze den drei Datenarten zuordnen.
  *Erwartetes Ergebnis:* eine Tabelle mit Begründung und Transportweg.
- **Ü2 (e1, e4, ca. 45 Min.):** Die Golden-Config-Checkliste und das Benennungsschema auf ein fiktives Unternehmen mit drei Gesellschaften anwenden.
  *Erwartetes Ergebnis:* eine angepasste Checkliste und fünf Paketnamen.
- **Ü3 (e2, d3, ca. 30 Min.):** Entscheiden, welche Daten über Cross-company sharing laufen und welche über «Copy into legal entity».
  *Erwartetes Ergebnis:* ein Entscheid mit Begründung entlang der Grenzen (Grenzen gemäss Learn-Seite prüfen).

## Selbstcheck
1. Welche drei Datenarten gibt es, und welche wird über die Golden Config transportiert?
2. Nenne drei Anti-Patterns.
3. Was kann Cross-company data sharing nicht?
4. Warum ist die Feature-Aktivierung in Prod ein eigener Change?
5. Wo entstehen Parameteränderungen, und wo werden sie getestet?

<details><summary>Lösungen</summary>

1. Konfigurationsdaten, Stammdaten und Bewegungsdaten. Über die Golden Config laufen die Konfigurationsdaten.
2. Zum Beispiel: Änderungen direkt in Prod, eine Golden Config mit Bewegungen, Pakete ohne Version.
3. Keine Transaktionsdaten, keine Finanzdimensionen, kein Dual-write; es gibt Mengengrenzen (nicht verifiziert).
4. Weil sie Prozesse verändert und deshalb Test, Freigabe und Register-Eintrag braucht.
5. In der Golden Config (oder in Dev mit Übernahme in die Golden Config); getestet wird in Test/UAT mit RSAT.
</details>

## Quellen
- [Configuration data templates](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/configuration-data-templates)
- [Copy configuration data between companies or legal entities overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/copy-configuration)
- [Data task automation](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/data-entities/data-task-automation)
- [Cross-company data sharing](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/sysadmin/cross-company-data-sharing)
- [Feature management overview](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/fin-ops/get-started/feature-management/feature-management-overview)
- [Configure database logging](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/sysadmin/configure-manage-database-log)
- [Role-based security](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/sysadmin/role-based-security)
- [Manage your data in Dynamics 365 implementation projects](https://learn.microsoft.com/en-us/dynamics365/guidance/implementation-guide/data-management)
- [ITIL (Axelos)](https://www.axelos.com/certifications/itil-service-management) (nicht verifiziert); Practice «Change Enablement» im Detail nicht verifiziert.
- [COBIT (ISACA)](https://www.isaca.org/resources/cobit) (nicht verifiziert); BAI06 im Detail nicht verifiziert.
- [ISO/IEC 27001:2022](https://www.iso.org/standard/27001) (nicht verifiziert); Annex-A-Controls zu Change Management nicht verifiziert (kostenpflichtig).
- Umgebungsstrategie-/ALM-Kapitel Success by Design: nicht verifiziert (kein Link).
- Die Anti-Patterns, das Benennungsschema und die Feature-Management-Regeln sind eigene Praxisempfehlungen und keine Microsoft-Vorgaben.

## Literatur
Seitenzahlen gemäss Inhaltsverzeichnis, nicht geprüft.
- Mohta, Yadav, Shukla: *Implementing Microsoft Dynamics 365 for Finance and Operations Apps*, 2. Aufl., 2020.
  - Kap. 4 «Architecture, Deployment, and Environments» (S. 104)
  - Kap. 6 «Configuration and Data Management» (S. 186), darin «The golden configuration environment» (S. 188) und «Configuration data templates» (S. 202)
- Luszczak: *Using Microsoft Dynamics 365 for Finance and Operations*, 2023. Kap. 10 (S. 443), Feature Management (S. 475).
- Dawson: *Becoming a Dynamics 365 Finance and Supply Chain Solution Architect*, 2023. «Planning for Successful Data Migration» (S. 77), «Segregation of duties» (S. 59).
- Leimeister: *Einführung in die Wirtschaftsinformatik*, 14. Aufl., 2025. Kap. 3.1 «Data Governance» (S. 133).
- Newell: *Mastering Microsoft Dynamics 365 Implementations*, 2021. Seitenzahlen nicht ermittelt.
