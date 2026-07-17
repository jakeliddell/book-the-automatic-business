#!/usr/bin/env python3
"""Wire Figure Plan v2 images into the manuscript.

Run from the repo root AFTER dropping the repo-drop image pack in:
    python3 wire_figures.py

What it does:
  - removes/replaces all 20 old placeholder .svg figure includes
  - inserts the new figures at their anchor sentences:
      * cartoons -> unnumbered images (no caption, fig-alt only)
      * diagrams -> numbered Quarto figures with captions
      * both format-split: -print.png for Typst, .jpg for EPUB
  - inserts 7 of the 9 marginalia marks as Typst-only blocks
    (the two circle marks need manual placement in the proof pass --
     they encircle words in running text)
  - idempotent: skips any insert whose image path is already present
  - prints a report; exits nonzero if any anchor failed to match
"""
import pathlib, sys

M = pathlib.Path("manuscript")
OK, FAIL, SKIP = [], [], []

def cartoon(ch, slug, alt, width="88%"):
    p = "../images/%s/%s" % (ch, slug)
    return ('::: {.content-visible when-format="typst"}\n'
            '![](%s-print.png){fig-alt="%s" width=%s}\n'
            ':::\n'
            '::: {.content-visible unless-format="typst"}\n'
            '![](%s.jpg){fig-alt="%s" width=%s}\n'
            ':::') % (p, alt, width, p, alt, width)

def diagram(ch, slug, caption, label, width="85%"):
    p = "../images/%s/%s" % (ch, slug)
    return ('::: {.content-visible when-format="typst"}\n'
            '![%s](%s-print.png){#%s width=%s}\n'
            ':::\n'
            '::: {.content-visible unless-format="typst"}\n'
            '![%s](%s.jpg){#%s-screen width=%s}\n'
            ':::') % (caption, p, label, width, caption, p, label, width)

def mark(slug, align="right", width="2.2in", pre="0.3em", post="0.3em"):
    img = "images/marginalia/%s.png" % slug
    return ('\u0060\u0060\u0060{=typst}\n'
            '#v(%s)\n'
            '#align(%s, image("%s", width: %s))\n'
            '#v(%s)\n'
            '\u0060\u0060\u0060') % (pre, align, img, width, post)

def para_end(ls, i):
    while i < len(ls) and ls[i].strip() != "":
        i += 1
    return i

def apply(fname, ops):
    f = M / fname
    text = f.read_text(encoding="utf-8")
    ls = text.split("\n")
    for kind, needle, block in ops:
        tag = "%s: %s @ %r" % (fname, kind, needle[:50])
        if block:
            probe = [l for l in block.split("\n") if "](../images/" in l or 'image("' in l]
            if probe and any(probe[0] in l for l in ls):
                SKIP.append(tag); continue
        hit = next((i for i, l in enumerate(ls) if needle in l), None)
        if hit is None:
            FAIL.append(tag); continue
        if kind == "remove":
            del ls[hit]
        elif kind == "replace":
            ls[hit:hit+1] = block.split("\n")
        elif kind == "insert_after":
            end = para_end(ls, hit)
            ls[end:end] = ["", *block.split("\n")]
        OK.append(tag)
    f.write_text("\n".join(ls), encoding="utf-8")

# ============================ PLACEMENTS ============================

apply("introduction.md", [
    ("insert_after", "started becoming your cage",
     cartoon("intro", "fig-cage", "A birdcage holding a complete tiny office; the owner works on inside it, and the cage door stands wide open.", "80%")),
])

apply("01-you-are-the-bottleneck.md", [
    ("remove", "fig-bottleneck.svg", None),
    ("insert_after", "That is what a bottleneck is.",
     cartoon("ch01", "fig-bottleneck", "The whole business queues inside a bottle toward the neck, where the owner sits stamping items through one at a time.", "92%")),
    ("insert_after", "It is not a busy patch. It is the design.",
     mark("mark-ch01-underline", "left", "2.0in", "-0.5em", "0.2em")),
    ("insert_after", "because the phone stays on",
     cartoon("ch01", "fig-holiday-that-isnt", "A beach deckchair with an office desk phone half-buried in the sand beside it, its cord running back over the dunes.", "92%")),
])

