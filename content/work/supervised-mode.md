+++
title = 'Supervised Mode: Putting Humans Back in the AI Loop'
date = 2026-06-18T22:00:00+02:00
summary = ''
description = "Trengo"
image = "/images/preview-001@2x.png"
bg = "#FAF9F5"
label = "AI & Human Oversight"
draft = true
+++

<div class="case-meta">
  <div><b>Role</b><br>Lead Product Designer</div>
  <div><b>Timeline</b><br>Jan – May 2026</div>
  <div><b>Team</b><br>1 PM, 3 Engineers, 1 Researcher, 1 Designer</div>
  <div><b>Year shipped</b><br>2026</div>
  <div><b>Skills</b><br>Product Design, Research, Systems Thinking</div>
</div>

## TLDR

We shipped Supervised Mode — a workspace where human agents review every AI-generated reply before it reaches a customer. In six weeks it became the default setting across 78% of accounts, and lifted agent confidence in AI from a 4 to an 8 out of 10.

AI can answer faster than any human can read. But for every business we spoke to, speed wasn't the bottleneck — trust was. Compliance teams wanted a paper trail. Brand managers wanted a final say. Agents wanted to feel like collaborators, not bystanders. Supervised Mode is what came out of taking that seriously.

![Overview](/images/preview-002@2x.png)

<div class="clearfix"></div>

## The problem

AI replies were going out instantly — and silently. Agents felt sidelined, customers felt unsure who they were talking to, and one off-tone reply was enough to undo months of relationship work. Speed without oversight wasn't a feature; it was a liability waiting to surface.

## Discovery

We ran 14 interviews with support agents across five accounts, paired with three months of reply-audit analytics. The signal was consistent: agents weren't trying to slow AI down — they wanted a way to vouch for it. Confidence wasn't built by fewer replies; it was built by being able to *see* what the AI was thinking before it spoke.

> *"I don't want fewer AI replies. I want to feel confident about the ones I let through."*
> — Senior agent, mid-market customer

![Research findings](/images/preview-003@2x.png)

<div class="clearfix"></div>

## How might we…

> **How might we make AI oversight feel like leverage, not surveillance?**

## Design principles

We agreed on three constraints before drawing a single screen:

- **Reviewable in under 3 seconds.** If approval takes longer than reading the original message, no one will use it.
- **Always show the reasoning.** Every AI suggestion ships with the source and the why.
- **Trust earned, not assumed.** Autonomy expands as confidence grows — never the other way around.

![Design principles](/images/preview-005@2x.png)

<div class="clearfix"></div>

## Trade-offs we made

We considered a full autopilot toggle — let agents flip AI to fully autonomous in trusted channels. We cut it. Trust takes months to build and one bad auto-reply could undo it overnight. The version we shipped keeps the human in the loop by default and lets teams loosen the leash deliberately, channel by channel, rather than all at once.

![Trade-offs](/images/preview-007@2x.png)

<div class="clearfix"></div>

## Outcome

Six weeks after launch, across the first 47 accounts on the beta:

- **73%** of AI-suggested replies approved without edits
- **4.2s** average review time per reply
- **31%** drop in escalations to senior agents
- **78%** of accounts left Supervised Mode on as the default after the trial ended

> *"It used to feel like the AI was doing my job. Now it feels like I'm doing my job better."*
> — Support lead, enterprise account

![Outcomes](/images/preview-tudor@2x.png)

<div class="clearfix"></div>

## Reflection

- **Show your work.** Agents trust AI more when they can see the reasoning, not just the output. The reasoning panel — the smallest piece of UI in the project — drove the biggest behaviour shift.
- **Cut features to earn trust.** Less autonomy at launch made the autonomy we *did* ship feel safer. Restraint, here, was the design.
