# Kasse v3 – test note (reference build, Odoo 20.0+e Online, 11 Oct 2026, ~07:20–07:50 Europe/Zurich)

All tests run through the UI on the reference instance; test records were removed afterwards, demo data recreated.

| Fix / rule | Test | Result |
|---|---|---|
| Single sale form (fix 1) | Open a sale from the Verkäufe list | One sheet, one chatter – pass |
| Labels / Currency (fix 2) | Session form header, all forms and embedded lists | Header "Summen", Currency hidden – pass |
| Rule 8 + rule 2 VAT check (fix 3) | Set an article's MWST-Satz to 7.7 and save | Error "MWST-Satz muss 8.1, 3.8, 2.6 oder 0 % sein", not saved – pass |
| Thousands separator (fix 4) | Session with Anfangsbestand 1234.5, print Kassenabschluss | Form and PDF show 1'234.50 – pass |
| Rules 4/5 cash check (fix 5) | Cash sale 1x Kaffee (4.50), Erhalten 3 | Warning while typing, save blocked; with Erhalten 5 saved, Rückgeld 0.50 – pass |
| Rule 6 + read-only (fix 6) | Close session, then reopen | Ende filled and fields read-only (Status editable); reopen clears Ende – pass |
| Rule 7 removed (fix 7) | Automations list | Rule 7 absent, rule 8 active, 7 rules total – pass |
| Company logo | Print Quittung and Kassenabschluss | Logo shown in place of placeholder – pass |
| Regression: demo data | Demo session, 5 sales (3 cash, 2 card) | Totals 11.20/11.00/104.00/10.90/34.90; Soll bar 257.00, Kartentotal 115.00, Differenz 0.00; VAT 8.1 % 3.01 / 3.8 % 3.48 / 2.6 % 0.42 – pass |
| Regression: v2 rounding / archive / cron | Tested 11 Oct ~00:20–00:45: 4.53 → Zu bezahlen 4.55, Rundung 0.02; archive updates session immediately; manual cron run fixes session after delete | pass |
