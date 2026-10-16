#!/usr/bin/env bash
# Baut Kasse-Benutzerhandbuch.docx und .pdf aus Kasse-Benutzerhandbuch.md
# Benötigt: pandoc, python3 (Pillow, python-docx, weasyprint), poppler-utils (pdftoppm)
set -euo pipefail
cd "$(dirname "$0")"
SRC=Kasse-Benutzerhandbuch.md
OUT=Kasse-Benutzerhandbuch
BUILD=build
mkdir -p img "$BUILD/placeholders"

for t in pandoc pdftoppm python3; do command -v $t >/dev/null || { echo "Fehlt: $t (apt install pandoc poppler-utils)"; exit 1; }; done
python3 -c "import PIL, docx, weasyprint" 2>/dev/null || pip install --quiet pillow python-docx weasyprint || pip install --quiet --break-system-packages pillow python-docx weasyprint

# 1) Beispiel-PDFs -> PNG (img/), auf Inhalt zugeschnitten (ohne Fusszeile)
for f in Quittung-bar Quittung-karte Quittung-rundung Kassenabschluss; do
  if [ -f "../$f.pdf" ]; then
    pdftoppm -png -r 150 "../$f.pdf" "$BUILD/raw-$f"
  else
    echo "Hinweis: ../$f.pdf fehlt, Bild wird übersprungen"
  fi
done
python3 - <<'PY'
import glob, os, re
from PIL import Image, ImageOps
for p in sorted(glob.glob('build/raw-*.png')):
    name = re.sub(r'^raw-', '', os.path.basename(p))
    # single-page PDFs: "Quittung-bar-1.png" -> "Quittung-bar.png"
    base = name.rsplit('-', 1)[0]
    pages = glob.glob(f'build/raw-{base}-*.png')
    out = f'img/{base}.png' if len(pages) == 1 else f'img/{name}'
    im = Image.open(p).convert('RGB')
    w, h = im.size
    body = im.crop((0, 0, w, int(h * 0.885)))            # Fusszeile «Seite x / y» abschneiden
    bbox = ImageOps.invert(body.convert('L')).point(lambda v: 255 if v > 8 else 0).getbbox()
    if bbox:
        pad = 30
        bbox = (max(bbox[0]-pad, 0), max(bbox[1]-pad, 0), min(bbox[2]+pad, w), min(bbox[3]+pad, body.size[1]))
        body = body.crop(bbox)
    body.save(out, dpi=(150, 150))
    print('Bild:', out, body.size)
PY

# 2) Fehlende Bilder durch Platzhalter ersetzen (Build bricht nie wegen fehlender Screenshots ab)
python3 - "$SRC" "$BUILD/handbuch.md" <<'PY'
import re, sys, os
from PIL import Image, ImageDraw, ImageFont
src, dst = sys.argv[1], sys.argv[2]
text = open(src, encoding='utf-8').read()
def font(size):
    for f in ['/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf']:
        if os.path.exists(f): return ImageFont.truetype(f, size)
    return ImageFont.load_default()
missing = []
def repl(m):
    alt, path, attrs = m.group(1), m.group(2), m.group(3) or ''
    if os.path.exists(path):
        return m.group(0)
    missing.append(path)
    ph = f'build/placeholders/{os.path.basename(path)}'
    im = Image.new('RGB', (1600, 420), '#f3f0f2'); d = ImageDraw.Draw(im)
    d.rectangle([4, 4, 1595, 415], outline='#b9a9b5', width=4)
    d.text((800, 170), 'Screenshot folgt', fill='#714B67', font=font(64), anchor='mm')
    d.text((800, 270), os.path.basename(path), fill='#666', font=font(40), anchor='mm')
    im.save(ph, dpi=(200, 200))
    return f'![{alt}]({ph}){attrs}'
text = re.sub(r'!\[([^\]]*)\]\(([^)\s]+)\)(\{[^}]*\})?', repl, text)
open(dst, 'w', encoding='utf-8').write(text)
print('Fehlende Bilder (Platzhalter):', len(missing)); [print('  -', p) for p in missing]
PY

