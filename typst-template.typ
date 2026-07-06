// =============================================================================
// The Automatic Business — Quarto Typst template partial
// -----------------------------------------------------------------------------
// Defines book(...), callout(...) and part(...) plus all global styling. Paired
// with typst-show.typ, which calls book(...) with the document metadata.
//
// Target: Quarto >= 1.5, Typst >= 0.12. Greyscale-first (see brand.typ).
//
// Round-two review fixes are marked [B]/[C1..C4]/[D1..D4] against the findings.
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

// --- front/back matter H1s that are NOT numbered chapters --------------------
#let front-back-titles = (
  "Important: Read This First",
  "Copyright",
  "Come to the Edge",
  "Foreword",
  "Introduction",
  "A Quick Favour",
  "The Tools: A Working Directory",
  "Back Cover",
)
// ...of which these are excluded from the table of contents [C3]:
#let toc-exclude = ("Copyright", "Come to the Edge", "Back Cover", "A Quick Favour")

// --- state & helpers ---------------------------------------------------------
// [C1] Chapter ordinals are derived by counting <ab-chapter-start> markers.
// This is query-based (deterministic) rather than a counter stepped inside a
// show rule, which can double-count across Typst's layout passes. It also does
// not depend on whether Quarto sets Typst's native heading numbering — that was
// why "Chapter One" was missing in the first build.
#let book-title = state("book-title", [])
#let fm-mode    = state("fm-mode", "normal")  // normal | copyright | poem | letter
#let chapters-before(loc) = query(selector(<ab-chapter-start>).before(loc, inclusive: true)).len()

// --- best-effort plain-text extraction (classify blockquotes, split titles) --
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
// Repair the space that extraction drops after a colon ("A: B" -> "A:B"), so
// titles like "Part One: Why ..." and "The Tools: A ..." match reliably.
#let norm-title(s) = s.trim().replace(": ", ":").replace(":", ": ")

