#!/usr/bin/env bash
#
# cleanup.sh — remove leftover Claude Code session worktrees and their branches.
#
# Claude Code creates a temporary worktree (a hidden checkout under
# .claude/worktrees/) for each session. Once a session's work is merged, that
# folder just sits around. This tidies them up.
#
# Run it from your NORMAL project folder:
#     cd ~/Websites/GitHub/jeffvansteijn.nl && ./cleanup.sh
#
# It is safe: it only removes worktrees under .claude/worktrees/, and it will
# NOT delete a branch that still has unmerged work (it keeps those and tells you).

set -euo pipefail

# --- Safety: refuse to run from inside a linked worktree ---------------------
git_dir=$(cd "$(git rev-parse --git-dir)" && pwd)
common_dir=$(cd "$(git rev-parse --git-common-dir)" && pwd)
if [ "$git_dir" != "$common_dir" ]; then
  echo "✋ You're inside a session worktree, not your main folder."
  echo "   Run this from your normal project instead:"
  echo "     cd ~/Websites/GitHub/jeffvansteijn.nl && ./cleanup.sh"
  exit 1
fi

repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root"
current_branch=$(git rev-parse --abbrev-ref HEAD)

echo "Repo:            $repo_root"
echo "Current branch:  $current_branch"
echo

# --- Remove every worktree under .claude/worktrees/ --------------------------
removed_any=false
while IFS= read -r wt; do
  case "$wt" in
    "$repo_root/.claude/worktrees/"*)
      echo "→ removing worktree: ${wt#$repo_root/}"
      git worktree remove --force "$wt"
      removed_any=true
      ;;
  esac
done < <(git worktree list --porcelain | awk '/^worktree /{print $2}')
$removed_any || echo "→ no session worktrees to remove"
git worktree prune
echo

# --- Delete leftover claude/* branches (safely) ------------------------------
deleted_any=false
while IFS= read -r br; do
  [ "$br" = "$current_branch" ] && continue
  if git branch -d "$br" >/dev/null 2>&1; then
    echo "→ deleted merged branch: $br"
    deleted_any=true
  else
    echo "→ kept UNMERGED branch: $br"
    echo "    (has work not on main — delete manually with 'git branch -D $br' only if you're sure)"
  fi
done < <(git for-each-ref --format='%(refname:short)' refs/heads/claude/ 2>/dev/null || true)
$deleted_any || echo "→ no claude/* branches removed"
echo

echo "✅ Cleanup done. Remaining worktrees:"
git worktree list