apply("02-technician-to-architect.md", [
    ("remove", "fig-technician-architect.svg", None),
    ("insert_after", "without ever picking up a spanner",
     cartoon("ch02", "fig-pit-wall", "Two panels: a mechanic buried under a car labelled THE BUSINESS; the same person calm on the pit wall with telemetry screens. Same person, different job.", "100%")),
    ("insert_after", "a broken process with a salary attached",
     cartoon("ch02", "fig-salaried-process", "A machine leaks paperwork from a hole while a cheerful new hire catches it in a bucket costing 28,000 pounds a year; nobody fixes the hole.")),
    ("insert_after", "Automation first, people second.",
     mark("mark-ch02-arrow-order", "right", "2.1in")),
])

apply("03-the-triage.md", [
    ("remove", "fig-triage.svg", None),
    ("insert_after", "The sorting is the thing that makes the whole department work.",
     cartoon("ch03", "fig-triage-nurse", "A triage nurse sorts a queue of walking tasks toward three doors: HUMAN, AUTOMATION and AI.", "100%")),
    ("insert_after", "four links with three different owners",
     diagram("ch03", "fig-task-chain",
       "One task is really a chain of links, each with its own natural owner.",
       "fig-task-chain", "88%")),
])

apply("04-ai-is-not-automation.md", [
    ("remove", "fig-automation-vs-ai.svg", None),
    ("insert_after", "wearing a fashionable coat",
     cartoon("ch04", "fig-fashionable-coat", "Ordinary pipework on a sales plinth in a trench coat and sunglasses with an AI badge; a child points out that it is plumbing.")),
    ("insert_after", "what makes it dangerous if you misuse it",
     cartoon("ch04", "fig-rails-vs-improviser", "Two panels: a punctual train passing TRIGGER, ACTION, DONE stations at 3am; a dazzling juggler on a unicycle with one ball quietly on fire.", "100%")),
])

apply("05-your-brilliant-new-hire.md", [
    ("insert_after", "completely blank about you",
     cartoon("ch05", "fig-day-one", "A keen recruit whose huge head holds an endless library, sitting at a first-day desk; the filing cabinet labelled YOUR BUSINESS is open and empty.")),
    ("replace", "fig-brief-check.svg",
     diagram("ch05", "fig-brief-check",
       "The method in one loop: brief it like a new hire, check it like a manager.",
       "fig-brief-check", "85%")),
])

apply("06-where-to-start.md", [
    ("replace", "fig-value-effort.svg",
     diagram("ch06", "fig-prospectors-map",
       "Score each candidate on value and effort. Start in the gold seam: high value, low effort.",
       "fig-value-effort", "85%")),
    ("insert_after", "just a bad process that runs faster",
     mark("mark-ch06-arrow-read-twice", "right", "2.3in")),
    ("insert_after", "live in ninety",
     cartoon("ch06", "fig-ninety-minute-machine", "A dusty wall-sized blueprint tagged NEVER LAUNCHED beside a shoebox machine with one lever, tagged LIVE IN 90 MINUTES.", "100%")),
])

apply("07-the-map-of-your-business.md", [
    ("insert_after", "how it is even supposed to work",
     cartoon("ch07", "fig-saas-spaghetti", "A plate of tangled spaghetti with app windows caught in the strands, each with a monthly price tag; the owner sits before it, horrified.")),
    ("replace", "fig-four-blocks.svg",
     diagram("ch07", "fig-four-blocks",
       "Four building blocks, and the Knowledge and Reporting layer that spans them all.",
       "fig-four-blocks", "85%")),
])

apply("08-second-brain-concept.md", [
    ("remove", "fig-second-brain.svg", None),
    ("insert_after", "stored in the worst possible place",
     cartoon("ch08", "fig-vault", "Cutaway of the owner's head as a bank vault full of filing cabinets; staff queue at the ear holding deli tickets under a NOW SERVING sign.")),
    ("insert_after", "I have called it that. Your Keystone.",
     mark("mark-ch08-arrow-keystone", "right", "1.7in")),
    ("insert_after", "knowledge walks out of the door with them",
     cartoon("ch08", "fig-leaver", "An employee leaves carrying a box with a huge jigsaw piece in it; the office wall behind has a matching jigsaw-shaped hole.")),
])

