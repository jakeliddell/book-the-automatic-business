// =============================================================================
// The Automatic Business — Quarto Typst show partial
// -----------------------------------------------------------------------------
// Invokes book(...) (defined in typst-template.typ) with the document metadata.
// Quarto fills these fields from _quarto.yml / front matter before Typst runs.
// =============================================================================

#show: doc => book(
  title: [$title$],
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(by-author)$
  author: [$for(by-author)$$it.name.literal$$sep$, $endfor$],
$else$
$if(author)$
  author: [$for(author)$$author$$sep$, $endfor$],
$endif$
$endif$
$if(toc)$
  toc: true,
$endif$
  doc,
)