COMMON=(--from markdown --number-sections --toc --toc-depth=2 -M toc-title=Inhaltsverzeichnis -M lang=de-CH)

# 3) PDF: pandoc -> HTML -> WeasyPrint
pandoc "$BUILD/handbuch.md" "${COMMON[@]}" -s --to html5 --css assets/handbuch.css \
  -M document-css=false -o "$BUILD/handbuch.html"
python3 - <<'PY2'
import re, weasyprint
h = open('build/handbuch.html', encoding='utf-8').read()
# kurze Tabellen (bis 12 Zeilen) nicht über Seiten trennen
def keep(m):
    t = m.group(0)
    return t.replace('<table', '<table style="break-inside: avoid"', 1) if t.count('<tr') <= 12 else t
h = re.sub(r'<table.*?</table>', keep, h, flags=re.S)
open('build/handbuch.html', 'w', encoding='utf-8').write(h)
weasyprint.HTML('build/handbuch.html', base_url='.').write_pdf('Kasse-Benutzerhandbuch.pdf')
PY2

# 4) DOCX: pandoc mit angepasster Vorlage, danach Titelseite/Seitenumbrüche
python3 - <<'PY'
import subprocess
from docx import Document
from docx.shared import Pt, RGBColor, Mm
from docx.oxml.ns import qn
ref = 'build/reference.docx'
subprocess.run(['pandoc', '-o', ref, '--print-default-data-file', 'reference.docx'], check=True)
d = Document(ref)
for s in d.sections:
    s.page_width, s.page_height = Mm(210), Mm(297)
    s.left_margin = s.right_margin = Mm(22); s.top_margin = s.bottom_margin = Mm(22)
purple = RGBColor(0x71, 0x4B, 0x67)
byid = {x.style_id: x for x in d.styles}
def setf(sid, size=None, bold=None, color=None, font='Calibri'):
    s = byid.get(sid)
    if s is None: return None
    s.font.name = font
    rpr = s.element.get_or_add_rPr()
    rf = rpr.find(qn('w:rFonts'))
    if rf is not None:
        for a in list(rf.attrib):
            if 'Theme' in a or 'theme' in a: del rf.attrib[a]
        for a in ['w:ascii', 'w:hAnsi', 'w:cs', 'w:eastAsia']: rf.set(qn(a), font)
    if size: s.font.size = Pt(size)
    if bold is not None: s.font.bold = bold
    if color:
        s.font.color.rgb = color
        c = rpr.find(qn('w:color'))
        if c is not None:
            for a in list(c.attrib):
                if 'theme' in a.lower(): del c.attrib[a]
    return s
for n in ['Normal', 'BodyText', 'FirstParagraph', 'Compact']: setf(n, 10.5)
t = setf('Title', 32, True, purple)
if t is not None:
    t.paragraph_format.alignment = 0; t.paragraph_format.space_before = Pt(200)
for n, sz in [('Subtitle', 15), ('Author', 12), ('Date', 12)]:
    x = setf(n, sz, False, RGBColor(0x44, 0x44, 0x44))
    if x is not None: x.paragraph_format.alignment = 0
h1 = setf('Heading1', 17, True, purple)
if h1 is not None: h1.paragraph_format.page_break_before = True
setf('Heading2', 13.5, True, RGBColor(0x4a, 0x30, 0x44)); setf('Heading3', 11.5, True, RGBColor(0x4a, 0x30, 0x44))
setf('TOCHeading', 20, True, purple)
setf('ImageCaption', 9, False, RGBColor(0x55, 0x55, 0x55))
d.save(ref)
PY
pandoc "$BUILD/handbuch.md" "${COMMON[@]}" --to docx --reference-doc "$BUILD/reference.docx" -o "$BUILD/raw.docx"
python3 - "$OUT.docx" <<'PY'
import sys
from docx import Document
from docx.enum.text import WD_BREAK
from docx.oxml.ns import qn
d = Document('build/raw.docx')
body = d.element.body
from docx.oxml import OxmlElement
import copy
# Seitenumbruch nach dem Titelblock (Datum-Absatz), Inhaltsverzeichnis auf eigener Seite
for p in d.paragraphs:
    if p.style.style_id == 'Date':
        p.add_run().add_break(WD_BREAK.PAGE); break
