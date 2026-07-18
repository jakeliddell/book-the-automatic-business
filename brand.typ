// =============================================================================
// The Automatic Business — brand tokens
// -----------------------------------------------------------------------------
// Single source of truth for fonts, colour, and the print geometry.
// Change a value here and it flows through the whole interior.
//
// GREYSCALE-FIRST: the print interior is pure black-and-white. Every colour
// below is a neutral grey. `terracotta` is defined for reference only and is
// NOT used anywhere in the print template — it lives solely in the EPUB CSS.
// =============================================================================

// --- Fonts -------------------------------------------------------------------
// Each is a fallback stack: the first name is the intended face; the last is a
// font Typst bundles, so a bare `quarto render` always produces a book even
// before the real font files are dropped into ./fonts.
//
// To use your licensed body serif: replace "Source Serif 4" below with its
// exact family name and drop the files in ./fonts (see fonts/README.md).
#let font-serif   = ("Source Serif 4", "Libertinus Serif")        // body copy
#let font-display = ("Archivo", "Libertinus Sans", "DejaVu Sans") // chapters, parts, running heads, labels, figure numbers
#let font-mono    = ("JetBrains Mono", "DejaVu Sans Mono")        // imprint / incidental

// --- Greyscale palette (print) ----------------------------------------------
#let ink        = rgb("#1b1a17")  // body + key lines
#let ink-soft   = rgb("#5a584f")  // captions, running heads, attribution
#let ink-faint  = rgb("#8a887e")  // chapter eyebrow, folios
#let hairline   = rgb("#c9c7c1")  // callout border
#let panel      = rgb("#f0efea")  // case-study fill
#let panel-line = rgb("#d7d5ce")  // rule inside case-study

// --- Screen / EPUB-only accent (NEVER used in the print template) ------------
#let terracotta = rgb("#B5632F")

// --- Type scale --------------------------------------------------------------
#let body-size    = 11pt
#let body-leading = 0.78em   // line spacing — generous, for easy reading
#let body-spacing = 1.5em    // space BETWEEN paragraphs (no first-line indent) — a clear channel so the text breathes

// --- Print geometry (KDP 5.5 x 8.5" digest, B&W interior) --------------------
// Typst has no named size for this trim, so we set explicit dimensions.
// Mirrored margins: gutter (inside) is wide for binding; 0.75in suits a
// 151–300pp book. Adjust `page-inside` once the final page count is locked.
#let page-width   = 5.5in
#let page-height  = 8.5in
#let page-inside  = 0.75in   // gutter — grows with page count (KDP rule)
#let page-outside = 0.5in
#let page-top     = 0.75in
#let page-bottom  = 0.6in
