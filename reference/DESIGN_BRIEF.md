# Design brief: interior design for The Automatic Business (print PDF + EPUB)

**What this is.** A complete interior design for a professionally published business book, delivered as a working Typst template that drops into our existing build pipeline. Not a mockup: the deliverable is code and font files that render the real book.

**The book.** *The Automatic Business: Do What Only You Can Do* by Jake Liddell. A plain-English, anti-hype business book teaching small business owners how to escape being the bottleneck using automation and AI. Twenty chapters in four parts, plus front matter (Read This First, copyright, a standalone poem page, foreword, introduction), a mid-book intermission page, an afterword written as a personal letter, a tools directory, and a back cover page. Roughly 35,000 words; expect a 200 to 240 page paperback.

**The reader and the feel.** The reader is a non-technical owner of a small service business: capable, busy, sceptical of hype, tired of being sold to. The design must feel like a well-made trade business book from a serious publisher: calm, confident, warm, and effortlessly readable. Generous white space, a proper book serif, nothing gimmicky. British in tone. The book's voice is direct and personal, and the design should stay out of its way. Benchmark production quality: Atomic Habits, Company of One.

**Current palette** (from the book's figure placeholders; confirm or evolve, and align with theautomaticbusiness.co.uk): warm off-white `#F7F5F1`, panel `#EFEAE1`, ink `#2A2A28`, accent terracotta `#B5632F`.

## Interior colour: decided - black and white

The KDP paperback prints with a black-and-white interior. This is settled, not open for recommendation: colour printing is priced per page across the whole book regardless of how much colour each page uses, the premium is significant, and for a text-driven business book it buys nothing a reader would pay for. Colour comes out of book profit on every copy sold, so we spend it elsewhere.

Design **greyscale-first, with no exceptions.** Every element - chapter openers, part dividers, diagrams, captions, running heads, and both call-out boxes - must read perfectly with zero colour information and must be tested at actual print greyscale, not judged on screen. The terracotta accent exists only as a screen-only enhancement layer for the EPUB and PDF; nothing structural or meaning-bearing may depend on it.

Pay particular attention to the **boxed call-outs.** With no colour to lean on, the "Case study:" and "Try this." boxes must be clearly distinct from body text, and from each other, using tone, rule weight, shape, and padding alone. Prove this in greyscale in the sample spreads.

## Recurring elements to design

All conventions already exist in the manuscript.

1. **Chapter openers:** chapter number, title, then an epigraph (italic one-line quote with attribution on its own line, no dash). Every chapter has one. This page sets the tone of the whole book.
2. **Body text:** font choice (licensed for embedding, files supplied), size, leading, justified setting, paragraph style (book-standard first-line indents, no gaps). Section headings within chapters (one level, frequent, currently Title Case).
3. **Part divider pages** (four parts, titled).
4. **Boxed call-outs,** two kinds, same family: "Case study: ..." boxes (border, light grey fill, rounded corners) and the "Try this." box that closes every chapter. Both must be distinct in greyscale.
5. **Running headers/footers and page numbers,** mirrored verso/recto, book conventions (chapter title recto, book title verso or your recommendation).
6. **Figures:** full-width flat vector diagrams with captions (numbered automatically, "Figure 7.1" style). Greyscale line-and-tone, no reliance on hue. Caption styling needed. The diagram style itself is a separate job, but see `images/*/*.prompt.md` in the repo for the intended "calm and clear, not cartoonish" direction.
7. **Footnotes** (used in three chapters) and the table of contents.
8. **Front matter:** half-title, title page, copyright page, the poem page (a single short poem, centred, no explanation), and the afterword styled slightly apart as a personal letter.

## Print constraints (Amazon KDP paperback)

Trim 5.5 x 8.5 in (a standard KDP trim, the "digest" trade format; black-and-white interior supported). Typst has no named paper size for this, so the template must set explicit page dimensions (width 5.5in, height 8.5in) rather than a papersize keyword. Mirrored margins with inner (gutter) at least 0.75 in for a 151 to 300 page book - KDP gutter minimums are set by page count, not trim, so this band still applies - outer 0.5 in, top 0.75 in, bottom 0.6 in; final gutter to be set once page count is known. Note the narrower page: these outer, top and bottom values sit comfortably above KDP minimums and will pull the text block in on a 5.5 in wide page, so confirm the resulting line length still reads well before finalising. All fonts embedded. No bleed unless an image runs to the page edge.

## Technical delivery (must-haves)

- Quarto renders this book with `format: typst`. Deliver the design as Quarto Typst template partials (`typst-template.typ` and `typst-show.typ`), plus a `fonts/` directory with the licensed font files, loaded via font-paths, and any brand token file you need. It must build with a plain `quarto render` and no manual steps: our GitHub Action is the test.
- Style Quarto's callout markup for the case-study boxes (they are authored as `::: {.callout-note icon=false title="Case study: ..."}`) and blockquote-based Try this boxes.
- The EPUB is a separate, smaller deliverable: a CSS pass that echoes the same design, and the only place the terracotta accent is applied.

## Process

Before building the full template, show sample spreads as a short PDF: one chapter opener with epigraph, one body spread with a section heading, one page with a case-study box and a Try this box, one part divider, and the title page. All shown in print greyscale. We approve the direction, then you deliver the working template.

## Materials provided

The repo (manuscript in markdown, `_quarto.yml`, figure register), the current undesigned PDF for content reference, and the website for brand alignment.
