# OPTIONAL one-off backfill. Only needed if records existed before the Menge/Einheit/Rundung fields were added.
# Create a temporary server action on model x_verkauf (Execute Code), add it as a contextual action, run it once, then DELETE it.
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
