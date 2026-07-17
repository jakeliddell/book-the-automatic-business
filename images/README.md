# repo-drop: Figure Plan v2 prompt pack

Drop the contents of this folder over the repo root:

- `figures.md` replaces the old register (old flat-SVG figures are all retired — delete the old `.prompt.md`/`.svg` pairs, or leave them until each replacement lands).
- `images/chNN/*.prompt.md` — 45 figure prompts (cartoons + diagrams). Each file is self-contained: style preamble + scene + exact lettering + alt text + aspect.
- `images/marginalia/*.prompt.md` — 9 one-off author's marks (rationing rule: never reused, max one per chapter).

## Post-production (DONE — files in place)

- Every figure has a `-print.png` sibling: pure grayscale, white-point normalised, full generation resolution. Print/PDF uses these; EPUB uses the original `.jpg` (keeps the incidental colour accents).
- Every marginalia mark has a `.png` sibling: white knocked out to full transparency, ink forced to pure black. Use ONLY the .png in layout; the .jpg is the raw render.

## Workflow

1. **Style test first** — generate these three and check the hand matches the presentation slides: `fig-saas-spaghetti` (ch07), `fig-fashionable-coat` (ch04), `fig-everything-is-fine` (ch14). Iterate the shared preamble if needed before batch-running the rest.
2. Generate chapter by chapter; save each render as `images/chNN/<slug>.png` next to its prompt, update Status in `figures.md`.
3. Generation size: at least 2048px on the long edge (print target ~1200px at 300dpi for a 4in figure — headroom for cropping).
4. Post: convert to pure B&W (threshold or high-contrast grayscale), check lettering spelling — regenerate on any garbled text, it is the most common failure.
5. Marginalia: knock out white to transparency. If the generator's handwriting fights the page, fall back to drawing the stroke only and setting the words in Patrick Hand in Typst.
6. Manuscript wiring: cartoons are placed with no figure number (plain image include); diagrams keep the numbered `{#fig-...}` treatment. Update each chapter's image path when its figure lands.

## Bookends and cross-references

- `fig-holiday-that-isnt` (ch01) and `fig-beach-test` (ch15) are a pair: same beach, same deckchair. Generate ch01 first and feed it as a reference image when generating ch15.
- Recurring robot: keep the robots simple, boxy and friendly; feed one good robot render as reference for later robot figures (ch09, ch11, ch12, ch13, ch14, ch17, ch19) so the 'digital teammate' reads as one species.

## Manuscript wiring (wire_figures.py)

Drop this pack into the repo root, then run:

    python3 wire_figures.py

It removes every old placeholder .svg include and inserts all figures + 7 of 9
marginalia marks at their anchor sentences (see the script's report output).
Idempotent -- safe to re-run. Notes:

- Diagrams are format-split: Typst gets `-print.png`, EPUB gets `.jpg`.
- Marginalia are Typst-only raw blocks. If Typst errors with "file not found"
  on a marginalia path, change `../images/marginalia/` to `images/marginalia/`
  in wire_figures.py's mark() helper and re-run on a clean checkout.
- Two circle marks (ch04, ch19) are NOT auto-placed: they encircle words in
  running text, so they need hand placement during the proof pass.
- The old images/**/fig-*.svg placeholders and their .prompt.md files can be
  deleted once the render looks right.
- After wiring: `quarto render` and check ch05/ch11/ch12 first (densest
  figure placement).
