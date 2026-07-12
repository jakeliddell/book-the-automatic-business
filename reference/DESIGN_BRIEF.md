# Design brief: interior design for The Automatic Business (print PDF + EPUB)

**What this is.** A complete interior design for a professionally published business book, delivered as a working Typst template that drops into our existing build pipeline. Not a mockup: the deliverable is code and font files that render the real book.

**The book.** *The Automatic Business: Do What Only You Can Do* by Jake Liddell. A plain-English, anti-hype business book teaching small business owners how to escape being the bottleneck using automation and AI. Twenty chapters in four parts, plus front matter (Read This First, copyright, a standalone poem page, foreword, introduction), a mid-book intermission page, an afterword written as a personal letter, a tools directory, and a back cover page. Roughly 35,000 words; expect a 200 to 240 page paperback.

**The reader and the feel.** The reader is a non-technical owner of a small service business: capable, busy, sceptical of hype, tired of being sold to. The design must feel like a well-made trade business book from a serious publisher: calm, confident, warm, and effortlessly readable. Generous white space, a proper book serif, nothing gimmicky. British in tone. The book's voice is direct and personal, and the design should stay out of its way. Benchmark production quality: Atomic Habits, Company of One.

**Palette (from the book's figure placeholders; confirm or evolve, and align with theautomaticbusiness.co.uk):** warm off-white #F7F5F1, panel #EFEAE1, ink #2A2A28, accent terracotta #B5632F.

**Decision, already made: the print interior is BLACK AND WHITE.** Colour print costs would consume the per-copy profit and buyers of business books neither expect nor reward colour interiors. Therefore: design greyscale-first. Nothing in the print design may rely on hue to carry meaning; boxes, headings, figures and emphasis must work in pure greyscale using weight, tint and structure. The accent terracotta is an enhancement layer applied only to the EPUB and screen PDF, where colour is free.

**Recurring elements to design (all conventions already exist in the manuscript):**

1. Chapter openers: chapter number, title, then an epigraph (italic one-line quote with attribution on its own line, no dash). Every chapter has one. This page sets the tone of the whole book.
2. Body text: font choice (licensed for embedding, files supplied), size, leading, justified setting, paragraph style (book-standard first-line indents, no gaps). Section headings within chapters (one level, frequent, currently Title Case).
3. Part divider pages (four parts, titled).
4. Boxed call-outs, two kinds, same family: "Case study: ..." boxes (border, shaded background, rounded corners) and the "**Try this.**" box that closes every chapter.
5. Running headers/footers and page numbers, mirrored verso/recto, book conventions (chapter title recto, book title verso, or your recommendation).
6. Figures: full-width flat vector diagrams with captions (numbered automatically, "Figure 7.1" style). Caption styling needed. The diagram style itself is a separate job, but see images/*/*.prompt.md in the repo for the intended "calm and clear, not cartoonish" direction. Figures must carry their meaning in greyscale.
7. Footnotes (used in three chapters) and the table of contents.
8. Front matter: half-title, title page, copyright page, the poem page (a single short poem, centred, no explanation), and the afterword styled slightly apart as a personal letter.

**Print constraints (Amazon KDP paperback):** trim 6 x 9 in (Typst papersize us-trade). Mirrored margins with inner (gutter) at least 0.75 in for a 151 to 300 page book, outer 0.5 in, top 0.75 in, bottom 0.6 in; final gutter to be set once page count is known. All fonts embedded. No bleed unless an image runs to the page edge.

**Technical delivery (must-haves):**

- Quarto renders this book with `format: typst`. Deliver the design as Quarto Typst template partials (typst-template.typ and typst-show.typ), plus a fonts/ directory with the licensed font files, loaded via font-paths, and any brand token file you need. It must build with a plain `quarto render` and no manual steps: our GitHub Action is the test.
- Style Quarto's callout markup for the case-study boxes (they are authored as `::: {.callout-note icon=false title="Case study: ..."}`) and the blockquote-based Try this boxes.
- The EPUB is a separate, smaller deliverable: a CSS pass that echoes the same design, and the one place the accent colour appears.

**Process:** before building the full template, show sample spreads as a short PDF: one chapter opener with epigraph, one body spread with a section heading, one page with a case-study box and a Try this box, one part divider, and the title page. We approve the direction, then you deliver the working template.

**Materials provided:** the repo (manuscript in markdown, _quarto.yml, figure register), the current undesigned PDF for content reference, and the website for brand alignment.
