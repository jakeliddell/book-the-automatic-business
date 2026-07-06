# Round two: finishing the interior for The Automatic Business

The template is integrated into the repo and building cleanly through our GitHub Action (PDF and EPUB, fonts fetched in CI). Thank you. Two small fixes were needed for the first green build, both already committed: a comment in typst-show.typ held a literal dollar-sign pair that Quarto read as a template variable, and the template did not define a `part` function so Quarto's part entries errored. I added a working `part` divider as a placeholder. Please treat it as a starting point to refine, not final.

I have reviewed the full 180-page rendered PDF. Findings are grouped below with page references. Everything stays greyscale-first, keyboard characters only in any reader-facing text (no em dashes, en dashes, curly quotes or ellipsis characters), 5.5 by 8.5 inch trim, and it must keep building with a plain quarto render (the Action is the test).

## A. Contradicts the black-and-white decision (highest priority)

1. The figures are in colour. The diagrams embed the terracotta accent and a warm panel fill: on page 32 the diagram title "THE BOTTLENECK" and the "you" ring are orange, inside a beige box. The interior prints black and white, and the brief is greyscale-first with no reliance on hue. Please produce the figures in greyscale for the print build (a separate colour set for the EPUB and screen PDF is fine), and make sure contrast holds once Amazon converts to grey.

## B. Front-matter specials (still rendering as generic chapter openers)

2. Copyright (page 13) renders as a large "Copyright" chapter opener. Make it a quiet copyright page: small print, no large title.
3. Poem, "Come to the Edge" (page 15), renders as a large left-aligned opener. Make it centred, quiet and standalone, with no heading fanfare. It holds placeholder text while we clear the licence, so style the container, not the words.
4. Afterword (page 173) renders as a generic opener. Set it apart as a personal letter, and set the closing signature apart. See also D9 (its title is being stretched).

## C. Numbering and contents

5. Chapter openers show no "Chapter One" line. The numbered-chapter kicker is absent in the built PDF (see page 27). Please restore the "Chapter One" through "Chapter Twenty" kicker on chapter openers, spelled in words.
6. Figure numbering reads "Figure 1" on every chapter's figure (page 32), not "Figure 7.1". Fix so figures number per chapter, for example "Figure 7.1".
7. Contents (pages 5 to 6): the four part titles are missing from the table of contents, because parts are emitted as a function rather than a heading. Please get the parts into the contents. Separately, Copyright, Come to the Edge and Back Cover are listed in the contents; please exclude front and back matter so it reads as a clean chapter list.
8. Pagination: the front matter is arabic and continuous, so Chapter One opens on page 27. Please recommend and implement the convention you prefer (typically roman numerals in the front matter, arabic restarting at one at Chapter One).

## D. Type polish

9. Multi-line level-one titles are being justified and stretched: the title page reads "THE      AUTOMATIC" with a large gap (page 3), and the afterword title stretches across its two lines (page 173). This is global paragraph justification reaching the headings. Turn justification off on display headings.
10. Part divider (page 25): the whole string currently renders in one faint, letter-spaced, uppercase style with the colon run into the next word ("PART ONE:WHY"), and a short rule beneath. Please design it properly: a distinct "PART ONE" kicker separated from a large, dark, mixed-case part title, with the colon spacing fixed, positioned to taste.
11. Epigraph attribution (page 27): the attribution line is italic at the same size as the quote. Differentiate it (smaller, upright, soft grey), matching how the EPUB already handles it.
12. Try this box (page 31): works well, but the "Try this." label is not visually distinct in print, and there is a large gap before the closing hairline. Consider a label treatment and tightening the box.

## Note

The manuscript currently contains no "Case study:" callouts, so that box is designed but unexercised. No action needed unless you want to confirm its styling against a test callout.

## Deliverable

Updates to the same partials (typst-template.typ, typst-show.typ, brand.typ) and the EPUB CSS, pushed to the repo so the Action builds them. A short sample-spreads PDF of the redesigned front matter (copyright, poem, afterword), a part divider, and the contents page before the full pass would be ideal, but is your call.