apply("09-second-brain-build.md", [
    ("insert_after", "Digging it out is a craft.",
     cartoon("ch09", "fig-process-archaeology", "An archaeological dig where the excavation pit is the silhouette of a head; tagged artefacts sit on a finds table while a robot in a pith helmet takes notes.")),
    ("replace", "fig-keystone-layers.svg",
     diagram("ch09", "fig-strata",
       "A Keystone has three layers: raw sources at the bottom, the tended memory in the middle, and everyone who draws on it above.",
       "fig-keystone-layers", "85%")),
])

apply("10-connecting-everything.md", [
    ("remove", "fig-connector.svg", None),
    ("insert_after", "You are the integration layer.",
     cartoon("ch10", "fig-integration-layer", "Before: the owner hauls buckets of data between two tower machines. After: a pipe labelled THE CONNECTOR joins them while the owner rests in a distant deckchair.", "100%")),
])

apply("11-client-operating-system.md", [
    ("insert_after", "expensive graveyard it probably became last time",
     cartoon("ch11", "fig-crm-graveyard", "A moonlit graveyard of dead CRMs with epitaph tombstones; the owner stands with a shovel and a new boxed CRM, hesitating.")),
    ("replace", "fig-pipeline.svg",
     diagram("ch11", "fig-pipeline",
       "A pipeline shows every live client on one board, and moves them along stage by stage.",
       "fig-pipeline", "90%")),
    ("insert_after", "finds it easier to use than to avoid",
     cartoon("ch11", "fig-matt-test", "An old-school salesman leans back happily on the phone while pipeline cards move themselves across a board behind him.", "60%")),
])

apply("12-killing-errors.md", [
    ("insert_after", "silent assassin of a service business",
     cartoon("ch12", "fig-silent-assassin", "A tiny ninja formed from a currency typo perches on an invoice corner with a dagger while the office works on, oblivious.", "60%")),
    ("replace", "fig-missing-step.svg",
     diagram("ch12", "fig-missing-step",
       "The step that never happened, caught and flagged before the client ever notices.",
       "fig-missing-step", "90%")),
    ("insert_after", "## Write the Guardrails First",
     mark("mark-ch12-underline-guardrails", "left", "1.9in", "-0.3em", "0.1em")),
    ("insert_after", "no invoice details on it",
     cartoon("ch12", "fig-gate", "A bouncer labelled THE GATE turns away an incomplete deal card at a velvet rope while a complete card breezes past.")),
])

apply("13-communications.md", [
    ("insert_after", "If they pay, stop the reminders.",
     cartoon("ch13", "fig-message-didnt-stop", "A proud robot postman delivers a letter asking DID YOU GET OUR PROPOSAL? into a celebration where the contract is already signed.")),
    ("replace", "fig-comms-timing.svg",
     diagram("ch13", "fig-stops-on-reply",
       "The right message, at the right moment, that stops the instant they reply.",
       "fig-comms-timing", "90%")),
])

apply("14-digital-teammates.md", [
    ("insert_after", "never tell you when they are broken",
     cartoon("ch14", "fig-everything-is-fine", "An office robot with a sparking arm and glitching screen gives a confident thumbs up; its mug reads WORLD'S OKAYEST AUTOMATION.")),
    ("replace", "fig-digital-team.svg",
     cartoon("ch14", "fig-team-photo", "A staff photo wall interleaving humans and robots in identical frames; a robot holds EMPLOYEE OF THE MONTH and the owner's frame reads DIRECTOR.")),
])

apply("15-dashboards.md", [
    ("replace", "fig-dashboard.svg",
     cartoon("ch15", "fig-beach-test", "The Chapter One beach again, but the desk phone is gone: a smartphone shows seven green dots and ALL FINE, and the old cord lies unplugged in the sand.", "92%")),
    ("insert_after", "should be yours: designed around your decisions",
     cartoon("ch15", "fig-cockpit", "A light-aircraft cockpit with exactly seven friendly gauges in the green; behind the pilot, a forty-gauge panel sits under a dust sheet labelled EVERYTHING ELSE.")),
])

