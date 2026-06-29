> **STATUS — June 2026: the manuscript is complete; this remains the live build and architecture reference.**
>
> All chapters are drafted and committed (`manuscript/` and `index.md`). Two details below have moved on since this was written: the manuscript files are `.md`, not `.qmd` as the examples show (switched for Shockwave compatibility; Quarto renders `.md` perfectly well for prose), and the "company second brain" is named **Keystone** in the finished book. The pipeline itself, single-source markdown built with Quarto to a KDP PDF and EPUB, version-controlled in GitHub, with the figure-and-prompt workflow, is otherwise current.

---

# THE AUTOMATIC BUSINESS

## Content Architecture

How the book's content is stored, written, versioned, and turned into the things we ship. The goal is a single source of truth, in plain markdown, that serves two masters at once: our own company second brain, and Amazon's print and Kindle pipelines. We write once. The build produces everything else.

---

### 1. The core principle: one source, many outputs

The manuscript lives as plain markdown, one file per chapter. Everything else is generated from it.

```
  Existing PDFs ──► markdown (one file per chapter)
                          │
                          ├──► The company second brain (the markdown IS the source)
                          │
                          └──► Quarto build ──► print-ready PDF  ──► Amazon KDP paperback
                                            └──► reflowable EPUB ──► Amazon KDP Kindle
```

Because the source is plain text, it diffs cleanly in Git, it is readable by any LLM without conversion, and it never traps us in one vendor's tool again. No more copy-paste back into Reedsy.

---

### 2. Recommended toolchain: Quarto

