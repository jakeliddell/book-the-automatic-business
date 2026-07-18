# The Tools: A Working Directory {.unnumbered}

This is the one part of the book with a shelf life.

Everything in the rest of the chapters is built to last, because it is about how to think, not which app to buy. The tools, though, change constantly. New ones launch, old ones get bought and rebranded, prices move, and every few months something leapfrogs whatever was best last year. So the tools live here, on their own, deliberately separated from the ideas. This is the only section you should expect to go out of date, and the only one worth revisiting.

A word of advice before the list. Choose the category first, then the tool. Decide what job needs doing, "I need a no-code connector," or "I need one place for client relationships," and only then pick a product to fill it. Pick one per job, learn it properly, and resist the urge to switch every time something shinier appears.  Switching is dead time - you need to be clear the new platform will deliver return on investment.

The names below are current at the time of writing; check for the latest before you commit, because most of them will have changed by the time you read this.

But also ask yourself a different question.  "Where am I now?" If you've already invested time and money in implementing a tool properly, there's a lot more at stake in switching: technical work, risk of disruption, cultural impact.  But a secret: from my experience of many, many clients, most haven't touched the surface of implementing their tools, using less than 20% of what the platform could do for them.  80:20, I suppose.  If you've seen the image of SaaS Spaghetti, and it resonated, you know you need to do some work; the only question is how you structure the change.  But don't be afraid of the change.  The less you've implemented, the easier it is to switch now.  And the harder it will be to switch later, once you actually get some of this stuff done.  If you don't already have a web of complex automations, get the foundations sorted now, before building on them.

On the subject of generic software verses software tailored to your industry, I would throw out a word of caution.  There are so many pieces of software that specialise in helping with the specific requirements of your industry.  Examples include Phorest for the beauty and salon industry, and Clio for the legal industry.  Both claim they are CRMs, despite their history of being a delivery platform, not a CRM.  I have personally investigated both of them, and they don't get close (at the time of writing) to being a best-practice CRM.

They are playing outside their lane, in order to capture more revenue from business owners who want to take the easy, no-thought, option.  When a niche software product claims it can support you outside the delivery lane they grew up in, be careful to fully evaluate that they can do all you will want them to do.  At the very least, make sure it has a mature API with wide coverage of functionality.

The categories follow the map from Chapter Seven: one home per block, and the knowledge and reporting layer over the top.

## AI Assistants: Your Reasoning Engine

These are the chat-style assistants from Chapter Five, your brilliant new hire. The main general-purpose ones are ChatGPT (from OpenAI), Claude (from Anthropic), Gemini (from Google) and Copilot (from Microsoft). In practice they are all highly capable, and they trade places at the top constantly, so do not agonise, but do take your time. The differences that matter for a business are both about raw cleverness and fit: Just because your world is already Microsoft 365, don't assume that Copilot is the right choice.  At the time of writing, in my own experience, Claude is better than Copilot inside Excel.  So try a few, pick one, pay for the proper paid tier (it is worth many times the cost), and learn to use it well, which matters far more than which one you chose. One thing to check for business use: choose a business or team plan that does not train on your data (usually as simple as a setting you make sure is chosen), so that what you paste in stays yours.

My picks at time of writing?  Anthropic Claude, or OpenAI ChatGPT.

There is a huge difference between the cost of access to a "chat" model, and using the same model through the API (for an automation, for example).  Once you go deep into configuring a Keystone, you will find that AI is more expensive, and you many not be able to justify just running on the current "best" model.  You'll go deeper into picking which model is right for which kind of task.  (Doing this will result in 10x savings.) I would give an honourable mention to OpenRouter.ai, which gives you access to almost all models via API, for a small premium.  In these days of flux, the premium justifies itself.

## No-Code Automation: The Connectors

The glue from Chapter Ten, the tools that pass work between your apps without code. The main options run from easiest to most powerful: Zapier (the simplest, with the most integrations), Make (more visual and more capable, often cheaper at volume, with a slightly steeper learning curve), and n8n (open and self-hostable, the most control and the most technical). Start with the easiest one that connects the tools you already use. You can always graduate later.

My opinionated choice?  It always used to be a choice of two - Zapier and Make.  Simple or Powerful.  But with n8n, Make almost feels redundant.  If it were me I'd pick Zapier if it's something simple for a non-technical team, or n8n if you're technically comfortable and excited in doing some amazing stuff.  But all of this is at risk of being obsolete if you end up embracing bespoke AI-generated tools.

## The Client Operating System: Your CRM Hub

The hub from Chapter Eleven, where every client relationship lives. Options include HighLevel (built specifically for service businesses, and genuinely all-in-one: CRM, booking, email and SMS, follow-up and more in a single place), HubSpot (polished and scalable, though it does get expensive as you grow), Pipedrive (simple and sales-pipeline-led), ActiveCampaign (strong on email marketing), and Salesforce (powerful, but enterprise-grade and usually overkill for a business this size, and is often found wanting in functionality breadth). For a service firm with a team, an all-in-one platform consolidates the most tools into one login, which is usually the bigger win.

