#!/bin/bash

set -euo pipefail

# === CONFIGURATION ===
REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

WORKTREE_DIR="$REPO_ROOT/../worktrees"
BRANCH_PREFIX="feat/claude-agent"

# === OPTIONS ===
DELETE_BRANCHES=false
DRY_RUN=false

# === PARSE FLAGS ===
while [[ $# -gt 0 ]]; do
  case "$1" in
    --delete-branches) DELETE_BRANCHES=true; shift ;;
    --dry-run) DRY_RUN=true; shift ;;
    *) echo "❌ Unknown option: $1"; exit 1 ;;
  esac
done

echo "🔍 Looking for worktrees in: $WORKTREE_DIR"

if [[ ! -d "$WORKTREE_DIR" ]]; then
  echo "✅ No worktree directory found. Nothing to clean."
  exit 0
fi

CLEANED=0

for dir in "$WORKTREE_DIR"/"$BRANCH_PREFIX"-*; do
  if [[ -d "$dir" ]]; then
    BRANCH=$(basename "$dir")

    echo "🧹 Found worktree: $dir (branch: $BRANCH)"

    if $DRY_RUN; then
      echo "   💡 [dry-run] Would remove: $dir"
    else
      git worktree remove --force "$dir"
      echo "   ✅ Removed worktree: $dir"
      ((CLEANED++))
    fi

    # Optionally delete the branch if merged
    if $DELETE_BRANCHES; then
      if git show-ref --quiet "refs/heads/$BRANCH"; then
        if git branch --merged main | grep -q "$BRANCH"; then
          if $DRY_RUN; then
            echo "   💡 [dry-run] Would delete merged branch: $BRANCH"
          else
            git branch -d "$BRANCH"
            echo "   🗑️  Deleted merged branch: $BRANCH"
          fi
        else
          echo "   ⚠️  Branch $BRANCH not merged. Skipping deletion."
        fi
      fi
    fi
  fi
done

echo ""
echo "✨ Cleanup complete. Worktrees cleaned: $CLEANED"

