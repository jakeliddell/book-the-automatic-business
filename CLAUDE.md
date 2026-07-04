# CLAUDE.md - working rules for The Automatic Business

These rules are binding for any AI session editing this repository.

## Character set (strict)

Manuscript prose (manuscript/, index.md, figures.md) may contain ONLY characters a normal UK keyboard user has a key for: printable ASCII plus the pound sign (£).

Banned outright: em dashes (—), en dashes (–), curly/smart quotes (" " ' '), the ellipsis character (…), arrows (→), and any other typographic substitute. Do not replace an em dash with "--" either: rewrite the sentence using a comma, colon, semicolon, full stop, or parentheses, as the existing chapters do.

Why (in Jake's words): there is nothing an em dash cannot be replaced with - a full stop and capital letter, a semicolon, a colon, or a comma. No one has written em-dashes in normal writing for 20+ years. The only "people" that do are AI. Readers who spot one dismiss the work as AI-generated and mentally switch off. It is not about grammatical correctness; an em dash says "this is AI". So it cannot be used. Ever. This applies to ALL text a reader might see, including drafts shown in chat for review, marketing copy, and the website, not just committed manuscript files.

Permitted exceptions: © in copyright.md only, and accented letters inside proper nouns (e.g. Schrödinger).

Before any commit, run this and justify every hit:

    grep -rnP '[^\x00-\x7F]' manuscript/ index.md figures.md

## Voice

- No contractions in narration (verbatim quoted speech may keep them).
- British English spellings.
- Direct address ("you"), short declarative sentences, no bullet-point-heavy prose.
- Chapters open with a "By the end of this chapter you will..." promise and close with a "Where We Go Next" section followed by a "> **Try this.**" box.
- Case studies are boxed call-outs titled "Case study: ...". Styling is handled globally at the template level; use Quarto callout syntax in the chapter.
- Chapter cross-references are spelled out in words ("Chapter Seven"), never numerals.
- Real tool names may appear only as evidence of sprawl or mess (e.g. the SaaS Spaghetti list in Chapter Seven). Recommendations stay generic in chapters and point to the tools directory at the back; named recommendations live only in manuscript/tools-pullout.md.

## Structure

- The book is 20 chapters across four parts; the order lives in _quarto.yml and nowhere else.
- Images live in images/chNN matching the chapter number. Every figure has a stable ID, a .prompt.md next to the asset, and a row in figures.md.
- The company second brain is named Keystone. The four building blocks are Finance, Customer Acquisition and Control, Delivery, and Task, with the Knowledge and Reporting layer over the top (Chapter Seven).