As a previous reseller of ActiveCampaign, an implementor of Salesforce, someone who tried to use PipeDrive (it didn't work well), and done a handful of Hubspot migrations, my recommendation is HighLevel, which is why I currently resell it.  (For full transparency, I used to be an ActiveCampaign reseller, but moved away once I could no longer recommend it.)  But no business tool is perfect for every business.  You shouldn't assume one tool is right for you or your industry.  Get someone who knows the tools to help you choose, as ideally you'll be stuck with the decision for a long time.

## Scheduling

Tools to end the calendar ping-pong: Calendly, Acuity, and Cal.com (open-source). Often this is built into the all-in-one CRM above, in which case use that and save yourself another subscription.  (When I say "often", it actually isn't often, but it's built into HighLevel, part of the reason I recommend it.)  It's a key part of the puzzle, but not that complex or expensive.  Don't over-think it.

## Delivering the Work

The home for the Delivery block: who is doing what, for which client, by when. These will often include very specialist tools that are unique to your industry.  If you are choosing them, remember you're going to automate them, so you need to ensure that they already have an API that will allow you to do everything you do through the application automatically.

You will also need a task / issue tracking tool, irrespective of whether that's already in your delivery tool.  There are always a hundred tasks open for a business that are nothing to do with client work.

With the caveat that I don't think most to-do systems are fit for purpose (see below), options include Asana (clean, widely used, easy for a team to adopt), Trello (the simplest: boards and cards, and sometimes that is all you need), monday.com (flexible and visual, at the cost of some clutter), and ClickUp (pretends to do everything, which is both the appeal and the risk).

## One Ranked List: Deciding What Matters

Chapter Nineteen argues that your day runs on one ranked list, not a wall of boards and priority labels. One List (theautomaticbusiness.co.uk/onelist) is the tool I built to work exactly that way, for your work, your team's work, and work you share with clients. It is invite-only, and it is mine, so weigh this entry accordingly. If you would rather adapt a general-purpose task manager, there are litterally a thousand tools out there.  Most can't be used properly, as they rely on the classic High, Medium, Low to define order of importance, but Infinity or Microsoft To Do can be bent to the discipline if you try: a single list, dragged into honest order, with everything else treated as a lens.  They may fall down if you try to apply it across your teams.  Infinity is a particularly powerful tool that can be customised to deliver the One List concept, and they have some cheap options.

## Your Keystone: The Company Knowledge Base

This is the newest and least-settled category, so tread thoughtfully. At its simplest, a Keystone is a set of plain, well-organised documents in a shared, version-controlled place, maintained by an AI assistant. Approachable starting points are a markdown knowledge base like Obsidian, paired with one of the AI assistants above to read it, write to it, and keep it current. This area is moving quickly, and dedicated "company second brain" products are beginning to emerge, so expect better options to appear. The principle in Chapters Eight and Nine will not change even as the tools do.  However this can be a tricky thing to set up.  We are in beta on a solution to make it easier for you.  See theautomaticbusiness.co.uk/keystone for more details.

## Guardrails and the Pre-Mortem

Guardrails are not usually a separate product. They are checks you build inside the connectors and the hub above, which is why they have no shopping list. The thinking step has a tool, though. The Pessimist (theautomaticbusiness.co.uk/pessimist) is the free tool from Chapter Twelve: give it a process, and it will tell you where it is going to break and which guardrails to build. It costs nothing, and it is useful whether or not you ever automate a single step (although I'll be sad if you don't).

## Dashboards: Your Cockpit

The key here is not to just put up with the reporting already inside your hub and your accounts package; for most owners, the standard defaults is as far as it gets, but Chapter Fifteen's advice stands: seven numbers you trust beat forty you do not. If you want your handful of numbers from different systems on one screen, the connectors above can feed a simple dashboard tool such as Geckoboard or Databox. In reality what you need is your own personalised, always on, dashboard.  These days this doesn't have to be a SaaS-Spaghetti in it's own right.  There are tools like Noloco or AirTable that can hold the data, or you can create something more bespoke and cheaper in the long-run yourself.  Check out theautomaticbusiness.co.uk/dashboards for more information.

## The Money: Finance Block

The Finance block mostly means three jobs.

Accounting is core.  Xero and QuickBooks lead for a business this size; Both have rich APIs.  Xero wins for richness of API and already-built integration with the widest set of products.  FreeAgent gets an honourable mention as it's so beautifully simply presented, but the devil's in the detail here.  FreeAgent has been very slow to open up integration options in the past, and still hasn't (at time of writing) created triggers via webhooks, so it could tell you when something has been paid.  Webhooks are pretty key to keeping your external dashboard up to date in real-time.  Maybe a delayed poll will be ok for you.  But this slow release of features is a warning flag.

Payments and recurring billing are key.  Automatically receiving your money will eliminate an entire function designed to chase to get money.  Stripe is the leader for for cards and online payment, GoCardless for direct debit in the UK, both of which connect happily to everything else.

Proposals with e-signatures (PandaDoc, Docusign and their rivals, or build it into your CRM ideally, if your CRM provides this functionality).

## One Last Word on Tools

There will always be a newer tool, and there will always be someone insisting you must switch to it. You almost never should. If you're tempted, come back to here, take a deep breath, and think carefully about what the ROI of switching will be.

The businesses that win are not the ones with the trendiest stack. They are the ones who picked sensible tools, learned them, connected them, and then got on with the work. The strategy is in the chapters. This page is just the current set of spanners.  It's almost never the tech - it's what you do with it that matters.
