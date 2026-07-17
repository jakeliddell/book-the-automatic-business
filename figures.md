# Figure register v2

Every image in the book is tracked here. The prompt file next to each entry is the source: the rendered image is regenerable from it. Style preamble lives inside each prompt (see any file). Two classes:

- **Cartoon** — unnumbered, no figure caption; placed at the moment in the text it illustrates.
- **Diagram** — numbered figure with caption; teaches the model.
- **Marginalia** — one-off author's marks; see images/marginalia/ (max one per chapter, most chapters none).

| ID | Ch | Class | Priority | Status | Prompt |
|----|----|-------|----------|--------|--------|
| fig-cage | Intro | Cartoon | Optional | DONE | images/intro/fig-cage.prompt.md |
| fig-bottleneck | 1 | Cartoon | Core | DONE | images/ch01/fig-bottleneck.prompt.md |
| fig-holiday-that-isnt | 1 | Cartoon | Optional | DONE | images/ch01/fig-holiday-that-isnt.prompt.md |
| fig-pit-wall | 2 | Cartoon | Core | DONE | images/ch02/fig-pit-wall.prompt.md |
| fig-salaried-process | 2 | Cartoon | Core | DONE | images/ch02/fig-salaried-process.prompt.md |
| fig-triage-nurse | 3 | Cartoon | Core | DONE (colour fire — check B&W print conversion) | images/ch03/fig-triage-nurse.prompt.md |
| fig-task-chain | 3 | Diagram | Core | DONE (colour H link — check B&W print conversion) | images/ch03/fig-task-chain.prompt.md |
| fig-fashionable-coat | 4 | Cartoon | Core (style test) | DONE | images/ch04/fig-fashionable-coat.prompt.md |
| fig-rails-vs-improviser | 4 | Cartoon | Core | DONE | images/ch04/fig-rails-vs-improviser.prompt.md |
| fig-day-one | 5 | Cartoon | Core | DONE | images/ch05/fig-day-one.prompt.md |
| fig-brief-check | 5 | Diagram | Core | DONE | images/ch05/fig-brief-check.prompt.md |
| fig-prospectors-map | 6 | Diagram | Core | DONE (gold colour accent; minor tombstone garble accepted) | images/ch06/fig-prospectors-map.prompt.md |
| fig-ninety-minute-machine | 6 | Cartoon | Optional | DONE | images/ch06/fig-ninety-minute-machine.prompt.md |
| fig-saas-spaghetti | 7 | Cartoon | Core (style test) | DONE | images/ch07/fig-saas-spaghetti.prompt.md |
| fig-four-blocks | 7 | Diagram | Core | DONE | images/ch07/fig-four-blocks.prompt.md |
| fig-vault | 8 | Cartoon | Core | DONE | images/ch08/fig-vault.prompt.md |
| fig-leaver | 8 | Cartoon | Core | DONE | images/ch08/fig-leaver.prompt.md |
| fig-process-archaeology | 9 | Cartoon | Core | DONE | images/ch09/fig-process-archaeology.prompt.md |
| fig-strata | 9 | Diagram | Core | DONE (Keystone seam colour glow accepted) | images/ch09/fig-strata.prompt.md |
| fig-integration-layer | 10 | Cartoon | Core | DONE | images/ch10/fig-integration-layer.prompt.md |
| fig-crm-graveyard | 11 | Cartoon | Core | DONE | images/ch11/fig-crm-graveyard.prompt.md |
| fig-pipeline | 11 | Diagram | Core | DONE | images/ch11/fig-pipeline.prompt.md |
| fig-matt-test | 11 | Spot | Optional | DONE | images/ch11/fig-matt-test.prompt.md |
| fig-gate | 12 | Cartoon | Core | DONE | images/ch12/fig-gate.prompt.md |
| fig-missing-step | 12 | Diagram | Core | DONE | images/ch12/fig-missing-step.prompt.md |
| fig-silent-assassin | 12 | Spot | Optional | DONE | images/ch12/fig-silent-assassin.prompt.md |
| fig-message-didnt-stop | 13 | Cartoon | Core | DONE | images/ch13/fig-message-didnt-stop.prompt.md |
| fig-stops-on-reply | 13 | Diagram | Core | DONE | images/ch13/fig-stops-on-reply.prompt.md |
| fig-everything-is-fine | 14 | Cartoon | Core (style test) | DONE | images/ch14/fig-everything-is-fine.prompt.md |
| fig-team-photo | 14 | Cartoon | Core | DONE | images/ch14/fig-team-photo.prompt.md |
| fig-beach-test | 15 | Cartoon | Core | DONE | images/ch15/fig-beach-test.prompt.md |
| fig-cockpit | 15 | Cartoon | Core | DONE (green/red gauge accents accepted) | images/ch15/fig-cockpit.prompt.md |
| fig-lego-not-bespoke | 16 | Cartoon | Core | DONE | images/ch16/fig-lego-not-bespoke.prompt.md |
| fig-flat-line | 16 | Diagram | Core | DONE | images/ch16/fig-flat-line.prompt.md |
| fig-hamster-flywheel | 17 | Cartoon | Core | DONE | images/ch17/fig-hamster-flywheel.prompt.md |
| fig-orange-press | 17 | Cartoon | Core | DONE | images/ch17/fig-orange-press.prompt.md |
| fig-no-front-door | 17 | Cartoon | Optional | DONE | images/ch17/fig-no-front-door.prompt.md |
| fig-quiet-house | 18 | Cartoon | Core | DONE | images/ch18/fig-quiet-house.prompt.md |
| fig-receipt | 18 | Cartoon | Core | DONE | images/ch18/fig-receipt.prompt.md |
| fig-everyone-gets-a-medal | 19 | Cartoon | Core | DONE | images/ch19/fig-everyone-gets-a-medal.prompt.md |
| fig-helpful-scheduler | 19 | Cartoon | Optional | DONE | images/ch19/fig-helpful-scheduler.prompt.md |
| fig-one-list | 19 | Diagram | Core | DONE | images/ch19/fig-one-list.prompt.md |
| fig-step-away | 20 | Cartoon | Core | DONE | images/ch20/fig-step-away.prompt.md |
| fig-racehorse | 20 | Cartoon | Optional | DONE | images/ch20/fig-racehorse.prompt.md |
| fig-signal-box | 20 | Diagram | Core | DONE (signal-box concept, supersedes switchboard) | images/ch20/fig-signal-box.prompt.md |

