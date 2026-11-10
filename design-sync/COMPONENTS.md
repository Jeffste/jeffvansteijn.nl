# Component map — for "Design in codebase"

Start here. These are the four pieces to iterate on, each mapped to its **token
source**, its **live CSS**, and the **standalone preview** in this folder. Edit the
SCSS (source of truth); keep the matching preview in sync so the Design cards don't drift.

Stack: Hugo static site. Styles are SCSS compiled + inlined at build time
(`themes/yaz/layouts/partials/head.html`). Two themes via a root class: `html.light`
/ `html.dark`, driven by CSS variables.

Direction: **Forest + Newsreader**. One brand colour (forest green), no orange.
Serif (Newsreader) for headings, titles and quotes; Inter for body, buttons and labels.

## Token sources (read these first)

- **Colors** — `themes/yaz/assets/scss/variables.scss`.
  `$color-light-*` and `$color-dark-*`, surfaced as CSS vars in the theme mixins
  (`styles.scss:40` / `:54`): `--base-color`, `--surface-color`, `--card-color`,
  `--title-color`, `--text-color`, `--primary-color` (`#1E3A2C`), `--primary-hover`,
  `--on-primary-color`, `--accent-color` (`#2F6B4C`, labels/links), `--divider-color`,
  `--hover-color` (`#EFECE4`).
- **Type** — `themes/yaz/assets/scss/typography.scss:23–50`.
  `--font-heading: 'Newsreader'`, `--font-body: 'Inter'`; clamp scale
  `--font-size-sm … --font-size-xxl`; line-heights `--lh-tight/normal/loose`.
- **Radii** — `typography.scss:29–30`: `--radius-xs: 4px`, `--radius-md: 12px`.
  Nested rule: **outer = inner + padding** (12 = 4 + 8).
- **Fonts** — `@font-face` for Newsreader (roman + italic, variable 200–800),
  InterVariable and Tiempos (kept, unused) in `styles.scss:11–37`. Files in `/static/`.

## The four components

### 1. Colors — `design-sync/colors.html` · group: Foundations
- Source of truth: `variables.scss` (both palettes).
- Change colors here; everything else inherits via the CSS vars.

### 2. Type — `design-sync/type.html` · group: Foundations
- Source of truth: `typography.scss` (scale + heading/body rules); editorial
  **pull-quote** at `typography.scss:129` (`blockquote`, Newsreader italic).

### 3. Work-list rows ("M1 Quiet") — `design-sync/work-list.html` · group: Components
- CSS: `styles.scss:952` (block start), `.work-wide-list` `:955`, `.work-wide` `:979`,
  `.work-wide-arrow` `:1053`. 72×56 thumbnail (4px radius) · Newsreader title
  (truncates; wraps to 2 lines under 600px) · area label in accent green under the
  title · no dividers · hover/focus: paper tile `--hover-color` (12px radius) + forest
  arrow circle. Overrides the global `a:hover { opacity: .7 }`.
- Markup: `themes/yaz/layouts/work/list.html` (ranges `.Pages`, `.Params.label`).
- **Live** on `/work/`.

### 4. Hero cards — `design-sync/hero-cards.html` · group: Components
- CSS: `styles.scss:1097` (block start), `.hero-card-link` `:1111`, `.hero-card` `:1144`,
  meta row (`.hero-card-label` / `.hero-card-company`). Card bg via `--card-bg`.
- **Note:** not currently used by any layout and **not yet restyled** for the Forest
  direction (preview still shows the old palette). Parked.

## Out of scope (don't touch from the design flow)
- `design-sync/` previews reference images from the live site via absolute URLs and
  load Newsreader from Google Fonts (works before deploy) — fine for Design, but the
  **real** styles live in `themes/yaz/`.
- Lock screen (`staticrypt/template.html`), the TOC (`styles.scss` `.work-toc*`) and the
  standalone CV page (`layouts/_default/cv.html`, own inline palette) are excluded.

## Workflow
Edit SCSS in `themes/yaz/assets/scss/` → `hugo server -D` to preview the real site →
mirror the change into the matching `design-sync/*.html` so the Design card stays true.
