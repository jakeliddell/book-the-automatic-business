# Fonts

The Typst template loads fonts from this directory via `font-paths: [fonts]` in
`_quarto.yml`. Drop the font files here and `quarto render` embeds them.

The build will still succeed **without** these files — the template falls back to
fonts Typst bundles (Libertinus Serif / Sans) — but it won't match the approved
design until the files are present.

## What to put here

| Family (as named in `brand.typ`) | Role | Licence |
|---|---|---|
| **Source Serif 4** (Regular + Italic) | Body copy | SIL OFL — free to embed |
| **Archivo** (Regular + Bold) | Chapter/part/section titles, running heads, labels, figure numbers | SIL OFL — free to embed |
| **JetBrains Mono** (Regular) | Imprint / incidental | SIL OFL — free to embed |
| **Permanent Marker** (Regular) | Figure titles *(inside the diagram SVGs)* | Apache 2.0 — free to embed |
| **Patrick Hand** (Regular) | Figure labels *(inside the diagram SVGs)* | SIL OFL — free to embed |

> **Using a licensed body serif instead?** Put its files here and change the
> first name in `font-serif` inside `brand.typ` to its exact family name. Confirm
> your licence permits **embedding** in a distributed PDF/EPUB.

> **Figure fonts:** Permanent Marker / Patrick Hand are only needed if your
> figure SVGs keep their text as live text. Best practice is to **outline the
> text** in the final diagrams, in which case those two fonts aren't required at
> build time.

## Quick fetch (the OFL/Apache faces)

All five faces above are freely redistributable. Run:

```bash
bash fonts/download.sh
```

This pulls the variable TTFs from the Google Fonts repository into this folder.
You can either commit the files, or add the one line above as a step in the
GitHub Action before `quarto render`.
