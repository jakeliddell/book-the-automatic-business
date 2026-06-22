# The Automatic Business

Book manuscript for *The Automatic Business* by Jake Liddell.

Single source of truth: plain markdown, one file per chapter, built to a KDP
paperback PDF and a Kindle EPUB with [Quarto](https://quarto.org). The same
markdown is the cornerstone of the company second brain.

## Layout

- `manuscript/` — the chapters, one `.qmd` per chapter.
- `images/chNN/` — figures, each paired with a versioned `.prompt.md`.
- `figures.md` — the figure register.
- `reference/` — the reader brief, restructure blueprint, and content architecture.
- `_quarto.yml` — book config and build formats.
- `_build/` — generated PDF and EPUB (git-ignored).

## Build

```bash
quarto render            # builds PDF + EPUB into _build/
```

See `reference/CONTENT_ARCHITECTURE.md` for the full pipeline and
`reference/RESTRUCTURE_BLUEPRINT.md` for the chapter plan.