[Quarto](https://quarto.org/docs/books/) is a publishing system built for exactly this job: a folder of markdown chapters rendered to PDF and EPUB (and HTML) from one command. It sits on top of Pandoc and adds book structure, parts and appendices, automatic chapter numbering, and cross-references that reach across chapters (so a figure reference resolves to "Figure 7.2" automatically).

Why Quarto over the alternatives:

- **Versus raw Pandoc plus a LaTeX template.** Pandoc is the engine underneath Quarto. We could drive it directly, and it gives total control, but we would be hand-building the book scaffolding, cross-referencing, and templates that Quarto already provides. Pandoc stays our fallback for any edge case.
- **Versus Word or Reedsy.** Those are the trap we are leaving: binary files, no clean version history, manual re-export, and no second-brain reuse.
- **PDF engine.** Quarto can render PDF through LaTeX or, now, through [Typst](https://typst.app/), which compiles around ten times faster and is far easier to template. We use Typst for the print PDF unless we hit something it cannot do, with LaTeX as the fallback.

Quarto and the PDF engine install once. Renders can run on my side during our sessions, so you are never blocked on local setup.

---

### 3. Getting the existing draft into markdown

The current draft is eighteen PDFs. We bootstrap them into markdown, then rewrite against the blueprint (we are re-aiming and expanding heavily, so this is a starting point, not a faithful conversion).

- Tooling options: [Marker](https://github.com/datalab-to/marker) is strongest for book-structured documents; [MarkItDown](https://github.com/microsoft/markitdown) (Microsoft) is simple and LLM-oriented. The known weakness of every converter is heading and outline recognition, but we have the Contents page to reconstruct the hierarchy, and the source PDFs are clean text, so quality will be high.
- Process: convert each PDF to raw markdown, drop it into the chapter file it maps to in the blueprint, then rewrite. The conversion saves retyping; the thinking is still ours.

---

### 4. Repository structure

One Git repository holds everything: manuscript, images, build config, and the reference documents we have already written.

```
the-automatic-business/
├─ _quarto.yml                 Book config: parts, chapter order, formats, trim size
├─ README.md                   How to build, conventions
├─ manuscript/
│  ├─ index.qmd                Read This First (front matter)
│  ├─ preface.qmd
│  ├─ introduction.qmd
│  ├─ 01-you-are-the-bottleneck.qmd
│  ├─ 02-technician-to-architect.qmd
│  ├─ 03-the-triage.qmd
│  ├─ ...                       one file per chapter, numbered
│  └─ tools-pullout.qmd
├─ images/
│  ├─ ch03/
│  │   ├─ fig-triage-grid.png
│  │   └─ fig-triage-grid.prompt.md     the generation prompt, versioned
│  └─ ...
├─ figures.md                  Image register: ID, chapter, status, prompt link, alt text
├─ templates/                  KDP print template (trim, margins, fonts)
├─ _build/                     Generated PDF and EPUB (git-ignored; shipped via Releases)
└─ reference/
   ├─ MASTER_BRIEF_The_Reader.md
   ├─ RESTRUCTURE_BLUEPRINT.md
   └─ CONTENT_ARCHITECTURE.md
```

---

### 5. Image management and the "think in figures" principle

Images are first-class content, not an afterthought at the end. This is a writing principle, not just a storage decision.

**While writing, we ask of every concept: would one diagram or image make this land faster?** If yes, we create a figure slot there and then. The book should teach visually as well as in prose.

Each figure has five things:

1. A stable ID, for example `fig-triage-grid`, used in the manuscript and the register.
2. A slot in the chapter, using Quarto's figure syntax so it cross-references automatically: `![The HAI triage grid.](../images/ch03/fig-triage-grid.png){#fig-triage-grid}`, referred to in the text as `@fig-triage-grid`.
3. A prompt file stored next to the image (`fig-triage-grid.prompt.md`), holding the exact brief we give to Claude (or another image tool). Because the prompt is versioned, any image is regenerable and improvable.
4. Alt text, for accessibility and for the EPUB.
5. A row in `figures.md`, the register, tracking status (needed, drafted, final), the chapter, and a link to the prompt.

Workflow: as we draft, we note the figure need and write the prompt. Claude Design (or image generation) produces the asset from the prompt. We drop it into the chapter's image folder, mark it final in the register, and the build pulls it into the PDF and EPUB automatically.

A note on Git and binaries: images do not diff like text and can bloat history. We keep them optimised, keep the prompts as text (the real source), and if the image set grows large we move them to Git LFS.

---

### 6. The Amazon KDP outputs

Amazon accepts two things from us, both generated by the build.

**Paperback (print).** A print-ready PDF is the only format that gives full control over the printed page, and KDP accepts it directly. The build produces it to spec: a fixed trim size (6 x 9 inches / 152 x 229 mm is the business-book default, to confirm), inside and outside margins with a gutter that scales to page count, embedded fonts, and bleed only if any image runs to the page edge. KDP can also accept DOCX, RTF, HTML, and TXT and convert them, but we use print-ready PDF so the layout is ours, not theirs.

**Kindle (ebook).** A reflowable EPUB. EPUB is the industry standard and KDP's preferred ebook input; we upload it directly and KDP handles the rest. Quarto renders this from the same source with `quarto render --to epub`.

The cover is produced separately (KDP cover specs differ from the interior) and is not part of the manuscript pipeline.

Sources for the format requirements: [KDP ebook formats](https://kdp.amazon.com/en_US/help/topic/G200634390), [KDP paperback guidelines](https://kdp.amazon.com/en_US/help/topic/G201857950).

---

### 7. Version control: GitHub

The manuscript lives in a private GitHub repository (`jakeliddell/book-the-automatic-business`). A private repo gives us, for free:

- **Tracked changes on the prose.** Every edit is a commit with a clear before-and-after diff, because markdown is plain text. This is real change tracking, unlike comparing two PDF exports.
- **Branches for experiments.** Try a chapter rewrite on a branch, compare, keep or discard, without risking the main draft.
- **The repo doubles as the second-brain source.** The same markdown that ships the book feeds the company knowledge base.
- **Built artifacts via Releases.** Each milestone PDF and EPUB is tagged and downloadable, so we always know which file went to Amazon.
- **Optional automation.** A GitHub Action can render the PDF and EPUB on every push, so the latest build is always available without anyone running a command.
- **Issues as a to-do list.** One issue per chapter or per figure, tracking what is drafted, reviewed, and final.

The one caveat is binary images, handled as in section 5 (optimise, version the prompts, LFS if needed). Placeholder figures are committed as SVG (plain text) so they diff cleanly until the designed assets replace them.

---

### 8. Settled decisions

- Toolchain: Quarto, with Typst for the PDF engine and LaTeX as fallback.
- Repository: private GitHub repo, seeded with the converted test chapter, the figure scaffolding, and the three reference documents.
- Trim size: 6 x 9 inches (provisional, confirmed default for the build).
- Pipeline proven: a converted chapter rendered end to end to a 6 x 9 print PDF and a reflowable EPUB before writing in earnest.

*The Automatic Business. Content Architecture. Works alongside the reader brief and the restructure blueprint.*