apply("16-systemising-delivery.md", [
    ("insert_after", "humanise the exceptional",
     cartoon("ch16", "fig-lego-not-bespoke", "A craftsman hand-carves one ornate chair as clients queue; beside it, the same service built from numbered parts, with one hand-carved flourish tagged THE 10 PERCENT.", "100%")),
    ("replace", "fig-scaling.svg",
     diagram("ch16", "fig-flat-line",
       "Systems break the link between growth and chaos.",
       "fig-scaling", "85%")),
])

apply("17-marketing-growth.md", [
    ("remove", "fig-flywheel.svg", None),
    ("insert_after", "hamster wheel and a flywheel",
     cartoon("ch17", "fig-hamster-flywheel", "The owner sprints in a hamster wheel labelled PANIC MARKETING; beside it a massive flywheel with five labelled stages turns from one fingertip push.", "100%")),
    ("insert_after", "a shop with no front door",
     cartoon("ch17", "fig-no-front-door", "A handsome shop with a big window and a CONTACT US sign, and no door anywhere; customers bounce off the glass.", "85%")),
    ("insert_after", "juice from the same orange",
     cartoon("ch17", "fig-orange-press", "One orange labelled ONE GOOD IDEA in a Victorian screw-press; bottles fill with an article, five posts, an email sequence and a video.", "85%")),
])

apply("18-buying-back-time.md", [
    ("insert_after", "sixty-four pounds an hour",
     mark("mark-ch18-scrawl-maths", "center", "2.6in")),
    ("insert_after", "first morning of school",
     cartoon("ch18", "fig-quiet-house", "The owner stands in a suddenly calm office, coffee in hand, as a tumbleweed of old sticky notes rolls past and the machines hum on outside.")),
    ("replace", "fig-your-week.svg",
     cartoon("ch18", "fig-receipt", "A till receipt unrolls to the floor itemising reclaimed hours, totalling 700 plus hours a year; the change given is your evenings.", "55%")),
])

apply("19-everything-is-not-a-priority.md", [
    ("insert_after", "a list of anxieties, and told yourself it was a plan",
     cartoon("ch19", "fig-everyone-gets-a-medal", "An Olympic podium with fourteen first-place steps; every task wears a gold medal and an URGENT sash, while the judge holds a single trophy.", "92%")),
    ("insert_after", "never once asks you to confirm the order",
     cartoon("ch19", "fig-helpful-scheduler", "An immaculate butler robot files a document stamped THE MOST IMPORTANT THING into a drawer labelled A WEEK ON THURSDAY.", "85%")),
    ("replace", "fig-one-list.svg",
     diagram("ch19", "fig-one-list",
       "One list, ordered by importance. The lenses simply choose which slice of it you see right now.",
       "fig-one-list", "85%")),
])

apply("20-maintaining.md", [
    ("insert_after", "climb back into the gears you fought so hard to climb out of",
     cartoon("ch20", "fig-step-away", "A gleaming machine with every dial in the green; the owner in brand-new overalls tiptoes toward it with an enormous spanner while the team watches.")),
    ("insert_after", "racehorse pulls a plough badly",
     cartoon("ch20", "fig-racehorse", "A thoroughbred in racing silks harnessed to a plough leaves a zigzag furrow, while a carthorse labelled THE INTEGRATOR ploughs straight lines.", "92%")),
    ("replace", "fig-replacement-map.svg",
     diagram("ch20", "fig-signal-box",
       "Your You Replacement Map: re-route everything that still runs only through you, and keep only what you choose.",
       "fig-replacement-map", "90%")),
    ("insert_after", "So go and do what only you can do.",
     mark("mark-ch20-arrow-off-page", "right", "2.2in", "0.5em", "0.1em")),
])

SKIP.append("MANUAL: mark-ch04-circle-test -- circle the steps-test question in the proof pass")
SKIP.append("MANUAL: mark-ch19-circle-priorities -- circle the word priorities in the proof pass")

print("applied: %d   skipped: %d   FAILED: %d" % (len(OK), len(SKIP), len(FAIL)))
for t in OK: print("  ok   ", t)
for t in SKIP: print("  skip ", t)
for t in FAIL: print("  FAIL ", t)
sys.exit(1 if FAIL else 0)
