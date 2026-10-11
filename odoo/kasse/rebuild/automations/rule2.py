# Kasse automation rule 2: "Position: Betrag und MWST"  (v3)
# Model:   x_verkauf_line_4cb26 (Verkaufsposition)
# Trigger: On create and edit
# Action:  Execute Code (Python)
# Field names are the ones Studio generated on the reference build. Verify yours in developer mode and adapt.
# Available in the code context: env, record, records, datetime, UserError.

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
