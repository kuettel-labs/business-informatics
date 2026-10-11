# Odoo app «Kasse» — user manual

German user manual for the Odoo Studio app **Kasse**, running on [kuettel-labs.odoo.com](https://kuettel-labs.odoo.com).

It describes a simple cash desk: maintain articles, open a session, record cash and card sales, print a PDF receipt, count the drawer, and print the closing report.

**Test data.** Names, articles, sales, card references, and amounts shown in this manual are anonymized test data from a demo instance. They are not real personal or payment data. The same notice is printed in German near the top of the manual, before the first chapter.

The instance address `kuettel-labs.odoo.com` is kept on purpose, in the text and in the address bars of the screenshots.

## Layout

| Path | Contents |
|---|---|
| `Kasse-Benutzerhandbuch.md` | Manual source |
| `Kasse-Benutzerhandbuch.pdf`, `.docx` | Built documents |
| `screens/` | App screenshots referenced by the manual |
| `img/` | Receipt and closing-report images |
| `assets/handbuch.css` | Stylesheet used for the PDF |
| `build.sh` | Rebuilds the PDF and DOCX from the Markdown |

## Rebuild

From this directory:

```bash
./build.sh
```

The script needs `pandoc`, `pdfinfo` and `pdftoppm` (poppler-utils), and the Python packages Pillow, python-docx, and WeasyPrint. It installs the Python packages if they are missing.

`build.sh` writes intermediates to `build/` (gitignored): HTML, a generated Word reference document, and placeholder images if a screenshot is missing. It refreshes the PNGs in `img/` only when the original Odoo PDFs (`Quittung-bar.pdf`, `Quittung-karte.pdf`, `Quittung-rundung.pdf`, `Kassenabschluss.pdf`) are placed in the parent directory. Those PDFs are not in this folder; the images already in `img/` are what the manual uses.