## Marginalia (9 one-off marks)

| ID | Ch | Anchor | Prompt |
|----|----|--------|--------|
| mark-ch01-underline | 1 | 'It is not a busy patch. It is the design.' — DONE | images/marginalia/mark-ch01-underline.prompt.md |
| mark-ch02-arrow-order | 2 | 'Automation first, people second.' — DONE | images/marginalia/mark-ch02-arrow-order.prompt.md |
| mark-ch04-circle-test | 4 | the clear-set-of-steps test — DONE | images/marginalia/mark-ch04-circle-test.prompt.md |
| mark-ch06-arrow-read-twice | 6 | 'A bad process, automated...' — DONE | images/marginalia/mark-ch06-arrow-read-twice.prompt.md |
| mark-ch08-arrow-keystone | 8 | first naming of 'your Keystone' — DONE | images/marginalia/mark-ch08-arrow-keystone.prompt.md |
| mark-ch12-underline-guardrails | 12 | 'Write the guardrails first.' — DONE | images/marginalia/mark-ch12-underline-guardrails.prompt.md |
| mark-ch18-scrawl-maths | 18 | the hourly-rate calculation — DONE | images/marginalia/mark-ch18-scrawl-maths.prompt.md |
| mark-ch19-circle-priorities | 19 | the word 'priorities' — DONE | images/marginalia/mark-ch19-circle-priorities.prompt.md |
| mark-ch20-arrow-off-page | 20 | 'go and do what only you can do' — DONE | images/marginalia/mark-ch20-arrow-off-page.prompt.md |
