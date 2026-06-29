> **STATUS — June 2026: this is the original plan, now superseded as a to-do list.**
>
> The full manuscript is drafted. All 18 chapters, plus the front and back matter, live in `manuscript/` and `index.md` of this repository. Read this document as history and rationale, not as a list of work still to be done.
>
> **Naming:** the concept described below as the "company second brain" is named **Keystone** in the finished book. It is introduced in `manuscript/07-second-brain-concept.md` ("Keystone: Your Company's Second Brain") and used throughout. The text below predates that decision, so where it says "second brain," read "Keystone."

---

# THE AUTOMATIC BUSINESS

## Restructure Blueprint (Draft 2 architecture)

This is our working map for turning the existing draft into a book that talks to the Reluctant MD and stays evergreen. It maps old content to a new structure. We agree it here, then edit chapter files against it. Pairs with `MASTER_BRIEF_The_Reader.md`.

---

### The job we are doing

The existing draft was written to a loose, broad brief (the "everyday entrepreneur", the plumber, the coach). We now have a defined reader and a clear narrative. The content is largely sound. What changes is the framing, the running order, and a few product bets that would date the book. We reuse the writing, re-aim it, and re-sequence it.

### Locked decisions

1. **Audience.** The Reluctant MD, defined by a state not a headcount. You qualify the moment you have staff and have become the bottleneck. Not a solo operator, not enterprise. Owner of a small B2B service firm with a team is the centre of gravity.
2. **Intellectual spine.** The human / AI / automation decision (the HAI Triage) is the backbone, not a side topic. Deciding what only a human should do, what to automate, and what to give to AI is the evergreen idea everything hangs off.
3. **AI versus automation.** Foregrounded as a real distinction, including the contrarian line that most "we need AI" problems are automation problems that have existed for a decade.
4. **Tools pull-out.** Named products (HubSpot, HighLevel, Salesforce, ActiveCampaign, Zapier and similar) live in one dedicated, updatable pull-out section that weighs their relative merits, framed as "there will always be tools." The core chapters stay tool-agnostic so the body of the book never dates. Only the pull-out gets revised over time.
5. **Dashboards.** Kept and treated as strategically critical, anchored on Drucker ("what gets measured gets managed"), but tool-agnostic. Noloco removed.
6. **Narrative order.** Lead by naming the bottleneck as an architecture problem, not a time problem. Then fear, then cost of inaction, then aspiration. The emotional payload moves to the front instead of arriving only in the final chapters.
7. **The company second brain.** A persistent, LLM-maintained knowledge base is treated as core company infrastructure and gets its own chapter. The durable idea (from Karpathy's LLM-wiki and the memory-plus-reasoning pattern behind Hermes, PopeBot, and MemPalace): compile knowledge once and keep it current as a living, queryable asset, rather than re-deriving it on every query. For our reader this is the direct structural answer to "the business runs on what's in my head," so it is the antidote to key-person dependency and a keystone of "runs without you." Taught as a principle, not a product.
8. **LLMs as the reasoning engine.** A principle-led chapter on what large language models are, what they are good and bad at, and how to work with them well. Named models (Claude, ChatGPT, Gemini and others) go in the Tools Pull-Out so the chapter stays evergreen.

### Guiding principles for length and pacing

We are writing the right book, not trimming to a chapter count, and not writing to a word target either. No fixed length. Each chapter takes the space its idea needs, and "substantial" is the feel we are aiming for rather than a number. The draft is currently around 40,000 words and should end up feeling more substantial than that. Length comes from genuine substance: more worked examples, the named case studies (Matt, Laura), the new AI and second-brain material, and sharper signposting. It never comes from padding.

Prefer more, tighter chapters over fewer, long ones. Readers learn from clear signposts. Each chapter carries one idea and opens with what the reader will learn, makes the point with examples, and closes with the action step. When a chapter is carrying two ideas, split it rather than stretch one thin. Two splits are confirmed and actioned in the structure below: old "Scaling Without Chaos" becomes systemising delivery plus automating marketing and growth, and the Second Brain becomes the concept plus building and maintaining it.

Think in figures. As we draft each chapter, ask whether a diagram or image would make a concept land faster, and if so create a figure slot and write the generation prompt there and then. The book teaches visually as well as in prose. Image handling, naming, and the figures register are specified in `CONTENT_ARCHITECTURE.md`.

---

### Proposed new structure

**FRONT MATTER**
- Title and copyright. Fix every leftover reference to the old title "Automate to Dominate".
- Contents.
- Important: Read This First ("The Efficiency Trap"). Keep, re-aim the voice to the MD.
- Preface. Keep, re-aim.
- Introduction. Keep the strongest material, restructure around the bottleneck narrative.

**PART 1. WHY YOU'RE THE BOTTLENECK** (diagnosis and emotional hook)
- Ch 1. You Are the Bottleneck. Name it as architecture, not time. Pulls forward "The Hidden Cost of Control", the Efficiency Trap material, and "Why Working Harder Is Not the Answer" from old Ch 1. Adds the 2am fears and the cost of doing nothing.
- Ch 2. From Technician to Architect. The identity shift for the expert-first owner. From old Ch 1: the architect mindset, rewiring for leverage, delegating to tech not people, "automation first, people second."
- (Option: Ch 1 and Ch 2 could merge into one opening chapter if we want a leaner Part 1.)

**PART 2. HUMAN, AI, OR AUTOMATION** (the framework, the evergreen IP)
- Ch 3. The Triage: Human, AI, or Automation. The core chapter built on the HAI framework. How to decide, for any task, whether it belongs to a human, an automation, or an AI.
- Ch 4. AI Is Not Automation. The real distinction between the two, plus the contrarian "most AI needs are automation" position. Its own chapter so the idea gets a clear signpost.
- Ch 5. Working with LLMs: The Reasoning Engine. NEW, content to be written. What an LLM is, what it is good and bad at, and the durable principles of using one well. Named models go in the Tools Pull-Out; the chapter stays principle-led.
- Ch 6. The 80/20 of Where to Start. Highest-friction, highest-value processes first. From old Ch 2 (classifying by ROI and complexity, the automation audit, what should never be automated). Ties to "Only Do What Only You Can Do."

**PART 3. BUILDING THE AUTOMATIC BUSINESS** (implementation, evergreen-framed)
- Ch 7. Your Company's Second Brain: The Concept. NEW, content to be written. Why a persistent, LLM-maintained knowledge base is core infrastructure: compile once, keep current, do not re-derive on every query. The structural cure for "the business runs on what's in my head" and key-person dependency. Synthesises Karpathy's LLM-wiki and the memory pattern behind Hermes, PopeBot, and MemPalace. Placed first in Part 3 because everything else draws on it.
- Ch 8. Building and Maintaining Your Second Brain. NEW, content to be written. The practical build: the three layers (raw sources, the wiki, the schema), what to feed it (meeting notes, client calls, project docs, message threads), how the team and the AI both use it, and the maintenance discipline that keeps it alive.
- Ch 9. Connecting Everything: Automation Without Code. From old Ch 3 (Zapier), reframed to the no-code connector category. Named tools move to the pull-out.
- Ch 10. Your Client Operating System. CRM on autopilot. From old Ch 5 (HighLevel), reframed to the all-in-one CRM category. Named tools move to the pull-out.
- Ch 11. Killing Errors: Accuracy and Consistency. From old Ch 7, light re-aim.
- Ch 12. Communications That Build Trust. Email, SMS, notifications. From old Ch 8.
- Ch 13. Digital Teammates: Delegating to Bots and AI. From old Ch 9, modernised so AI's current role is explicit and tied back to the Triage and the second brain.
- Ch 14. What Gets Measured Gets Managed. Dashboards and visibility, Drucker-anchored, tool-agnostic. From old Ch 6 with Noloco stripped out.

**PART 4. THE BUSINESS THAT RUNS WITHOUT YOU** (payoff and aspiration)
- Ch 15. Systemising Delivery. From old Ch 10, first half: onboarding, SOPs backed by automation, scalable support systems. Growth that does not depend on you.
- Ch 16. Automating Marketing and Growth. From old Ch 10, second half: content repurposing, auto-publishing, lead capture funnels, and hiring less by scaling with systems.
- Ch 17. Buying Back Your Time. From old Ch 11, measuring the wins.
- Ch 18. Maintaining, Not Micromanaging. From old Ch 12. Closes on the business as a sellable asset that runs without you (old "Designing a Business That Runs Without You"), tying back to the second brain as institutional memory.

The parts are stable. Chapter numbers will only shift if we take further splits.

**BACK MATTER**
- The Tools Pull-Out. Named products with relative merits and trade-offs, including LLMs (Claude, ChatGPT, Gemini and others) and the automation, CRM, and knowledge-base tools. The single updatable section. Absorbs the product-specific material lifted out of the build chapters. Referenced from the body with light pointers, not scattered callout boxes, so only this section ever dates.
- Intermission (review request). Keep the concept. Fix the title and re-aim the voice from "tech bros" to the MD. Placed at the end of Part 2, right after the framework "aha," the strongest value moment to ask for a review.
- Back cover. Rewrite to the new positioning.

---

### What changes per old chapter (quick reference)

| Old | New home | Action |
|---|---|---|
| Read This First (Efficiency Trap) | Front matter | Keep, re-aim voice |
| Preface | Front matter | Keep, re-aim |
| Introduction | Front matter | Restructure around bottleneck |
| Ch 1 Automation Mindset | Part 1 (Ch 1 and 2) | Split: bottleneck + technician-to-architect |
| Ch 2 The 80/20 | Part 2 (Ch 6) | Keep, move after the framework |
| Ch 3 Zapier | Part 3 (Ch 9) | Reframe to category, tools to pull-out |
| Ch 4 Intermission | Back matter / interstitial | Fix title and voice, place at end of Part 2 |
| Ch 5 HighLevel | Part 3 (Ch 10) | Reframe to category, tools to pull-out |
| Ch 6 Dashboards (Noloco) | Part 3 (Ch 14) | Strip product, Drucker, tool-agnostic |
| Ch 7 Killing Error Rates | Part 3 (Ch 11) | Keep, light re-aim |
| Ch 8 Email/SMS/Notifications | Part 3 (Ch 12) | Keep |
| Ch 9 Delegate to Bots | Part 3 (Ch 13) | Modernise to include AI |
| Ch 10 Scaling Without Chaos | Part 4 (Ch 15 and 16) | Split: systemising delivery, then marketing and growth |
| Ch 11 Buying Back Your Time | Part 4 (Ch 17) | Keep |
| Ch 12 Maintaining vs Micromanaging | Part 4 (Ch 18) | Keep, aspiration close |
| New | Part 2 (Ch 3) | Write HAI Triage |
| New | Part 2 (Ch 4) | Write AI Is Not Automation |
| New | Part 2 (Ch 5) | Write Working with LLMs (reasoning engine) |
| New | Part 3 (Ch 7 and 8) | Write Second Brain: concept, then building and maintaining |
| New | Back matter | Build the Tools Pull-Out (incl. LLMs) |

---

### Settled

- Part 1 is two chapters: You Are the Bottleneck, then From Technician to Architect.
- The intermission sits at the end of Part 2, after the framework reveal.
- The Tools Pull-Out is a single back-matter directory, referenced from the body with light pointers, not recurring callout boxes. LLMs are included in it.

### New content still to write

- Ch 3 The Triage (HAI framework).
- Ch 4 AI Is Not Automation.
- Ch 5 Working with LLMs.
- Ch 7 Your Company's Second Brain: the concept and why it matters.
- Ch 8 Building and Maintaining Your Second Brain.
- The Tools Pull-Out directory.

### Reference sources for the new chapters

- Karpathy "LLM Wiki" gist: compile-once-keep-current knowledge base versus query-time RAG. https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- MemPalace: local-first AI memory, verbatim storage plus semantic retrieval. https://github.com/MemPalace/mempalace
- Hermes Agent (Nous Research): self-improving agent with persistent memory and a skills loop. https://hermes-agent.nousresearch.com/docs/
- PopeBot (Stephen Pope): personal agent, any LLM, "three doors one brain." https://github.com/stephengpope/thepopebot

*The Automatic Business. Restructure Blueprint. Works alongside the reader brief.*
