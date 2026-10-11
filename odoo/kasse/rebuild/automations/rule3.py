# Kasse automation rule 3: "Zählung: Betrag"  (v3)
# Model:   x_kassensitzung_line_86aa0 (Zählung line)
# Trigger: On create and edit
# Action:  Execute Code (Python)
# Field names are the ones Studio generated on the reference build. Verify yours in developer mode and adapt.
# Available in the code context: env, record, records, datetime, UserError.

for line in records:
    line.write({'x_studio_betrag': round((line.x_studio_stuckelung or 0.0) * (line.x_studio_anzahl or 0), 2)})
