#!/usr/bin/env bash
set -euo pipefail

# create_mkdocs_site.sh
# Erstellt eine MkDocs + GitHub Pages Ordnerstruktur und Beispielinhalte
# Usage: ./create_mkdocs_site.sh

echo "Erstelle Ordnerstruktur..."
mkdir -p docs/skills/a-strategie
mkdir -p docs/skills/b-projekte
mkdir -p docs/skills/c-loesungen
mkdir -p docs/skills/d-prozesse
mkdir -p docs/skills/e-betrieb
mkdir -p docs/exam/teil1-ict-konzept/drafts
mkdir -p docs/exam/teil2-management-operations
mkdir -p docs/exam/teil3-fuehrung
mkdir -p docs/projects
mkdir -p docs/knowledge
mkdir -p docs/portfolio
mkdir -p docs/quizzes
mkdir -p docs/journal
mkdir -p assets/css
mkdir -p .github/workflows

echo "Schreibe Dateien..."

cat > mkdocs.yml <<'YAML'
site_name: "WI EFA Portfolio - Lern-Board"
site_description: "Portfolio, Lernplattform und Wissensdatenbank für die Berufsprüfung Wirtschaftsinformatiker/in EFA"
site_author: "Dein Name"
repo_name: "kuettel-labs/business-informatics"
use_directory_urls: true

theme:
  name: "material"
  palette:
    scheme: default

nav:
  - Odoo Kasse:
    - Überblick: odoo-kasse/README.md
    - Benutzerhandbuch: odoo-kasse/Kasse-Benutzerhandbuch.md

extra_css:
  - 'assets/css/extra.css'

plugins: []
YAML

cat > README.md <<'MD'
# WI EFA Portfolio (MkDocs)

Diese Website ist dein persönliches Lern‑Board und Portfolio für die Berufsprüfung "Wirtschaftsinformatiker/in EFA".

Inhalt:
- Lernmaterialien nach Handlungskompetenzbereichen (a–e)
- Prüfungsdokumentation für die drei Teile
- Projekte, Wissen, Portfolio und Journal

Lokale Vorschau:

```bash
pip install -r requirements.txt
mkdocs serve
```
MD