# Inhaltsverzeichnis: statische Einträge in das TOC-Feld schreiben (LibreOffice zeigt sonst nichts;
# Word aktualisiert das Feld beim Öffnen inkl. Seitenzahlen)
heads = []
for p in d.paragraphs:
    sid = p.style.style_id
    if sid in ('Heading1', 'Heading2'):
        heads.append((1 if sid == 'Heading1' else 2, p.text.replace('\t', '  ')))
for fp in body.iter(qn('w:p')):
    instr = fp.find('.//' + qn('w:instrText'))
    if instr is not None and instr.text and instr.text.strip().startswith('TOC'):
        r = fp.find(qn('w:r'))
        end = [c for c in r if c.tag == qn('w:fldChar') and c.get(qn('w:fldCharType')) == 'end'][0]
        r.remove(end)
        anchor = fp
        for lvl, txt in heads:
            np_ = OxmlElement('w:p'); ppr = OxmlElement('w:pPr'); ps = OxmlElement('w:pStyle')
            ps.set(qn('w:val'), f'TOC{lvl}'); ppr.append(ps)
            if lvl == 2:
                ind = OxmlElement('w:ind'); ind.set(qn('w:left'), '440'); ppr.append(ind)
            np_.append(ppr)
            nr = OxmlElement('w:r'); t = OxmlElement('w:t'); t.text = txt
            t.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve'); nr.append(t); np_.append(nr)
            anchor.addnext(np_); anchor = np_
        ep = OxmlElement('w:p'); er = OxmlElement('w:r'); fc = OxmlElement('w:fldChar'); fc.set(qn('w:fldCharType'), 'end')
        er.append(fc); ep.append(er); anchor.addnext(ep)
        break
# Word: Felder beim Öffnen aktualisieren
settings = d.settings.element
uf = OxmlElement('w:updateFields'); uf.set(qn('w:val'), 'true'); settings.append(uf)
# Hinweis-Kasten (Testdaten) sichtbar machen
for p in d.paragraphs:
    if p.text.startswith('Hinweis: Alle in diesem Handbuch'):
        pPr = p._p.get_or_add_pPr()
        shd = OxmlElement('w:shd')
        shd.set(qn('w:val'), 'clear'); shd.set(qn('w:color'), 'auto'); shd.set(qn('w:fill'), 'FFF6E8')
        pPr.append(shd)
        pBdr = OxmlElement('w:pBdr')
        for edge, sz in (('top', '12'), ('left', '24'), ('bottom', '12'), ('right', '12')):
            el = OxmlElement(f'w:{edge}')
            el.set(qn('w:val'), 'single'); el.set(qn('w:sz'), sz); el.set(qn('w:space'), '6'); el.set(qn('w:color'), 'C47D00')
            pBdr.append(el)
        pPr.append(pBdr)
        break
# Tabellen: Rahmen setzen
for t in d.tables:
    tblPr = t._tbl.tblPr
    if tblPr.find(qn('w:tblBorders')) is None:
        borders = OxmlElement('w:tblBorders')
        for e in ['top', 'left', 'bottom', 'right', 'insideH', 'insideV']:
            el = OxmlElement(f'w:{e}'); el.set(qn('w:val'), 'single'); el.set(qn('w:sz'), '4'); el.set(qn('w:color'), 'C9BCC6'); borders.append(el)
        tblPr.append(borders)
d.save(sys.argv[1])
PY

echo "Fertig: $(pwd)/$OUT.pdf ($(pdfinfo $OUT.pdf | awk '/^Pages/{print $2}') Seiten), $(pwd)/$OUT.docx"
