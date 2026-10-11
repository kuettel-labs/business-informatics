# Rule 7 - removed in v3

Rule 7 ("Verkauf: Löschen aktualisiert Sitzung", trigger On deletion) never fired on Odoo 20.0 Online and was removed.
Cancel a sale by archiving it (rule 5 recomputes the session immediately). Real deletions are caught by the scheduled action in ../cron_recompute.py.
