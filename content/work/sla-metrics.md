+++
title = 'Adding SLA metrics to Trengo'
date = 2026-10-16T12:00:00+02:00
summary = "A setting where an admin sets response-time promises per channel, and the analytics show where those promises break."
description = "Trengo"
image = "/images/preview-002@2x.png"
bg = "#FAF9F5"
label = "SLAs & Analytics"
draft = true
+++

<div class="case-meta">
  <div><b>Role</b><br>Senior Product Designer</div>
  <div><b>Team</b><br>PM, Engineering, Design</div>
  <div><b>Contribution</b><br>Led design</div>
  <div><b>Status</b><br>Shipped</div>
  <div><b>Skills</b><br>Product Design, Prototyping, Analytics</div>
</div>

## The problem

Trengo's customers make promises to their own customers. Reply within an hour. Answer invoice questions the same day. Support teams live or die by them.

Trengo had no built-in way to set those promises or check whether they held.

Customers asked for it often. The ones who couldn't wait built it themselves, with rules and labels. It worked — powerful, in the way a spreadsheet with forty macros is powerful.

The catch: only a technical admin could set it up. And once it ran, seeing whether the promises were actually kept meant assembling the report by hand, every time.

So the job was never "invent SLAs." People wanted them badly enough to hack them together. The job was to take a proven workaround and make it structured, readable, and set-up-able by a normal admin — with the reporting built in instead of bolted on.

I treated the demand as settled. The risk sat elsewhere: in the model, and in the setup.

## What we believed

We believed that making SLAs a structured setting, instead of a rules-and-labels workaround, would take them beyond the technical few. More teams setting promises they could see. And analytics that let an admin spot long handling times without building a report by hand.

We'd know it worked when setup no longer needed an expert, and when admins used the analytics to find where responses ran slow.

Said plainly: this was a conviction, not a number we'd signed up to in advance. The demand was proven. Whether the redesign actually broadened use was still a bet.

## The approach

I didn't start with a research deck. I built a working prototype and used it to force decisions.

That's the cheapest way I know to make a trade-off real. A slide lets everyone nod at a vague model. A prototype makes you pick — what actually stops the first-response clock? You can't hand-wave a build.

The model went through three versions.

Version one bundled a first-response target and a resolution target into one policy per channel. Simple, but it forced two different promises to share one set of rules.

Version two let resolution vary by a custom field — invoices get 48 hours, everything else gets the default. Closer, but the bundle was still doing too much.

Version three split them. Each SLA is one type: first response or resolution, never both. You pick the type first, and the form shows only what that type needs. This became the direction.

To pressure-test the decisions, I:

- aligned PM and engineering directly in the prototype, so feasibility and design moved together;
- ran it through design reviews and iterated on what broke;
- borrowed the sharpest analytics ideas from a real customer's own dashboard — including the framing that became our rule for the AI question: the bot counts, auto-replies don't;
- walked a selected group of customers through the prototype and gathered their reactions.

That last one has a limit I'll own below: reactions are not the same as watching someone set it up.

## What I learned

The model was the whole game. I spent most of my energy there, and it paid off. Once I split SLAs into types, every hard question downstream got easier — coverage became per-type, exclusivity became one active SLA of each type per channel, and the analytics stopped pretending a first-response breach and a resolution breach were the same event. Get the model right and the interface mostly follows. Get it wrong and no amount of polish saves it.

The most useful thing I did was kill ideas early. A few that didn't survive:

- A single blended compliance number. Clean on a dashboard, meaningless underneath — it averages a slow first reply with a slow resolution as if they were one thing. We lead with per-type figures instead.
- A catch-all fallback policy. Tempting, but it hides coverage gaps. Better to show the gap honestly than paper over it.
- "Team" as a way to scope an SLA. A team is how you report, not what you promise. It didn't belong in the model.
- Version badges in the explainer. Too much was still undecided to imply a roadmap we couldn't back.

One trade-off I'll defend. First response counts any reply — the AI Agent's or a person's. The customer got an answer; who typed it doesn't change their wait. It's also the only version buildable today; measuring "first human response" needs a distinction the pipeline doesn't have yet.

The honest edge case: an AI that only says "an agent will be with you" still counts, and I can't detect whether a reply had substance. If that becomes a real problem, the fix is product-side, not a patch on the metric. I'd rather name the limit than pretend the number is cleaner than it is.

Two smaller principles held up. Make the invalid state unreachable instead of showing an error — if at least one target is required, disable the last toggle rather than let someone switch both off and then scold them for it. And guard destructive actions by naming what's lost: deleting a policy tells you "conversations on Info email will no longer have an SLA," not just "Delete?".

## The outcome

The prototype did its job. It settled the decisions a document argues about forever, and engineering built the real feature from it. It's live.

I don't have outcome numbers yet. It shipped recently, and anything I quoted now would be noise. So I won't quote one.

What I'll watch for: whether teams beyond the technical admins set SLAs up, and whether admins use the analytics to find slow handling — the two things we believed would change. If setup still needs an expert, we missed. I'd rather check that honestly in a few months than claim a win today.

## Looking back

My competitor research was thinner than it should have been. I leaned on one sharp lesson — Zendesk's "no priority set means no SLA at all," which is why every resolution SLA here carries a mandatory default row — but I didn't do a proper scan of how others handle this. A wider look might have surfaced patterns worth stealing, or traps worth avoiding, earlier. Next time I run the scan first, not in passing.
