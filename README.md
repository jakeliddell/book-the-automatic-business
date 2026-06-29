# The Automatic Business

Book manuscript for *The Automatic Business* by Jake Liddell.

**Status (June 2026): full first draft complete.** All 18 chapters plus the front and back matter are written and live in `manuscript/` and `index.md`. The "company second brain" concept is named **Keystone** in the book (see `manuscript/07-second-brain-concept.md`). Remaining work: replace placeholder figures with designed images, a full editorial pass, and a first end-to-end Quarto build. **This repository is the single source of truth for the book; do not work from any older copy in Google Drive.**

Single source of truth: plain markdown, one file per chapter, built to a KDP
paperback PDF and a Kindle EPUB with [Quarto](https://quarto.org). The same
markdown is also the cornerstone of the company second brain (the Keystone).

## Layout

- `manuscript/` — the chapters and front/back matter, one `.md` per piece (chapters `01`–`18`, plus `foreword`, `introduction`, `intermission`, `copyright`, `tools-pullout`, `back-cover`).
- `index.md` — Read This First (the book's opening page).
- `images/chNN/` — figures, each paired with a versioned `.prompt.md`.
- `figures.md` — the figure register.
- `reference/` — the reader brief, restructure blueprint, and content architecture (planning docs; the blueprint and architecture carry "superseded" banners).
- `_quarto.yml` — book config and build formats.
- `_build/` — generated PDF and EPUB (git-ignored).

## Build

```bash
quarto render            # builds PDF + EPUB into _build/
```

See `reference/CONTENT_ARCHITECTURE.md` for the full pipeline and
`reference/RESTRUCTURE_BLUEPRINT.md` for the original chapter plan.
