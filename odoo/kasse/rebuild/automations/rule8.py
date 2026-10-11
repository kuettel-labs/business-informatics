# Kasse automation rule 8: "Artikel: MWST-Satz prüfen"  (v3)
# Model:   x_kassenartikel (Kassenartikel)
# Trigger: On create and edit
# Action:  Execute Code (Python)
# Field names are the ones Studio generated on the reference build. Verify yours in developer mode and adapt.
# Available in the code context: env, record, records, datetime, UserError.

for a in records:
    if round(a.x_studio_mwst_satz_ or 0.0, 1) not in (8.1, 3.8, 2.6, 0.0):
        raise UserError('MWST-Satz muss 8.1, 3.8, 2.6 oder 0 %% sein (%s).' % (a.x_name or ''))
