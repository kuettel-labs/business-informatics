# Kasse automation rule 6: "Sitzung: Vorgaben und Abschluss"  (v3)
# Model:   x_kassensitzung (Kassensitzung)
# Trigger: On create and edit
# Action:  Execute Code (Python)
# Field names are the ones Studio generated on the reference build. Verify yours in developer mode and adapt.
# Available in the code context: env, record, records, datetime, UserError.

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
