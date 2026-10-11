# Model: x_kassensitzung (Kassensitzung) | Interval: every 15 minutes | Action: Execute Code
# Safety net: recomputes all session totals (the write triggers rule 6), catching deleted or moved sales.
# Scheduled action "Kasse: Sitzungen nachrechnen" (model Kassensitzung, every 15 minutes, Execute Code)
for s in env['x_kassensitzung'].search([]):
    s.write({'x_studio_anfangsbestand': s.x_studio_anfangsbestand})
