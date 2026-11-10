# design-sync

Standalone HTML previews of this site's core UI, for iterating in **Claude Design**
(claude.ai/code → Design). Each file is self-contained: the real design tokens are
inlined, and fonts + sample images load from the live site over absolute URLs, so the
files render anywhere without the Hugo build.

## Files

| File | Group | Component |
|------|-------|-----------|
| `colors.html` | Foundations | Light + dark palette swatches |
| `type.html` | Foundations | Tiempos headings, Inter body, clamp scale, pull-quote |
| `work-list.html` | Components | `/work/` table rows (light + dark, hover state) |
| `hero-cards.html` | Components | Homepage hero card (light + dark) |

The first line of each file is a `<!-- @dsCard group="…" -->` marker; Claude Design
reads it to index and group the preview automatically.

## Round-trip

1. **Authorize once** — in an interactive `claude` terminal on this machine, run
   `/design-login`. (Headless/app sessions reuse that authorization.)
2. **Push** — ask Claude to sync this folder: it runs DesignSync
   `list_projects` → `create_project` → `finalize_plan` → `write_files`.
   Or drag these `.html` files straight into a Claude Design project.
3. **Iterate** visually in Claude Design.
4. **Bring changes back** — Claude pulls the changed file (`get_file`) and translates
   it into `themes/yaz/assets/scss/*.scss`, one component at a time. Never a wholesale
   replace — the site's source of truth stays the SCSS.

## Source of truth

These previews mirror the live styles but are **not** wired into the build. When a
design changes here, port it back into the theme's SCSS by hand (or with Claude) — the
preview is the sketchpad, `themes/yaz/` is the real thing.

## Keeping in sync

Tokens live in `themes/yaz/assets/scss/variables.scss`; the component CSS lives in
`styles.scss` (and `typography.scss`). If those change, update the matching inline CSS
here so the previews don't drift.