// =============================================================================
// CALLOUT — the "Case study:" box (Quarto calls #callout for .callout-note).
// ..rest absorbs any version-specific args. Closed, grey-filled, rounded —
// deliberately distinct from the open "Try this" box.
// =============================================================================
#let callout(body: [], title: none, ..rest) = {
  let t = to-plain(title)
  let parts = t.split(": ")
  let label = if parts.len() > 0 and parts.at(0) != "" { parts.at(0) } else { "Case study" }
  let heading-rest = if parts.len() > 1 { parts.slice(1).join(": ") } else { none }

  block(
    width: 100%, fill: panel, stroke: 0.75pt + hairline, radius: 6pt,
    inset: (x: 16pt, y: 14pt), breakable: true, above: 1.2em, below: 1.2em,
  )[
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
// PART — Quarto emits #part[Part One: Title] for each `part:` entry.
// [C3] We emit an OUTLINED level-1 heading so the part shows in the Contents;
// the level-1 heading rule below detects the "Part " prefix and draws the
// divider. (Previously the part was drawn directly and never reached the TOC.)
// =============================================================================
#let part(title) = {
  heading(level: 1, outlined: true)[#title]
}

// =============================================================================
// The book template function
// =============================================================================
#let book(title: [], subtitle: [], author: [], toc: false, body) = {
  set document(title: to-plain(title), author: to-plain(author))
  book-title.update(title)

  // ---- running heads: book title (verso) / chapter title (recto) -----------
  let running-header = context {
    let p = here().page()
    let bs = query(<ab-chapter-start>)
    if bs.len() == 0 or p < bs.first().location().page() { return }
    // suppress on any page where a level-1 heading opens (chapter/part/opener)
    if query(heading.where(level: 1)).any(h => h.location().page() == p) { return }
    set text(font: font-display, size: 8pt, tracking: 0.18em, fill: ink-soft)
    if calc.even(p) {
      align(left, upper(book-title.get()))
    } else {
      let above = query(heading.where(level: 1).before(here()))
      let chap = if above.len() > 0 { above.last().body } else { [] }
      align(right, upper(chap))
    }
  }

  // ---- folios [C4]: roman front matter, arabic restarting at Chapter One ----
  let running-footer = context {
    let p = here().page()
    let bs = query(<ab-chapter-start>)
    let bstart = if bs.len() > 0 { bs.first().location().page() } else { 0 }
    set text(font: font-display, size: 9pt, fill: ink-soft)
    let label = if bstart != 0 and p >= bstart {
      numbering("1", p - bstart + 1)   // arabic from Chapter One (page 1)
    } else {
      numbering("i", p)                // roman for front matter
    }
    if calc.even(p) { align(left, label) } else { align(right, label) }
  }

  set page(
    width: page-width, height: page-height,
    margin: (inside: page-inside, outside: page-outside, top: page-top, bottom: page-bottom),
    binding: left,
    header: running-header, header-ascent: 40%,
    footer: running-footer, footer-descent: 30%,
  )

  // ---- base text + airy block paragraphs -----------------------------------
  set text(font: font-serif, size: body-size, fill: ink, lang: "en", region: "gb", hyphenate: true)
  set par(justify: true, first-line-indent: 0pt, leading: body-leading, spacing: body-spacing)

  // ---- [B] front/back-matter paragraph modes (copyright small, poem centred) 
  show par: it => context {
    let m = fm-mode.get()
    if m == "copyright" { text(size: 8.5pt, fill: ink-soft, it) }
    else if m == "poem" { align(center, it) }
    else if m == "letter" {
      if to-plain(it.body).trim() == "Jake" {
        v(6pt) ; text(font: font-display, style: "italic", size: 14pt, fill: ink)[Jake]
      } else { it }
    }
    else { it }
  }

  // ---- HEADINGS ------------------------------------------------------------
  show heading.where(level: 1): it => {
    let ttl = norm-title(to-plain(it.body))
    set par(justify: false)                       // [D1] no justification on display
    set text(font: font-display, fill: ink, hyphenate: false)

    if ttl.starts-with("Part ") and ttl.contains(":") {
      // ---- [D2] PART DIVIDER: "PART ONE" kicker over a large mixed-case title
      let bits = ttl.split(": ")
      let label = bits.at(0)
      let name = bits.slice(1).join(": ")
      pagebreak(to: "odd", weak: true)
      page(header: none, footer: none)[
        #set align(center + horizon)
        #set par(justify: false)
        #block[
          #text(font: font-display, weight: 600, size: 13pt, tracking: 0.32em, fill: ink-faint, upper(label))
          #v(22pt)
          #line(length: 44pt, stroke: 1pt + ink)
          #v(26pt)
          #text(font: font-display, weight: 800, size: 28pt, fill: ink)[#name]
        ]
      ]
    } else if ttl == "Copyright" {
      // ---- [B] COPYRIGHT: quiet, small print, no big title ----
      fm-mode.update("copyright")
      pagebreak(weak: true)
      v(1.2in)
    } else if ttl == "Come to the Edge" {
      // ---- [B] POEM: centred, standalone, no heading fanfare ----
      fm-mode.update("poem")
      pagebreak(to: "odd", weak: true)
      v(2.4in)
    } else if ttl.starts-with("Afterword") {
      // ---- [B] AFTERWORD: personal letter ----
      fm-mode.update("letter")
      pagebreak(to: "odd", weak: true)
      v(1.05in)
      text(font: font-serif, style: "italic", size: 20pt, fill: ink)[A Letter From Me to You]
      v(22pt)
    } else if front-back-titles.contains(ttl) {
      // ---- other front/back matter openers (Foreword, Intro, Tools, …) ----
      fm-mode.update("normal")
      pagebreak(to: "odd", weak: true)
      v(1.05in)
      text(size: 22pt, weight: 700)[#it.body]
      v(16pt)
      line(length: 44pt, stroke: 1.1pt + ink)
      v(24pt)
    } else {
      // ---- [C1] NUMBERED CHAPTER ----
      fm-mode.update("normal")
      counter(figure).update(0)                    // [C2] figures restart each chapter
      pagebreak(to: "odd", weak: true)
      [#metadata("chapter") <ab-chapter-start>]    // marker: chapter ordinal + body start
      v(1.05in)
      context {
        let n = chapters-before(here())
        text(size: 12pt, weight: 600, tracking: 0.28em, fill: ink-faint, upper[Chapter #chapter-word(n)])
      }
      v(13pt)
      text(size: 25pt, weight: 700)[#it.body]
      v(16pt)
      line(length: 44pt, stroke: 1.1pt + ink)
      v(24pt)
    }
  }

  // section headings (level 2): one level, Title Case, unnumbered
  show heading.where(level: 2): it => block(above: 1.5em, below: 0.55em)[
    #set par(justify: false)
    #set text(font: font-display, weight: 600, size: 13.5pt, fill: ink, hyphenate: false)
    #it.body
  ]
  show heading.where(level: 3): it => block(above: 1.2em, below: 0.4em)[
    #set par(justify: false)
    #set text(font: font-display, weight: 600, size: 11.5pt, fill: ink-soft, hyphenate: false)
    #it.body
  ]

  // ---- BLOCKQUOTES: "Try this" box vs. chapter epigraph --------------------
  show quote.where(block: true): it => {
    let plain = to-plain(it.body).trim()
    if plain.starts-with("Try this") {
      // [D4] Try this box — reversed TRY THIS tag, tightened, no duplicate label
      block(width: 100%, breakable: true, above: 1.5em, below: 1.2em)[
        #line(length: 100%, stroke: 2.2pt + ink)
        #place(top + left, dy: -0.85em,
          box(fill: ink, inset: (x: 8pt, y: 4pt),
            text(font: font-display, weight: 600, size: 8pt, tracking: 0.16em, fill: white)[TRY THIS]))
        #v(15pt)
        #set par(justify: true, first-line-indent: 0pt, leading: body-leading, spacing: body-spacing)
        // hide the leading "Try this." run — the reversed tag is the label now
        #show strong: s => if to-plain(s.body).trim().starts-with("Try this") { none } else { s }
        #it.body
        #v(7pt)
        #line(length: 100%, stroke: 0.6pt + ink)
      ]
    } else {
      // [D3] Epigraph — italic quote; attribution smaller, upright, soft grey
      block(width: 100%, above: 0.3em, below: 1.7em)[
        #set par(justify: false, leading: 0.7em, spacing: 0.55em)
        #let epi = counter("ab-epi")
        #epi.update(0)
        #show par: p => {
          epi.step()
          context {
            if epi.get().first() >= 2 {
              text(size: 9.5pt, style: "normal", fill: ink-soft, p)
            } else {
              text(style: "italic", size: 12pt, fill: ink, p)
            }
          }
        }
        #it.body
      ]
    }
  }

  // ---- FIGURES [C2]: centred; caption "Figure 3.1" (per-chapter) -----------
  show figure: it => {
    set align(center)
    block(above: 1.4em, below: 1.4em, it)
  }
  show figure.caption: it => context {
    set text(font: font-serif, style: "italic", size: 9.5pt, fill: ink-soft)
    set par(justify: false, leading: 0.6em)
    let c = chapters-before(here())
    let f = counter(figure).at(here()).first()
    let fig-label = str(c) + "." + str(f)
    [#text(font: font-display, style: "normal", weight: 600, fill: ink)[Figure #fig-label]#h(0.5em)#it.body]
  }

  // ---- footnotes & links ---------------------------------------------------
  set footnote.entry(separator: line(length: 30%, stroke: 0.5pt + hairline))
  show footnote.entry: set text(size: 8.5pt, fill: ink-soft)
  show link: set text(fill: ink)

  // ===========================================================================
  // FRONT MATTER rendered by the template — half-title + title page
  // ===========================================================================
  set page(header: none, footer: none)
  v(2.1in)
  align(center, text(font: font-display, weight: 700, size: 20pt, fill: ink, title))

  pagebreak(to: "odd", weak: true)
  align(center)[
    #v(1.5in)
    #set par(justify: false)                       // [D1] title page not stretched
    #text(font: font-display, weight: 800, size: 33pt, tracking: -0.01em, fill: ink, upper(title))
    #v(26pt)
    #line(length: 46pt, stroke: 1pt + ink)
    #v(26pt)
    #text(font: font-serif, style: "italic", size: 15pt, fill: ink-soft, subtitle)
  ]
  place(bottom + center, dy: -1.25in, align(center)[
    #text(font: font-display, weight: 600, size: 13pt, tracking: 0.2em, fill: ink, upper(author))
    #v(9pt)
    #text(font: font-serif, style: "italic", size: 10pt, fill: ink-soft)[Foreword by Thomas Power]
    #v(30pt)
    #text(font: font-mono, size: 8pt, tracking: 0.18em, fill: ink-faint)[AUTOMATIC BUSINESS PRESS]
  ])

  set page(header: running-header, footer: running-footer)

  // ---- [C3] Contents: parts + chapters + kept front matter -----------------
  if toc {
    pagebreak(to: "odd", weak: true)
    set par(justify: false)
    v(0.9in)
    text(font: font-display, weight: 700, size: 20pt, fill: ink)[Contents]
    v(18pt)
    show outline.entry: it => {
      let t = norm-title(to-plain(it.element.body))
      if toc-exclude.contains(t) { return }        // drop copyright / poem / back cover / intermission
      let is-part = t.starts-with("Part ") and t.contains(":")
      set text(font: if is-part { font-display } else { font-serif }, weight: if is-part { 700 } else { 400 }, fill: ink)
      it
    }
    outline(title: none, depth: 1, indent: auto)
  }

  // ===========================================================================
  body
}
