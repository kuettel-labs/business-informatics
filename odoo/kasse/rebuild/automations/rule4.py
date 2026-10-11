# Kasse automation rule 4: "Verkauf: Rückgeld live"  (v3)
# Model:   x_verkauf (Verkauf)
# Trigger: On UI change (fields: Positionen, Zahlungsart, Erhalten)
# Action:  Execute Code (Python)
# Field names are the ones Studio generated on the reference build. Verify yours in developer mode and adapt.
# Available in the code context: env, record, records, datetime, UserError.

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
