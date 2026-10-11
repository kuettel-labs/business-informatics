# Kasse automation rule 1: "Position: Artikel übernehmen"  (v3)
# Model:   x_verkauf_line_4cb26 (Verkaufsposition)
# Trigger: On UI change (field: Artikel / x_studio_artikel)
# Action:  Execute Code (Python)
# Field names are the ones Studio generated on the reference build. Verify yours in developer mode and adapt.
# Available in the code context: env, record, records, datetime, UserError.

if record.x_studio_artikel:
    a = record.x_studio_artikel
    einheit = (('%g ' % a.x_studio_menge) if a.x_studio_menge else '') + (a.x_studio_einheit or '')
    record.update({
        'x_studio_preis': a.x_studio_preis_chf_inkl_mwst,
        'x_studio_mwst_satz_': a.x_studio_mwst_satz_,
        'x_name': a.x_name,
        'x_studio_einheit': einheit.strip(),
    })
