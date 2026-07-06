// =============================================================================
// The Automatic Business — Quarto Typst template partial
// -----------------------------------------------------------------------------
// Defines the `book(...)` function and all global styling. Paired with
// typst-show.typ, which calls book(...) with the document metadata.
//
// Target: Quarto >= 1.5, Typst >= 0.12.
// Everything is greyscale-first (see brand.typ). No colour in print.
// =============================================================================

#import "brand.typ": *

// --- number words for chapter openers ("Chapter Three") ----------------------
#let chapter-words = (
  "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
  "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen",
  "Seventeen", "Eighteen", "Nineteen", "Twenty", "Twenty-One", "Twenty-Two",
)
#let chapter-word(n) = {
  if n >= 1 and n <= chapter-words.len() { chapter-words.at(n - 1) } else { str(n) }
}

// --- carry the book title into the running heads ------------------------------
#let book-title = state("book-title", [])

// --- best-effort plain-text extraction, used to classify blockquotes ---------
// (epigraph vs. "Try this." box) and to split callout titles.
#let to-plain(it) = {
  if it == none { "" }
  else if type(it) == str { it }
  else if type(it) == content {
    if it.has("text") { it.text }
    else if it.has("children") { it.children.map(to-plain).join("") }
    else if it.has("body") { to-plain(it.body) }
    else if it.has("child") { to-plain(it.child) }
    else { "" }
  } else { "" }
}

// =============================================================================
// CALLOUT  —  the "Case study:" box
// -----------------------------------------------------------------------------
// Quarto renders  ::: {.callout-note icon=false title="Case study: ..."}  as a
// call to #callout(...). We absorb any extra/renamed args with ..rest so this
// keeps working across Quarto versions. Greyscale: closed, grey-filled, rounded,
// dark-on-light label — deliberately distinct from the open "Try this" box.
// =============================================================================
#let callout(body: [], title: none, ..rest) = {
  let t = to-plain(title)
  let parts = t.split(": ")
  let label = if parts.len() > 0 and parts.at(0) != "" { parts.at(0) } else { "Case study" }
  let heading-rest = if parts.len() > 1 { parts.slice(1).join(": ") } else { none }

  block(
    width: 100%,
    fill: panel,
    stroke: 0.75pt + hairline,
    radius: 6pt,
    inset: (x: 16pt, y: 14pt),
    breakable: true,
    above: 1.2em, below: 1.2em,
  )[
    // label row: small square + tracked caps
    #grid(
      columns: (auto, 1fr), gutter: 8pt, align: (horizon + left, horizon + left),
      box(width: 7pt, height: 7pt, fill: ink),
      text(font: font-display, weight: 600, size: 8.5pt, tracking: 0.16em, fill: ink, upper(label)),
    )
    #v(9pt)
    #line(length: 100%, stroke: 0.5pt + panel-line)
    #v(11pt)
    #if heading-rest != none {
      text(font: font-serif, weight: 600, size: 12pt, fill: ink, heading-rest)
      v(6pt)
    }
    #set par(justify: true, first-line-indent: 0pt, leading: body-leading, spacing: body-spacing)
    #set text(size: 10pt)
    #body
  ]
}

// =============================================================================
// BLOCKQUOTES  —  "Try this" box  AND  chapter epigraphs
// -----------------------------------------------------------------------------
// Both are authored as Markdown blockquotes. We tell them apart by content:
//   - starts with "Try this"  -> the closing exercise box
//   - otherwise               -> a chapter epigraph
// The "Try this" box is open (no fill, no side rules), square, heavy top rule —
// the visual opposite of the Case study box, so both read clearly in greyscale.
// =============================================================================
#show quote.where(block: true): it => {
  let plain = to-plain(it.body).trim()

  if plain.starts-with("Try this") {
    // ---- Try this box ----
    block(width: 100%, breakable: false, above: 1.5em, below: 1.2em)[
      #line(length: 100%, stroke: 2.2pt + ink)
      #v(12pt)
      #set par(justify: true, first-line-indent: 0pt, leading: body-leading, spacing: body-spacing)
      #it.body
      #v(12pt)
      #line(length: 100%, stroke: 0.6pt + ink)
    ]
  } else {
    // ---- Epigraph ----
    block(width: 100%, above: 0.4em, below: 1.6em)[
      #set text(style: "italic", size: 12pt, fill: ink)
      #set par(justify: false, leading: 0.7em, spacing: 0.5em)
      #it.body
    ]
  }
}

// =============================================================================
// FIGURES  —  full-width flat diagrams, numbered "Figure 3.1"
// =============================================================================
#show figure: it => {
  set align(center)
  block(above: 1.4em, below: 1.4em, it)
}
#show figure.caption: it => {
  set text(font: font-serif, style: "italic", size: 9.5pt, fill: ink-soft)
  set par(justify: false, leading: 0.6em)
  // "Figure 3.1" prefix set in the display face, upright
  [#text(font: font-display, style: "normal", weight: 600, fill: ink)[#it.supplement~#context it.counter.display(it.numbering)]#it.separator#it.body]
}

