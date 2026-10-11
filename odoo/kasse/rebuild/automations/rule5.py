# Kasse automation rule 5: "Verkauf: Totale und Sitzung"  (v3)
# Model:   x_verkauf (Verkauf)
# Trigger: On create and edit
# Action:  Execute Code (Python)
# Field names are the ones Studio generated on the reference build. Verify yours in developer mode and adapt.
# Available in the code context: env, record, records, datetime, UserError.

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
