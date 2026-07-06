# Interior design — Quarto + Typst template

The working interior for **The Automatic Business**. Drop these files into the
book repo and `quarto render` produces the designed PDF (print) and EPUB (screen)
with no manual steps.

Design: 5.5 × 8.5″ KDP digest trim, black-and-white interior, warm book serif
(Source Serif 4) with an Archivo display face, airy block paragraphs, hand-drawn
figures. Matches the approved sample spreads.

## Files

```
_quarto.yml            # format block wired to the partials, fonts, EPUB css
typst-template.typ     # all print styling: page, type, openers, callouts, figures, running heads
typst-show.typ         # passes title/subtitle/author/toc into the template
brand.typ              # design tokens — fonts, greyscale palette, sizes, margins (edit here)
fonts/                 # font files live here (README + download.sh)
styles/epub.css        # EPUB pass — the only place terracotta is used
```

## Install

1. Copy `typst-template.typ`, `typst-show.typ`, `brand.typ` to the repo root.
2. Copy `fonts/` and `styles/` to the repo root.
3. Merge the `format:`, `number-sections`, and `crossref:` blocks from this
   `_quarto.yml` into the repo's existing `_quarto.yml` (the `book:` chapter list
   here matches the current one, so you can also just replace the file).
4. Get the fonts: `bash fonts/download.sh` (or commit them). See `fonts/README.md`.
5. `quarto render` → PDF in `_build/`, EPUB alongside.

**Targets:** Quarto ≥ 1.5, Typst ≥ 0.12 (Typst is bundled in Quarto — no separate
install). Everything builds even before the font files are added; it falls back to
Typst's bundled Libertinus faces until then.

## How the manuscript conventions map

No re-authoring needed for the main elements — the template reads the existing markup:

- **Chapter opener + epigraph** — the chapter `# H1` becomes the opener (with
  "Chapter Three" set automatically); the blockquote beneath it is styled as the
  epigraph (italic quote, attribution on its own line).
- **"Try this" box** — any blockquote beginning `> **Try this.** …` is rendered
  as the open, heavy-top-rule box. (Epigraph vs. Try-this is detected by content.)
- **Case study box** — `::: {.callout-note icon=false title="Case study: …"}`
  renders as the closed, grey-filled, rounded panel. The title text after the
  colon becomes the panel's bold sub-heading.
- **Figures** — `![caption](…svg){#fig-…}` → centred figure, caption set as
  *Figure 3.1  caption…*.
- **Section headings** — `## Title Case` → Archivo, one level, unnumbered.

## Swapping in a licensed body serif

Edit one line in `brand.typ` (`font-serif`), drop the font files in `fonts/`, and
confirm the licence permits embedding. Everything else follows.

## Known follow-ups (quick tuning after the first CI build)

These are deliberately called out rather than guessed, since they depend on your
Quarto version's output, which is best confirmed against the GitHub Action:

- **Part dividers** — Quarto renders `part:` entries; the exact hook may need a
  small `#show` rule once we see how your version emits them.
- **Front-matter specials** — copyright page (plain), the poem page (centred),
  and the afterword (personal-letter voice) currently render as understated
  chapter openers. Each is a short add once we confirm the div/class Quarto emits.
- **Chapter-number wording / figure numbering** — verify "Chapter Three" and
  "Figure 3.1" read correctly; both are easy to adjust if your Quarto drives
  numbering differently.

If the Action reports a Typst error or any of the above looks off, send me the
output and I'll turn it around quickly.
