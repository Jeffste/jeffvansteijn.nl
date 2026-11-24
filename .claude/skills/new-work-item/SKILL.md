---
name: new-work-item
description: Create a new work item (case study) for jeffvansteijn.nl by interviewing Jeff about the project, starting with the problem, and turning his answers into a ready-to-review markdown file in content/work/. Use this whenever Jeff wants to add, draft, write up or start a case study, portfolio piece, project page or "work item", even if he only names the project ("let's add the SSO project", "I want to write up the inbox redesign") or pastes rough notes about something he shipped.
---

# New work item

A work item is a case study on `/work/`. It's one markdown file in `content/work/`, rendered by `themes/yaz/layouts/work/single.html`: title + lead (`summary`), a `.case-meta` header block, and H2 sections that feed the sticky table of contents. It also appears as a row in the work list (`themes/yaz/layouts/work/list.html`) with its cover, `label` and year. No layout, CSS or JS changes are needed. The machinery already exists.

The hard part isn't the file. It's the story. Jeff is a senior product designer, and his best case studies (read `content/work/sla-metrics.md` before starting; it's the reference for tone, though its headings are older than the fixed five below) are honest and specific: a real problem, what the team believed, the decisions and trade-offs, what didn't survive, and no invented numbers. The skill's job is to draw that out of him with good questions, then write it in his voice.

## 1. Interview, problem first

Ask **one question at a time** and wait for the answer. A wall of questions gets short, generic answers. Follow up when an answer is vague ("customers wanted it" → "how did you know? what were they doing instead?"). If Jeff pastes notes or a draft, read them first and only ask about the gaps.

Every work item uses the same five sections, in this order, so the questions follow them. Start with the opportunity, because everything else hangs off it:

1. **The opportunity.** What was broken or missing, and for whom? What were people doing instead (workarounds, lost deals, support load)? How did you know it was real?
2. **The hypothesis.** What did you believe would change, and how would you know it worked? Was it a measured target or a conviction?
3. **The approach.** How you worked: prototype, research, versions of the model, who you aligned with. What decisions did you have to force, and what trade-offs did you make?
4. **The outcome.** Is it shipped? Any real numbers? If there are none, say so. Never fill the gap.
5. **Learnings.** What held up, which ideas you killed and why, and what you'd do differently next time.

Then the metadata, which can be asked as one short batch at the end:

- Title, company (`description`, usually "Trengo"), card `label` (2–3 words, e.g. "SLAs & Analytics"), date or year.
- Case-meta rows: Role, Team, Timeline or Contribution, Status, Skills. Use only the rows Jeff gives.
- Cover image: an existing file in `assets/images/`, or a placeholder for now.
- Draft or live? Password-protected?

The table of contents is fixed. Every work item uses exactly these five H2s, with this wording and in this order: **The opportunity, The hypothesis, The approach, The outcome, Learnings.** Don't add, rename or drop any, so all case studies read the same way. A small project gets shorter sections, not fewer. Killed ideas and trade-offs go under The approach or Learnings, never in a heading of their own.

## 2. Write it in Jeff's voice

Match `sla-metrics.md`:

- First person, plain words, short sentences. Lead with the point.
- Specific over impressive: name the actual decision ("each SLA is one type, never both"), not "we streamlined the experience".
- Honest about limits. If there's no data, the page says so. Own weaknesses ("My competitor research was thinner than it should have been").
- Use Jeff's own phrasing and facts from the interview. **Never invent metrics, quotes, customer names, team sizes or dates.** If something's missing, leave a visible `TODO:` and mention it.
- Bullets only for real lists (killed ideas, steps). Everything else is prose.
- No em-dash pile-ups, no "leverage/seamless/delight".

## 3. Create the file

`content/work/<kebab-slug>.md` → URL `/work/<slug>/`.

```toml
+++
title = 'Adding SLA metrics to Trengo'
date = 2026-10-16T12:00:00+02:00
summary = "One sentence: what it is and why it matters. Shown as the lead."
description = "Trengo"
image = "/images/<cover>.png"
bg = "#FAF9F5"
label = "SLAs & Analytics"
draft = true
+++

<div class="case-meta">
  <div><b>Role</b><br>Senior Product Designer</div>
  <div><b>Team</b><br>PM, Engineering, Design</div>
  <div><b>Status</b><br>Shipped</div>
  <div><b>Skills</b><br>Product Design, Prototyping</div>
</div>

## The opportunity
…

## The hypothesis
…

## The approach
…

## The outcome
…

## Learnings
…
```

Notes:

- No H1 in the body. The title comes from front matter.
- H2s are the table of contents: exactly the five fixed headings above. Use H3s inside a section if it needs structure.
- Images: `![Alt text](/images/file.png)` followed by `<div class="clearfix"></div>`. Write real alt text.
- `draft = true` by default, so nothing goes live before Jeff has read it.
- **Protected items:** add `protected = true` (StatiCrypt encrypts at build). The password lives only in the Vercel env var `STATICRYPT_PASSWORD`. Never write it into any file, and never pass it on the command line.

## 4. Verify and hand over

1. Restart the `hugo` preview (Fast Render doesn't pick up new files reliably; the launch config runs with `-D`, so drafts show).
2. Check `/work/`: the new row shows with its cover, label and year.
3. Check `/work/<slug>/`: lead, case-meta, the TOC shows the five fixed sections in order (≥1100px wide), light and dark mode.
4. Tell Jeff in a few lines: where the file is, which `TODO:`s remain, and that it's a draft. Don't commit unless he asks. He works on `main` and pushes himself.