// =============================================================================
// The book template function
// =============================================================================
#let book(
  title: [],
  subtitle: [],
  author: [],
  toc: false,
  body,
) = {
  set document(title: to-plain(title), author: to-plain(author))
  book-title.update(title)

  // --- running heads: book title (verso) / chapter title (recto), mirrored ---
  let running-header = context {
    let p = here().page()
    // suppress on front matter and on any chapter-opening page
    let numbered = query(heading.where(level: 1)).filter(h => h.numbering != none)
    if numbered.len() == 0 { return }
    let first-page = numbered.first().location().page()
    if p < first-page { return }
    let opens-here = query(heading.where(level: 1)).any(h => h.location().page() == p)
    if opens-here { return }

    set text(font: font-display, size: 8pt, tracking: 0.18em, fill: ink-soft)
    if calc.even(p) {
      // verso
      align(left, upper(book-title.get()))
    } else {
      // recto — nearest chapter title above this point
      let above = query(heading.where(level: 1).before(here()))
      let chap = if above.len() > 0 { above.last().body } else { [] }
      align(right, upper(chap))
    }
  }

  let running-footer = context {
    let p = here().page()
    let numbered = query(heading.where(level: 1)).filter(h => h.numbering != none)
    if numbered.len() == 0 { return }
    if p < numbered.first().location().page() { return }
    set text(font: font-display, size: 9pt, fill: ink-soft)
    // folio at the outer edge (mirrored)
    if calc.even(p) { align(left, str(p)) } else { align(right, str(p)) }
  }

  set page(
    width: page-width,
    height: page-height,
    margin: (inside: page-inside, outside: page-outside, top: page-top, bottom: page-bottom),
    binding: left,
    header: running-header,
    header-ascent: 40%,
    footer: running-footer,
    footer-descent: 30%,
  )

  // --- base text + paragraph style (block paragraphs, no indent, airy) -------
  set text(
    font: font-serif,
    size: body-size,
    fill: ink,
    lang: "en",
    region: "gb",
    hyphenate: true,
  )
  set par(
    justify: true,
    first-line-indent: 0pt,
    leading: body-leading,
    spacing: body-spacing,
  )

  // --- chapter openers (level 1) ---------------------------------------------
  show heading.where(level: 1): it => {
    pagebreak(to: "odd", weak: true)   // chapters open on a right-hand page
    let numbered = it.numbering != none
    set text(font: font-display, fill: ink, hyphenate: false)
    v(1.05in)
    if numbered {
      context {
        let n = counter(heading).at(it.location()).first()
        text(size: 12pt, weight: 600, tracking: 0.28em, fill: ink-faint, upper[Chapter #chapter-word(n)])
      }
      v(13pt)
    }
    text(size: 25pt, weight: 700)[#it.body]
    v(16pt)
    line(length: 44pt, stroke: 1.1pt + ink)
    v(24pt)
  }

  // --- section headings (level 2): one level, Title Case, no numbers ----------
  show heading.where(level: 2): it => {
    block(above: 1.5em, below: 0.55em)[
      #set text(font: font-display, weight: 600, size: 13.5pt, fill: ink, hyphenate: false)
      #it.body
    ]
  }
  // deeper levels, if ever used, stay quiet
  show heading.where(level: 3): it => {
    block(above: 1.2em, below: 0.4em)[
      #set text(font: font-display, weight: 600, size: 11.5pt, fill: ink-soft)
      #it.body
    ]
  }

  // --- footnotes -------------------------------------------------------------
  set footnote.entry(separator: line(length: 30%, stroke: 0.5pt + hairline))
  show footnote.entry: set text(size: 8.5pt, fill: ink-soft)

  // --- links (greyscale in print) --------------------------------------------
  show link: set text(fill: ink)

  // ===========================================================================
  // FRONT MATTER — half-title + title page (rendered by the template)
  // ===========================================================================
  // Half-title (recto)
  set page(header: none, footer: none)
  v(2.1in)
  align(center, text(font: font-display, weight: 700, size: 20pt, fill: ink, title))

  // Title page (recto)
  pagebreak(to: "odd", weak: true)
  v(1.5in)
  align(center)[
    #text(font: font-display, weight: 800, size: 33pt, tracking: -0.01em, fill: ink, upper(title))
    #v(26pt)
    #line(length: 46pt, stroke: 1pt + ink)
    #v(26pt)
    #text(font: font-serif, style: "italic", size: 15pt, fill: ink-soft, subtitle)
  ]
  place(bottom + center, dy: -1.25in)[
    #align(center)[
      #text(font: font-display, weight: 600, size: 13pt, tracking: 0.2em, fill: ink, upper(author))
      #v(9pt)
      #text(font: font-serif, style: "italic", size: 10pt, fill: ink-soft)[Foreword by Thomas Power]
      #v(30pt)
      #text(font: font-mono, size: 8pt, tracking: 0.18em, fill: ink-faint)[AUTOMATIC BUSINESS PRESS]
    ]
  ]

  // restore chrome for the body
  set page(header: running-header, footer: running-footer)

  // optional table of contents
  if toc {
    pagebreak(to: "odd", weak: true)
    show outline.entry: set text(font: font-serif)
    set outline(depth: 1, indent: auto)
    v(0.9in)
    text(font: font-display, weight: 700, size: 20pt, fill: ink)[Contents]
    v(18pt)
    outline(title: none)
  }

  // ===========================================================================
  // BODY  (copyright, poem, foreword, introduction, chapters, afterword, …)
  // ===========================================================================
  body
}
