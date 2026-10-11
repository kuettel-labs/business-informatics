# Kasse – Rebuild Prompt / Specification (Odoo Studio cash register)

Version: v3 (see [Change log](#13-change-log)). Items marked **(v3)** were applied but are not yet confirmed by testing.

This document is self-contained. An agent or a person can follow it step by step to recreate the "Kasse" app on a fresh Odoo Online instance that has Studio. All code is included inline and also as separate files in this folder:

| File | Content |
|---|---|
| `automations/rule1.py` … `rule6.py`, `rule8.py` | Automation rule code (Execute Code) |
| `automations/rule7_REMOVED.md` | Note on the removed on-delete rule |
| `automations/backfill_optional.py` | Optional one-off backfill (only for pre-existing records) |
| `cron_recompute.py` | Scheduled action "Kasse: Sitzungen nachrechnen" |
| `reports/quittung.xml`, `reports/kassenabschluss.xml` | QWeb content for inside `<div class="page">` |
| `demo/kassenartikel.csv` | 12 demo articles (Name, Kategorie, Preis, MWST-Satz, Menge, Einheit) |

Placeholders: `<INSTANCE_URL>` (the base URL of the target Odoo Online database), `<COMPANY_NAME>`, `<CASHIER_USER>` (the Odoo user who acts as cashier), `<LOGO_FILE>` (the company logo as a PNG file).

---

## 1. Overview and scope

"Kasse" is a standalone Odoo Studio app that works as a simple cash register for `<COMPANY_NAME>`:

- Article master (**Kassenartikel**) with VAT-inclusive CHF prices, Swiss VAT rate, quantity and unit.
- Cashier sessions (**Kassensitzungen**) with opening float, a coin/note count table (5 Rp. to CHF 200) and a closing summary (Soll bar, Ist bar, Differenz, Kartentotal, VAT per rate).
- Sales (**Verkäufe**) with line items, cash payment with 5-Rp. rounding and change calculation, or card payment as a manual entry with an optional reference.
- PDF reports: **Quittung** (receipt per sale) and **Kassenabschluss** (closing report per session).
- All calculations are Studio automation rules (base_automation) with Python "Execute Code" actions, plus one scheduled action as a safety net.

UI labels are German (as they appear in the app); this document is English.

Out of scope / disclaimers:
- **Not a certified fiscal register.** No legal fiscal compliance is implied.
- **Not a touchscreen POS.** It uses normal Studio list/form views.
- **Receipts are PDF only.** No thermal/receipt printer, no cash drawer, no stock management, no accounting integration.

## 2. Prerequisites

- Odoo **20.0+e (Enterprise)** on **Odoo Online (SaaS)** with **Studio** installed. URL: `<INSTANCE_URL>`.
- One company, `<COMPANY_NAME>`, country Switzerland, currency **CHF**.
- **Install no other apps** (no Point of Sale, Sales, Inventory, Accounting, …). Start no trials, enable no paid options. If Studio prompts for an install or upgrade, stop and ask the owner.
- If Settings shows a **"Load demo data"** prompt, decline it.
- **Developer mode** on (`<INSTANCE_URL>/odoo?debug=1`) to see technical field names, edit report XML and manage scheduled actions.
- User language **German** (Settings > Languages: activate German, set it for `<CASHIER_USER>` in Preferences).
- **Swiss number format:** Settings > Translations/Languages > German > Decimal separator `.`, Thousands separator `'` → numbers show as `11.20` and `1'257.00`.
- Company logo: `<LOGO_FILE>` (PNG; use a black-and-white variant if receipts are printed in black and white), uploaded in build step 2. Until a logo is set, the reports show the default "Your logo" placeholder. **(v3)**

## 3. Build order

Studio auto-generates technical names. **After creating each field, look up its real technical name (developer mode: hover the field, or Settings > Technical > Fields) and adapt every code snippet and report below if it differs.** The names in this document are those generated on the reference build.

1. **Settings:** German language active, Swiss number format (section 2).
2. **Company logo:** Settings > Companies > open `<COMPANY_NAME>` > upload `<LOGO_FILE>` (PNG; use a black-and-white variant if receipts are printed in black and white) as the company logo, save. The External report layout then shows it on the Quittung and Kassenabschluss in place of the "Your logo" placeholder. **(v3)**
3. **Create the app** in Studio: Studio > New app, name **"Kasse"**, first model **Kassenartikel** (`x_kassenartikel`). Enable the archive option (Aktiv / `x_active`).
4. **Kassenartikel fields** (table 4.1). Hide the auto-added Currency field.
5. **Import demo articles** from `demo/kassenartikel.csv` (section 9.1).
6. **Model Kassensitzung** (`x_kassensitzung`) as a new menu "Kassensitzungen" in the Kasse app; create its fields (table 4.2), including the one2many line model for Zählung (`x_kassensitzung_line_86aa0`, table 4.3).
7. **Model Verkauf** (`x_verkauf`) as a new menu "Verkäufe"; create its fields (table 4.4) including the Positionen line model (`x_verkauf_line_4cb26`, table 4.5); enable archiving (`x_active`) on Verkauf. Then add the one2many **Verkäufe** (`x_studio_verkaufe`, inverse `x_studio_sitzung`) on Kassensitzung.
8. **Views:** paste the full form/list XML per model in Studio's XML editor (section 5). Do not drag-and-drop field by field (see gotchas).
9. **Automation rules 1–6 and 8** (section 6). Verify field names in the code first.
10. **Scheduled action** "Kasse: Sitzungen nachrechnen" (section 7).
11. **Create at least one saved record** in Verkauf and Kassensitzung (reports need one), then **reports** Quittung and Kassenabschluss (section 8).
12. **Demo session with 5 sales** (section 9.2).
13. **Verification checklist** (section 10).

## 4. Models and fields

Studio naming notes. Studio generates names itself, so on a fresh instance it may produce other suffixes: always check the generated names in developer mode and adapt the code. The names below were confirmed on the reference build.
- Line models get random suffixes: `x_kassensitzung_line_86aa0`, `x_verkauf_line_4cb26` (yours will differ).
- German umlauts are sanitized: "Ist bar (gezählt)" → `x_studio_ist_bar_gezahlt`, "Stückelung" → `x_studio_stuckelung`, "Zählung" → `x_studio_zahlung`, "Rückgeld" → `x_studio_ruckgeld`.
- Labels with "(%)" or "%" get a trailing underscore: "MWST-Satz (%)" → `x_studio_mwst_satz_`, "MWST 2.6 %" → `x_studio_mwst_26_`.
- Some fields got generic or suffixed names on the reference build: the Positionen one2many on Verkauf is `x_studio_one2many_1`, Kartenreferenz is `x_studio_kartenreferenz_1`, Verkauf "MWST 8.1" is `x_studio_mwst_81` (no trailing underscore, unlike `x_studio_mwst_26_`/`_38_`), and the session's one2many to sales is `x_studio_verkaufe` (inverse `x_studio_sitzung`).
- Every Monetary field auto-adds a Currency field, `x_studio_currency_id` (on every model with Monetary fields); keep it but hide it in views. **(v3: hidden)**
- All Selection fields use **keys equal to labels** (the code compares e.g. `== 'Bar'`, `== 'Geschlossen'`).

### 4.1 Kassenartikel – `x_kassenartikel`

| Label (UI) | Technical name | Type | Details |
|---|---|---|---|
| Name | `x_name` | Char | required; list header "Name" |
| Kategorie | `x_studio_kategorie` | Char | |
| Preis (CHF inkl. MWST) | `x_studio_preis_chf_inkl_mwst` | Monetary | required; VAT-inclusive |
| MWST-Satz (%) | `x_studio_mwst_satz_` | Float | default `8.1`; allowed 8.1 / 3.8 / 2.6 / 0 (rule 8) |
| Menge | `x_studio_menge` | Float | e.g. 5 for "5 dl" |
| Einheit | `x_studio_einheit` | Selection | `Stk.`, `g`, `kg`, `ml`, `dl`, `l`, `Nacht`, `Pauschal` (keys = labels) |
| Aktiv | `x_active` | Boolean | Studio archive toggle |
| (Currency) | `x_studio_currency_id` | Many2one res.currency | auto-added, hidden |

### 4.2 Kassensitzung – `x_kassensitzung`

| Label (UI) | Technical name | Type | Details |
|---|---|---|---|
| Name | `x_name` | Char | auto "Sitzung <id>" (rule 6) |
| Kassier | `x_studio_kassier` | Many2one `res.users` | auto = current user (rule 6) |
| Start | `x_studio_start` | Datetime | auto = now on create (rule 6) |
| Ende | `x_studio_ende` | Datetime | auto = now when closed; cleared when reopened (rule 6) |
| Anfangsbestand | `x_studio_anfangsbestand` | Monetary | opening float |
| Status | `x_studio_status` | Selection | `Offen`, `Geschlossen` (keys = labels), default `Offen`, statusbar widget |
| Zählung | `x_studio_zahlung` | One2many → `x_kassensitzung_line_86aa0` | 12 rows auto-created (rule 6) |
| Verkäufe | `x_studio_verkaufe` | One2many → `x_verkauf` (inverse `x_studio_sitzung`) | read-only |
| Soll bar | `x_studio_soll_bar` | Monetary | read-only |
| Ist bar (gezählt) | `x_studio_ist_bar_gezahlt` | Monetary | read-only |
| Differenz | `x_studio_differenz` | Monetary | read-only |
| Kartentotal | `x_studio_kartentotal` | Monetary | read-only |
| MWST 8.1 % | `x_studio_mwst_81_` | Monetary | read-only |
| MWST 2.6 % | `x_studio_mwst_26_` | Monetary | read-only |
| MWST 3.8 % | `x_studio_mwst_38_` | Monetary | read-only |
| (Currency) | `x_studio_currency_id` | Many2one | hidden |

### 4.3 Zählung line – `x_kassensitzung_line_86aa0`

| Label (UI) | Technical name | Type | Details |
|---|---|---|---|
| (Bezeichnung) | `x_name` | Char | denomination label, e.g. "5 Rp.", "CHF 200" |
| Stückelung | `x_studio_stuckelung` | Monetary | 0.05 … 200.00 |
| Anzahl | `x_studio_anzahl` | Integer | entered by the cashier |
| Betrag | `x_studio_betrag` | Monetary | = Stückelung × Anzahl (rule 3) |
| (link) | `x_kassensitzung_id` | Many2one | inverse link from count line to session |

Denominations (12 rows): 5 Rp., 10 Rp., 20 Rp., 50 Rp., CHF 1, CHF 2, CHF 5, CHF 10, CHF 20, CHF 50, CHF 100, CHF 200.

### 4.4 Verkauf – `x_verkauf`

| Label (UI) | Technical name | Type | Details |
|---|---|---|---|
| Belegnummer | `x_name` | Char | relabelled; NOT required; read-only; auto `B-%05d` from id (rule 5); shown only once on the form |
| Sitzung | `x_studio_sitzung` | Many2one → `x_kassensitzung` | |
| Zeit | `x_studio_zeit` | Datetime | auto = now (rule 5) |
| Positionen | `x_studio_one2many_1` | One2many → `x_verkauf_line_4cb26` | |
| Total | `x_studio_total` | Monetary | read-only |
| MWST 8.1 % | `x_studio_mwst_81` | Monetary | read-only (no trailing underscore) |
| MWST 2.6 % | `x_studio_mwst_26_` | Monetary | read-only |
| MWST 3.8 % | `x_studio_mwst_38_` | Monetary | read-only |
| Rundung | `x_studio_rundung` | Monetary | read-only; 5-Rp. rounding (cash only) |
| Zu bezahlen | `x_studio_zu_bezahlen` | Monetary | read-only |
| Zahlungsart | `x_studio_zahlungsart` | Selection | `Bar`, `Karte` (keys = labels), default `Bar` |
| Erhalten | `x_studio_erhalten` | Monetary | cash received |
| Rückgeld | `x_studio_ruckgeld` | Monetary | read-only |
| Kartenreferenz | `x_studio_kartenreferenz_1` | Char | optional |
| Aktiv | `x_active` | Boolean | archive toggle; used by archive-cancel |
| (Currency) | `x_studio_currency_id` | Many2one | hidden |

### 4.5 Verkaufsposition – `x_verkauf_line_4cb26`

| Label (UI) | Technical name | Type | Details |
|---|---|---|---|
| Artikel | `x_studio_artikel` | Many2one → `x_kassenartikel` | |
| Einheit | `x_studio_einheit` | Char | read-only, e.g. "5 dl" (rules 1/2) |
| Menge | `x_studio_menge` | Float | default `1` |
| Preis | `x_studio_preis` | Monetary | from article (editable) |
| MWST-Satz | `x_studio_mwst_satz_` | Float | from article; allowed 8.1 / 3.8 / 2.6 / 0 (rule 2) |
| MWST | `x_studio_mwst` | Monetary | VAT share (rule 2) |
| Betrag | `x_studio_betrag` | Monetary | Menge × Preis (rule 2) |
| (Beschreibung) | `x_name` | Char | NOT required; filled from article name (needed, otherwise saving fails) |
| (link) | `x_verkauf_id` | Many2one | inverse link from sale line to sale |

### 4.6 Calculation logic

- **Prices include VAT.** Line Betrag = Menge × Preis (rounded 0.01). VAT share = Betrag × rate / (100 + rate), rounded to 0.01 per line.
- Sale VAT is summed per rate 8.1 / 3.8 / 2.6. 0 % is not broken out. Only these four rates are accepted (rules 2 and 8). **(v3)**
- **Cash (Bar):** Zu bezahlen = Total rounded half-up to 0.05; Rundung = Zu bezahlen − Total; Rückgeld = max(Erhalten − Zu bezahlen, 0). If Erhalten < Zu bezahlen, the form warns live (rule 4) and saving is blocked (rule 5). **(v3)**
- **Card (Karte):** Zu bezahlen = Total, no rounding, Rückgeld 0; Kartenreferenz optional.
- **Session:** Soll bar = Anfangsbestand + Σ Zu bezahlen of cash sales; Kartentotal = Σ Total of card sales; Ist bar (gezählt) = Σ Betrag of the count lines; Differenz = Ist − Soll; MWST per rate = Σ of the sales' VAT fields. Archived sales are excluded (one2many hides inactive records).

## 5. Views and menus

### 5.1 Menus (Kasse app)
- **Kassenartikel** (`x_kassenartikel`)
- **Kassensitzungen** (`x_kassensitzung`)
- **Verkäufe** (`x_verkauf`)

### 5.2 List views
- Kassenartikel: Name, Kategorie, Preis (CHF inkl. MWST), MWST-Satz (%), Menge, Einheit (Currency hidden).
- Kassensitzung: Kassier, Start, Status, Ist bar (gezählt), Differenz.
- Verkauf: Belegnummer, Sitzung, Zeit, Zahlungsart, Total.

### 5.3 Form layouts

Create all fields first, then open Studio's XML editor (developer mode) and replace the form `<sheet>` in one paste. The following arches are **reference layouts**: adapt technical names and keep Studio's own wrapper elements.

**Kassenartikel:** one group with Name, Kategorie, Preis (CHF inkl. MWST), MWST-Satz (%), Menge, Einheit; Currency invisible; Aktiv via the archive option.

**Kassensitzung** – header with Status as statusbar; all fields except Status read-only when closed **(v3)**; summary section titled **"Summen"** **(v3)**:

```xml
<header>
  <field name="x_studio_status" widget="statusbar" options="{'clickable': '1'}"/>
</header>
<sheet>
  <div class="oe_title"><h1><field name="x_name" readonly="1"/></h1></div>
  <group>
    <group>
      <field name="x_studio_kassier" readonly="x_studio_status == 'Geschlossen'"/>
      <field name="x_studio_start" readonly="x_studio_status == 'Geschlossen'"/>
      <field name="x_studio_ende" readonly="x_studio_status == 'Geschlossen'"/>
      <field name="x_studio_anfangsbestand" readonly="x_studio_status == 'Geschlossen'"/>
      <field name="x_studio_currency_id" invisible="1"/>
    </group>
    <group string="Summen">
      <field name="x_studio_soll_bar" readonly="1"/>
      <field name="x_studio_ist_bar_gezahlt" readonly="1"/>
      <field name="x_studio_differenz" readonly="1"/>
      <field name="x_studio_kartentotal" readonly="1"/>
      <field name="x_studio_mwst_81_" string="MWST 8.1 %" readonly="1"/>
      <field name="x_studio_mwst_38_" string="MWST 3.8 %" readonly="1"/>
      <field name="x_studio_mwst_26_" string="MWST 2.6 %" readonly="1"/>
    </group>
  </group>
  <notebook>
    <page string="Zählung">
      <field name="x_studio_zahlung" readonly="x_studio_status == 'Geschlossen'">
        <list editable="bottom" create="0" delete="0">
          <field name="x_name" string="Stückelung" readonly="1"/>
          <field name="x_studio_stuckelung" column_invisible="1"/>
          <field name="x_studio_anzahl"/>
          <field name="x_studio_betrag" readonly="1"/>
        </list>
      </field>
    </page>
    <page string="Verkäufe">
      <field name="x_studio_verkaufe" readonly="1">
        <list>
          <field name="x_name" string="Belegnummer"/>
          <field name="x_studio_zeit"/>
          <field name="x_studio_zahlungsart"/>
          <field name="x_studio_total"/>
        </list>
      </field>
    </page>
  </notebook>
</sheet>
```

**Verkauf** – exactly **one** `<sheet>` (do not duplicate it) **(v3)**; Belegnummer appears only once:

```xml
<sheet>
  <div class="oe_title"><h1><field name="x_name" string="Belegnummer" readonly="1"/></h1></div>
  <group>
    <group>
      <field name="x_studio_sitzung"/>
      <field name="x_studio_zeit"/>
      <field name="x_studio_zahlungsart"/>
      <field name="x_studio_erhalten" invisible="x_studio_zahlungsart != 'Bar'"/>
      <field name="x_studio_ruckgeld" readonly="1" invisible="x_studio_zahlungsart != 'Bar'"/>
      <field name="x_studio_kartenreferenz_1" string="Kartenreferenz" invisible="x_studio_zahlungsart != 'Karte'"/>
      <field name="x_studio_currency_id" invisible="1"/>
    </group>
    <group string="Summen">
      <field name="x_studio_total" readonly="1"/>
      <field name="x_studio_rundung" readonly="1" invisible="x_studio_zahlungsart != 'Bar'"/>
      <field name="x_studio_zu_bezahlen" readonly="1"/>
      <field name="x_studio_mwst_81" string="MWST 8.1 %" readonly="1"/>
      <field name="x_studio_mwst_38_" string="MWST 3.8 %" readonly="1"/>
      <field name="x_studio_mwst_26_" string="MWST 2.6 %" readonly="1"/>
    </group>
  </group>
  <field name="x_studio_one2many_1" string="Positionen">
    <list editable="bottom">
      <field name="x_studio_artikel"/>
      <field name="x_studio_einheit" readonly="1"/>
      <field name="x_studio_menge"/>
      <field name="x_studio_preis"/>
      <field name="x_studio_mwst_satz_" string="MWST-Satz"/>
      <field name="x_studio_mwst" readonly="1"/>
      <field name="x_studio_betrag" readonly="1"/>
      <field name="x_name" column_invisible="1"/>
    </list>
  </field>
</sheet>
```

Notes: set labels via `string="…"` attributes, not by renaming fields that are already used in views. Read-only fields set in the UI are not persisted by "On UI change" rules; the server-side rules (2, 3, 5, 6) fill them on save.

## 6. Automation rules

Create each in Studio > Automations (or Settings > Technical > Automation Rules) with action **Execute Code**. Paste each block in one shot (the ACE editor auto-indents). `env`, `record`, `records`, `datetime` and `UserError` are available in the code context.

| # | Name | Model | Trigger |
|---|---|---|---|
| 1 | Position: Artikel übernehmen | `x_verkauf_line_4cb26` | On UI change, field Artikel |
| 2 | Position: Betrag und MWST | `x_verkauf_line_4cb26` | On create and edit |
| 3 | Zählung: Betrag | `x_kassensitzung_line_86aa0` | On create and edit |
| 4 | Verkauf: Rückgeld live | `x_verkauf` | On UI change, fields Positionen, Zahlungsart, Erhalten |
| 5 | Verkauf: Totale und Sitzung | `x_verkauf` | On create and edit |
| 6 | Sitzung: Vorgaben und Abschluss | `x_kassensitzung` | On create and edit |
| 7 | *(removed in v3)* | – | – |
| 8 | Artikel: MWST-Satz prüfen | `x_kassenartikel` | On create and edit |

### Rule 1 – "Position: Artikel übernehmen" (`x_verkauf_line_4cb26`, On UI change, field Artikel)
```python
if record.x_studio_artikel:
    a = record.x_studio_artikel
    einheit = (('%g ' % a.x_studio_menge) if a.x_studio_menge else '') + (a.x_studio_einheit or '')
    record.update({
        'x_studio_preis': a.x_studio_preis_chf_inkl_mwst,
        'x_studio_mwst_satz_': a.x_studio_mwst_satz_,
        'x_name': a.x_name,
        'x_studio_einheit': einheit.strip(),
    })
```

### Rule 2 – "Position: Betrag und MWST" (`x_verkauf_line_4cb26`, On create and edit)
v3: rejects MWST-Satz outside {8.1, 3.8, 2.6, 0}. **()**
```python
for line in records:
    art = line.x_studio_artikel
    vals = {}
    preis = line.x_studio_preis
    satz = line.x_studio_mwst_satz_
    if art and not preis:
        preis = art.x_studio_preis_chf_inkl_mwst
        vals['x_studio_preis'] = preis
    if art and not satz and art.x_studio_mwst_satz_:
        satz = art.x_studio_mwst_satz_
        vals['x_studio_mwst_satz_'] = satz
    if art and not line.x_name:
        vals['x_name'] = art.x_name
    if art and not line.x_studio_einheit:
        e = (('%g ' % art.x_studio_menge) if art.x_studio_menge else '') + (art.x_studio_einheit or '')
        if e.strip():
            vals['x_studio_einheit'] = e.strip()
    if round(satz or 0.0, 1) not in (8.1, 3.8, 2.6, 0.0):
        raise UserError('MWST-Satz muss 8.1, 3.8, 2.6 oder 0 %% sein (Position %s).' % (line.x_name or ''))
    betrag = round((line.x_studio_menge or 0.0) * (preis or 0.0), 2)
    vals['x_studio_betrag'] = betrag
    vals['x_studio_mwst'] = round(betrag * satz / (100.0 + satz), 2) if satz else 0.0
    line.write(vals)
```

### Rule 3 – "Zählung: Betrag" (`x_kassensitzung_line_86aa0`, On create and edit)
```python
for line in records:
    line.write({'x_studio_betrag': round((line.x_studio_stuckelung or 0.0) * (line.x_studio_anzahl or 0), 2)})
```

### Rule 4 – "Verkauf: Rückgeld live" (`x_verkauf`, On UI change, fields Positionen, Zahlungsart, Erhalten)
v3: shows a warning when Erhalten < Zu bezahlen for cash. **()**
```python
BAR = 'Bar'
total = round(sum((l.x_studio_menge or 0.0) * (l.x_studio_preis or 0.0) for l in record.x_studio_one2many_1), 2)
if record.x_studio_zahlungsart == BAR:
    zb = int(total * 20 + 0.5 + 1e-9) / 20.0
    rueck = round(max((record.x_studio_erhalten or 0.0) - zb, 0.0), 2)
else:
    zb = total
    rueck = 0.0
record.update({'x_studio_total': total, 'x_studio_zu_bezahlen': zb, 'x_studio_rundung': round(zb - total, 2), 'x_studio_ruckgeld': rueck})
if record.x_studio_zahlungsart == BAR and record.x_studio_erhalten and record.x_studio_erhalten < zb:
    action = {'warning': {'title': 'Zu wenig erhalten', 'message': 'Erhalten (%.2f) ist kleiner als Zu bezahlen (%.2f).' % (record.x_studio_erhalten, zb)}}
```

### Rule 5 – "Verkauf: Totale und Sitzung" (`x_verkauf`, On create and edit)
Also fills Belegnummer (`B-%05d` from id) and Zeit, and recomputes the session. Because it runs on every write, **archiving a sale** recomputes its session immediately (archive-cancel). v3: blocks saving a cash sale with Erhalten < Zu bezahlen. **()**
```python
BAR = 'Bar'
for v in records:
    lines = v.x_studio_one2many_1
    total = round(sum(lines.mapped('x_studio_betrag')), 2)
    if v.x_studio_zahlungsart == BAR:
        zb = int(total * 20 + 0.5 + 1e-9) / 20.0
        if total and (v.x_studio_erhalten or 0.0) < zb:
            raise UserError('Barzahlung: Erhalten (%.2f) ist kleiner als Zu bezahlen (%.2f).' % (v.x_studio_erhalten or 0.0, zb))
        rueck = round(max((v.x_studio_erhalten or 0.0) - zb, 0.0), 2)
    else:
        zb = total
        rueck = 0.0
    vals = {
        'x_studio_total': total,
        'x_studio_zu_bezahlen': zb,
        'x_studio_rundung': round(zb - total, 2),
        'x_studio_ruckgeld': rueck,
        'x_studio_mwst_81': round(sum(l.x_studio_mwst for l in lines if abs(l.x_studio_mwst_satz_ - 8.1) < 0.001), 2),
        'x_studio_mwst_26_': round(sum(l.x_studio_mwst for l in lines if abs(l.x_studio_mwst_satz_ - 2.6) < 0.001), 2),
        'x_studio_mwst_38_': round(sum(l.x_studio_mwst for l in lines if abs(l.x_studio_mwst_satz_ - 3.8) < 0.001), 2),
    }
    if not v.x_name:
        vals['x_name'] = 'B-%05d' % v.id
    if not v.x_studio_zeit:
        vals['x_studio_zeit'] = datetime.datetime.now()
    v.write(vals)
    s = v.x_studio_sitzung
    if s:
        sales = s.x_studio_verkaufe
        bar = sum(x.x_studio_zu_bezahlen for x in sales if x.x_studio_zahlungsart == BAR)
        karte = sum(x.x_studio_total for x in sales if x.x_studio_zahlungsart != BAR)
        ist = sum(s.x_studio_zahlung.mapped('x_studio_betrag'))
        soll = (s.x_studio_anfangsbestand or 0.0) + bar
        s.write({
            'x_studio_soll_bar': round(soll, 2), 'x_studio_kartentotal': round(karte, 2),
            'x_studio_ist_bar_gezahlt': round(ist, 2), 'x_studio_differenz': round(ist - soll, 2),
            'x_studio_mwst_81_': round(sum(sales.mapped('x_studio_mwst_81')), 2),
            'x_studio_mwst_26_': round(sum(sales.mapped('x_studio_mwst_26_')), 2),
            'x_studio_mwst_38_': round(sum(sales.mapped('x_studio_mwst_38_')), 2),
        })
```

### Rule 6 – "Sitzung: Vorgaben und Abschluss" (`x_kassensitzung`, On create and edit)
Fills Kassier, Start, name and the 12 count rows; recomputes totals; sets Ende on close. v3: clears Ende when a session is reopened. **()**
```python
BAR = 'Bar'
DEN = [(0.05, '5 Rp.'), (0.10, '10 Rp.'), (0.20, '20 Rp.'), (0.50, '50 Rp.'), (1.0, 'CHF 1'), (2.0, 'CHF 2'),
       (5.0, 'CHF 5'), (10.0, 'CHF 10'), (20.0, 'CHF 20'), (50.0, 'CHF 50'), (100.0, 'CHF 100'), (200.0, 'CHF 200')]
for s in records:
    vals = {}
    if not s.x_studio_kassier:
        vals['x_studio_kassier'] = env.user.id
    if not s.x_studio_start:
        vals['x_studio_start'] = datetime.datetime.now()
    if not s.x_name:
        vals['x_name'] = 'Sitzung %s' % s.id
    if not s.x_studio_zahlung:
        vals['x_studio_zahlung'] = [(0, 0, {'x_name': label, 'x_studio_stuckelung': d, 'x_studio_anzahl': 0}) for d, label in DEN]
    if vals:
        s.write(vals)
    sales = s.x_studio_verkaufe
    bar = sum(x.x_studio_zu_bezahlen for x in sales if x.x_studio_zahlungsart == BAR)
    karte = sum(x.x_studio_total for x in sales if x.x_studio_zahlungsart != BAR)
    ist = sum(s.x_studio_zahlung.mapped('x_studio_betrag'))
    soll = (s.x_studio_anfangsbestand or 0.0) + bar
    s.write({
        'x_studio_soll_bar': round(soll, 2), 'x_studio_kartentotal': round(karte, 2),
        'x_studio_ist_bar_gezahlt': round(ist, 2), 'x_studio_differenz': round(ist - soll, 2),
        'x_studio_mwst_81_': round(sum(sales.mapped('x_studio_mwst_81')), 2),
        'x_studio_mwst_26_': round(sum(sales.mapped('x_studio_mwst_26_')), 2),
        'x_studio_mwst_38_': round(sum(sales.mapped('x_studio_mwst_38_')), 2),
    })
    if s.x_studio_status == 'Geschlossen' and not s.x_studio_ende:
        s.write({'x_studio_ende': datetime.datetime.now()})
    elif s.x_studio_status != 'Geschlossen' and s.x_studio_ende:
        s.write({'x_studio_ende': False})
```

### Rule 7 – removed
An "On deletion" rule on `x_verkauf` was configured correctly but never fired on Odoo 20.0 Online. It was removed in v3. Cancel a sale by **archiving** it (Aktion > Archivieren); real deletions are caught by the scheduled action (section 7).

### Rule 8 – "Artikel: MWST-Satz prüfen" (`x_kassenartikel`, On create and edit) – new in v3 **()**
```python
for a in records:
    if round(a.x_studio_mwst_satz_ or 0.0, 1) not in (8.1, 3.8, 2.6, 0.0):
        raise UserError('MWST-Satz muss 8.1, 3.8, 2.6 oder 0 %% sein (%s).' % (a.x_name or ''))
```

### Optional one-off backfill
Only needed if sales/lines existed before the Menge/Einheit/Rundung fields were added. Create a temporary server action on `x_verkauf` (Execute Code), add it as a contextual action, run it once from a record, then delete it (`automations/backfill_optional.py`):
```python
BAR = 'Bar'
for l in env['x_verkauf_line_4cb26'].search([]):
    a = l.x_studio_artikel
    if a:
        e = ((('%g ' % a.x_studio_menge) if a.x_studio_menge else '') + (a.x_studio_einheit or '')).strip()
        l.write({'x_studio_einheit': e})
for v in env['x_verkauf'].search([]):
    t = v.x_studio_total
    zb = int(t * 20 + 0.5 + 1e-9) / 20.0 if v.x_studio_zahlungsart == BAR else t
    v.write({'x_studio_zu_bezahlen': zb, 'x_studio_rundung': round(zb - t, 2)})
for s in env['x_kassensitzung'].search([]):
    s.write({'x_studio_anfangsbestand': s.x_studio_anfangsbestand})
```

## 7. Scheduled action (safety net)

Settings > Technical > Automation > Scheduled Actions > New (developer mode):
- Name: **Kasse: Sitzungen nachrechnen**
- Model: **Kassensitzung** (`x_kassensitzung`)
- Action: **Execute Code**
- Interval: every **15 minutes**, active

```python
# Scheduled action "Kasse: Sitzungen nachrechnen" (model Kassensitzung, every 15 minutes, Execute Code)
for s in env['x_kassensitzung'].search([]):
    s.write({'x_studio_anfangsbestand': s.x_studio_anfangsbestand})
```

Each write triggers rule 6, which recomputes all session totals. This catches deleted sales and sales moved to another session.

## 8. Reports

1. A model needs **at least one saved record** before Studio lets you create a report on it.
2. Studio (on the model's form) > Reports > New > **External** layout. Name: **Quittung** (on Verkauf) / **Kassenabschluss** (on Kassensitzung).
3. In developer mode, open the report's XML editor and replace the content **inside** `<div class="page"> … </div>` with the block below. **Keep Studio's wrapper/lock markers** around it, or saving fails.
4. Use `t-out`, never `t-esc` (renders blank in Odoo 20). Amounts use `t-options` float precision 2, which applies the language's thousands separator (`1'257.00`). **(v3)**
5. The External layout shows the company logo uploaded in build step 2 (`<LOGO_FILE>`) in place of the "Your logo" placeholder. **(v3)**
6. Print from the record's form via the Action/print (gear) menu.

### 8.1 Quittung (`x_verkauf`) – `reports/quittung.xml`
```xml
<h3>Quittung <span t-field="doc.x_name"/></h3>
<p>Zeit: <span t-field="doc.x_studio_zeit"/><br/>Sitzung: <span t-field="doc.x_studio_sitzung"/></p>
<table class="table table-sm">
  <thead><tr><th>Artikel</th><th>Einheit</th><th class="text-end">Menge</th><th class="text-end">Preis</th><th class="text-end">MWST %</th><th class="text-end">Betrag CHF</th></tr></thead>
  <tbody>
    <tr t-foreach="doc.x_studio_one2many_1" t-as="l">
      <td><span t-field="l.x_studio_artikel"/></td>
      <td><span t-field="l.x_studio_einheit"/></td>
      <td class="text-end"><span t-out="'%g' % l.x_studio_menge"/></td>
      <td class="text-end"><span t-out="l.x_studio_preis" t-options='{"widget": "float", "precision": 2}'/></td>
      <td class="text-end"><span t-out="'%.1f' % l.x_studio_mwst_satz_"/></td>
      <td class="text-end"><span t-out="l.x_studio_betrag" t-options='{"widget": "float", "precision": 2}'/></td>
    </tr>
  </tbody>
</table>
<table class="table table-sm" style="width:50%; margin-left:auto;">
  <tr><td><strong>Total CHF (inkl. MWST)</strong></td><td class="text-end"><strong t-out="doc.x_studio_total" t-options='{"widget": "float", "precision": 2}'/></td></tr>
  <tr><td>Zahlungsart</td><td class="text-end"><span t-field="doc.x_studio_zahlungsart"/></td></tr>
  <t t-if="doc.x_studio_zahlungsart == 'Bar'">
    <tr t-if="doc.x_studio_rundung"><td>Rundung (5 Rp.)</td><td class="text-end"><span t-out="doc.x_studio_rundung" t-options='{"widget": "float", "precision": 2}'/></td></tr>
    <tr><td><strong>Zu bezahlen</strong></td><td class="text-end"><strong t-out="doc.x_studio_zu_bezahlen" t-options='{"widget": "float", "precision": 2}'/></td></tr>
    <tr><td>Erhalten</td><td class="text-end"><span t-out="doc.x_studio_erhalten" t-options='{"widget": "float", "precision": 2}'/></td></tr>
    <tr><td>Rückgeld</td><td class="text-end"><span t-out="doc.x_studio_ruckgeld" t-options='{"widget": "float", "precision": 2}'/></td></tr>
  </t>
  <tr t-if="doc.x_studio_zahlungsart != 'Bar' and doc.x_studio_kartenreferenz_1"><td>Kartenreferenz</td><td class="text-end"><span t-field="doc.x_studio_kartenreferenz_1"/></td></tr>
</table>
<p><strong>Enthaltene MWST</strong></p>
<table class="table table-sm" style="width:50%;">
  <tr t-if="doc.x_studio_mwst_81"><td>8.1 %</td><td class="text-end"><span t-out="doc.x_studio_mwst_81" t-options='{"widget": "float", "precision": 2}'/></td></tr>
  <tr t-if="doc.x_studio_mwst_38_"><td>3.8 %</td><td class="text-end"><span t-out="doc.x_studio_mwst_38_" t-options='{"widget": "float", "precision": 2}'/></td></tr>
  <tr t-if="doc.x_studio_mwst_26_"><td>2.6 %</td><td class="text-end"><span t-out="doc.x_studio_mwst_26_" t-options='{"widget": "float", "precision": 2}'/></td></tr>
</table>
<p class="text-center">Vielen Dank für Ihren Einkauf!</p>
```

### 8.2 Kassenabschluss (`x_kassensitzung`) – `reports/kassenabschluss.xml`
```xml
<h3>Kassenabschluss <span t-field="doc.x_name"/></h3>
<p>Kassier: <span t-field="doc.x_studio_kassier"/><br/>Start: <span t-field="doc.x_studio_start"/><br/>Ende: <span t-field="doc.x_studio_ende"/><br/>Status: <span t-field="doc.x_studio_status"/></p>
<p><strong>Verkäufe</strong></p>
<table class="table table-sm">
  <thead><tr><th>Beleg</th><th>Zeit</th><th>Zahlungsart</th><th class="text-end">Total CHF</th></tr></thead>
  <tbody>
    <tr t-foreach="doc.x_studio_verkaufe" t-as="v">
      <td><span t-field="v.x_name"/></td><td><span t-field="v.x_studio_zeit"/></td><td><span t-field="v.x_studio_zahlungsart"/></td>
      <td class="text-end"><span t-out="v.x_studio_zu_bezahlen if v.x_studio_zahlungsart == 'Bar' else v.x_studio_total" t-options='{"widget": "float", "precision": 2}'/></td>
    </tr>
  </tbody>
</table>
<p><strong>Zählung Bargeld</strong></p>
<table class="table table-sm" style="width:60%;">
  <thead><tr><th>Stückelung</th><th class="text-end">Anzahl</th><th class="text-end">Betrag CHF</th></tr></thead>
  <tbody>
    <tr t-foreach="doc.x_studio_zahlung" t-as="z">
      <td><span t-field="z.x_name"/></td><td class="text-end"><span t-out="z.x_studio_anzahl"/></td>
      <td class="text-end"><span t-out="z.x_studio_betrag" t-options='{"widget": "float", "precision": 2}'/></td>
    </tr>
  </tbody>
</table>
<table class="table table-sm" style="width:60%;">
  <tr><td>Anfangsbestand</td><td class="text-end"><span t-out="doc.x_studio_anfangsbestand" t-options='{"widget": "float", "precision": 2}'/></td></tr>
  <tr><td>Soll bar</td><td class="text-end"><span t-out="doc.x_studio_soll_bar" t-options='{"widget": "float", "precision": 2}'/></td></tr>
  <tr><td>Ist bar (gezählt)</td><td class="text-end"><span t-out="doc.x_studio_ist_bar_gezahlt" t-options='{"widget": "float", "precision": 2}'/></td></tr>
  <tr><td><strong>Differenz</strong></td><td class="text-end"><strong t-out="doc.x_studio_differenz" t-options='{"widget": "float", "precision": 2}'/></td></tr>
  <tr><td>Kartentotal</td><td class="text-end"><span t-out="doc.x_studio_kartentotal" t-options='{"widget": "float", "precision": 2}'/></td></tr>
</table>
<p><strong>MWST nach Satz</strong></p>
<table class="table table-sm" style="width:60%;">
  <tr><td>8.1 %</td><td class="text-end"><span t-out="doc.x_studio_mwst_81_" t-options='{"widget": "float", "precision": 2}'/></td></tr>
  <tr><td>3.8 %</td><td class="text-end"><span t-out="doc.x_studio_mwst_38_" t-options='{"widget": "float", "precision": 2}'/></td></tr>
  <tr><td>2.6 %</td><td class="text-end"><span t-out="doc.x_studio_mwst_26_" t-options='{"widget": "float", "precision": 2}'/></td></tr>
</table>
<div style="margin-top:60px;">
  <p>Datum: ____________________ &#160;&#160;&#160; Unterschrift Kassier: ______________________________</p>
</div>
```

## 9. Demo data

### 9.1 Articles
Import `demo/kassenartikel.csv` in Kassenartikel (Favorites/gear > Import records). In the import options set **Decimal separator = "." (Punkt)** and **Thousands separator = none (Kein Trennzeichen)**, otherwise values come in 100× too large. Map columns: Name → Name, Kategorie → Kategorie, Preis → Preis (CHF inkl. MWST), MWST-Satz → MWST-Satz (%), Menge → Menge, Einheit → Einheit.

```csv
Name,Kategorie,Preis,MWST-Satz,Menge,Einheit
Kaffee,Getränke,4.50,8.1,1,Stk.
Mineralwasser 5 dl,Getränke,3.50,8.1,5,dl
Orangensaft 3 dl,Getränke,4.00,8.1,3,dl
Gipfeli,Backwaren,2.20,2.6,1,Stk.
Brot 500 g,Backwaren,4.80,2.6,500,g
Sandwich Schinken,Speisen,7.50,2.6,1,Stk.
Schokolade 100 g,Lebensmittel,2.90,2.6,100,g
Zeitung,Medien,4.00,2.6,1,Stk.
Notizbuch A5,Papeterie,9.90,8.1,1,Stk.
Kugelschreiber,Papeterie,2.50,8.1,1,Stk.
Übernachtung Einzelzimmer,Beherbergung,95.00,3.8,1,Nacht
Gutschein,Diverses,20.00,0,1,Pauschal
```

### 9.2 Demo session and sales
1. Kassensitzungen > Neu: Anfangsbestand **200.00**, save (Kassier = `<CASHIER_USER>`, Start, name and 12 count rows fill in).
2. Create 5 sales in this session (Verkäufe > Neu, pick Sitzung, add Positionen, save):

| # | Positionen | Zahlungsart | Erhalten / Ref. | Total | Zu bezahlen | Rückgeld |
|---|---|---|---|---|---|---|
| a | 2× Kaffee, 1× Gipfeli | Bar | 20.00 | 11.20 | 11.20 | 8.80 |
| b | 1× Sandwich Schinken, 1× Mineralwasser 5 dl | Karte | VISA 4821 | 11.00 | 11.00 | – |
| c | 1× Übernachtung Einzelzimmer, 2× Kaffee | Karte | MC 1093 | 104.00 | 104.00 | – |
| d | 1× Zeitung, 1× Schokolade 100 g, 1× Orangensaft 3 dl | Bar | 50.00 | 10.90 | 10.90 | 39.10 |
| e | 1× Notizbuch A5, 2× Kugelschreiber, 1× Gutschein | Bar | 50.00 | 34.90 | 34.90 | 15.10 |

3. Expected session totals: **Soll bar 257.00**, **Kartentotal 115.00**, MWST **8.1 % 3.01**, **3.8 % 3.48**, **2.6 % 0.42**.
4. Count: 1× CHF 200, 1× CHF 50, 1× CHF 5, 1× CHF 2 → save → **Ist bar 257.00, Differenz 0.00**.
5. Set Status **Geschlossen**, save → Ende fills.

## 10. Verification checklist

- [ ] Numbers show Swiss format in the UI (`11.20`, `1'257.00`).
- [ ] New session: Kassier, Start, name "Sitzung <id>" and 12 count rows (5 Rp. … CHF 200) fill on save.
- [ ] Sale 2× Kaffee + 1× Gipfeli, Bar, Erhalten 20 → Total 11.20, MWST 8.1 % 0.67, 2.6 % 0.06, Rückgeld 8.80. Lines show Einheit "1 Stk.".
- [ ] Belegnummer `B-xxxxx` auto-fills from the record id; Zeit auto-fills.
- [ ] Rounding test: session with Anfangsbestand 50; sale with 1× Kaffee, line Preis changed to 4.53, Bar, Erhalten 10 → Rundung 0.02, Zu bezahlen 4.55, Rückgeld 5.45; session Soll bar 54.55.
- [ ] Archive test: archive that sale → session Soll bar returns to 50.00 immediately.
- [ ] Delete test: recreate and delete a sale → run the scheduled action manually (Run Manually) → Soll bar returns to 50.00.
- [ ] Closing: set Geschlossen and save → Ende fills.
- [ ] Print Quittung (cash and card) and Kassenabschluss: amounts visible, "." decimal separator.
- [ ] Demo session (9.2) balances: Soll 257.00, Ist 257.00, Differenz 0.00, Kartentotal 115.00, VAT 3.01 / 3.48 / 0.42.
- [ ] **(v3)** Article or line with MWST-Satz 7.7 → save blocked with "MWST-Satz muss 8.1, 3.8, 2.6 oder 0 % sein".
- [ ] **(v3)** Cash sale with Erhalten 5 on a 11.20 sale → live warning "Zu wenig erhalten"; saving blocked.
- [ ] **(v3)** Closed session: all fields except Status read-only; reopening (Status Offen) clears Ende.
- [ ] **(v3)** Currency fields hidden; section header "Summen"; Verkauf form has one sheet and shows Belegnummer once.
- [ ] **(v3)** Reports show the thousands separator (e.g. `1'257.00`).
- [ ] **(v3)** Company logo: after uploading `<LOGO_FILE>` in Settings > Companies, the printed Quittung and Kassenabschluss show the logo instead of the "Your logo" placeholder.

## 11. Known limits

- Not a certified fiscal register; not a touchscreen POS; PDF receipts only; no stock, no accounting.
- After **deleting** (not archiving) a sale, session totals can be up to 15 minutes stale until the scheduled action runs.
- Moving a sale to another session updates the old session only via the scheduled action.
- Sitzung on a sale is optional; a sale without a session counts in no session.
- Belegnummern are id-based (`B-%05d`) and can have gaps.
- The logo is the company's own, set in Settings > Companies (build step 2).

## 12. Studio gotchas

- Drag-and-drop can create duplicate fields. Create the fields first, then paste the full form XML in Studio's XML editor in one go.
- Renaming fields that are already used in views fails; set labels with `string="…"` attributes.
- Dragging Many2one/One2many fields opens dialogs that must be confirmed.
- ACE code editors auto-indent; paste code in one shot.
- Monetary fields auto-add a Currency field; hide it.
- An "On UI change" rule cannot persist read-only fields; the server-side rules fill them on save.
- CSV import needs decimal separator "." and no thousands separator, or values come in 100× too large.
- A server-side backfill works when run as a contextual server action.
- Decline the "Load demo data" prompt on Settings.
- Reports need at least one saved record on the model; keep Studio's wrapper/lock markers; use `t-out`, not `t-esc`.
- The "On deletion" trigger did not fire for these models on Odoo 20.0 Online; use archive + the scheduled action.
- Line `x_name` must not be required (or must be filled from the article), otherwise sales cannot be saved.

## 13. Change log

- **v1** – Base build: Kassenartikel, Kassensitzung with Zählung, Verkauf with Positionen, automation rules for line amounts, VAT, totals, change and session sums; Quittung and Kassenabschluss reports.
- **v2** – Menge/Einheit on articles and lines; 5-Rp. cash rounding (Rundung, Zu bezahlen); Swiss number format; archive-cancel of sales; scheduled action "Kasse: Sitzungen nachrechnen" (15 min); on-delete rule attempted (did not fire).
- **v3** – 7 fixes, ****:
  1. Rule 7 (on delete) removed.
  2. MWST-Satz validated to {8.1, 3.8, 2.6, 0}: new rule 8 on articles, check in rule 2 on lines.
  3. Cash sale with Erhalten < Zu bezahlen: warning in rule 4, save blocked in rule 5.
  4. Closed sessions read-only (except Status); rule 6 clears Ende on reopen.
  5. Report amounts formatted with `t-options` float precision 2 (thousands separator `1'257.00`).
  6. View fixes: Currency fields hidden, section header "Summen", single sheet on the Verkauf form.
  7. Reports show the company logo (`<LOGO_FILE>`, uploaded in Settings > Companies) instead of the "Your logo" placeholder.
