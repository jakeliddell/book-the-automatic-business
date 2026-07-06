# Round two: what changed on main, for CD to reconcile

CD's round-two `typst-template.typ` is integrated and the book builds green in the GitHub Action (PDF + EPUB). Two small changes were made on top of CD's delivered file to get it building and rendering correctly. Please fold these into CD's source so it does not regress on the next pass. Everything else is CD's work, untouched.

## Fixes applied on main

1. Figure caption: `it.element.location()` errors in this Quarto/Typst version ("caption does not have field element"). Changed the two lines in the `show figure.caption` rule to use `here()` inside the existing `context`:

   ```typ
   let c = chapters-before(here())
   let f = counter(figure).at(here()).first()
   ```

2. Colon spacing in extracted titles: the title text pulled out by `to-plain` loses the space after a colon, so "Part One: Why ..." became "Part One:Why ...". That single quirk broke four things at once: the part-divider title would not split (printed as one uppercase line), and "Important: Read This First" and "The Tools: A Working Directory" failed the front-matter match, so they were numbered as chapters, which pushed every chapter and figure number up by one and started the arabic folios too early. Fix: a helper that repairs the colon spacing, applied where the heading title and the contents entries are matched.

   ```typ
   #let norm-title(s) = s.trim().replace(": ", ":").replace(":", ": ")
   // in the level-1 heading rule:
   let ttl = norm-title(to-plain(it.body))
   // in the outline.entry rule:
   let t = norm-title(to-plain(it.element.body))
   ```

## Verified correct in the current build

Chapter openers read Chapter One to Chapter Twenty (Read This First and the Tools directory are front/back matter, not numbered). Figures number per chapter (1.1, 2.1, 3.1 ...). Front matter is roman, arabic restarts at the first chapter. Part divider shows a tracked "PART ONE" kicker over a large mixed-case title. Copyright is quiet small print, the poem is centred, the afterword is a personal letter. Epigraph attribution is small, upright and soft grey. The Try this box shows the reversed TRY THIS tag with no duplicate label. Display headings are not stretched. All four parts appear in the contents; copyright, the poem and the intermission are excluded.

## Open polish items (not blockers)

1. Folio start: the arabic "1" lands on the page after the Chapter One opener; the opener page itself still shows a roman folio. Either suppress the folio on chapter-opening pages, or align the arabic restart to the opener page.
2. The build logs a harmless "layout did not converge within 5 attempts" warning, from the query-and-state-driven numbering (the `<ab-chapter-start>` markers plus the front-matter mode state). Output is correct; worth a look only if it starts affecting numbers.
3. Figures are still in colour (terracotta accent, warm panel fill). This is deferred deliberately: the diagrams are being redrawn one by one later, in greyscale for the black-and-white interior.
