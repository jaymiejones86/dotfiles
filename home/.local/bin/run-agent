#!/bin/bash

set -euo pipefail

# === USAGE ===
# ./run-agent.sh <software> [optional-branch-name] [-- agent-args...]
# software: claude, amp, or opencode

# === VALIDATE SOFTWARE ARGUMENT ===
if [[ $# -lt 1 ]]; then
  echo "❌ Usage: $0 <software> [branch-name] [-- agent-args...]"
  echo "   software: claude, amp, or opencode"
  exit 1
fi

SOFTWARE="$1"
shift

# Validate software choice
case "$SOFTWARE" in
  claude|amp|opencode) ;;
  *) echo "❌ Invalid software: $SOFTWARE. Must be: claude, amp, or opencode"; exit 1 ;;
esac

# === CONTEXT ===
REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

WORKTREE_BASE="$REPO_ROOT/../worktrees"
mkdir -p "$WORKTREE_BASE"

# Optional: user-provided branch name, otherwise use timestamp
USER_BRANCH="${1:-}"
shift || true  # move past branch arg if provided

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BRANCH_NAME="${USER_BRANCH:-feat/agent-$SOFTWARE-$TIMESTAMP}"
WORKTREE_PATH="$WORKTREE_BASE/$BRANCH_NAME"

# === MAIN LOGIC ===

echo "🔍 Detected repo root: $REPO_ROOT"
echo "🤖 Using software: $SOFTWARE"
echo "🌿 Creating branch: $BRANCH_NAME"
echo "📁 Worktree location: $WORKTREE_PATH"

# Create new branch from current HEAD
mkdir -p "$WORKTREE_PATH"

# Create worktree
git worktree add -b "$BRANCH_NAME" "$WORKTREE_PATH"

# Navigate to worktree
cd "$WORKTREE_PATH"

# === AGENT EXECUTION ===

echo "🚀 Running $SOFTWARE in isolated workspace..."

# Map software to command
case "$SOFTWARE" in
  claude)
    AGENT_CMD="otter claude-code $*"
    ;;
  amp)
    AGENT_CMD="amp $*"
    ;;
  opencode)
    AGENT_CMD="opencode $*"
    ;;
esac

eval "$AGENT_CMD"

echo "✅ $SOFTWARE completed in: $WORKTREE_PATH"

# === Instructions ===

echo ""
echo "🧭 Navigate to review:"
echo "   cd $WORKTREE_PATH"
echo ""
echo "🧹 Clean up when ready:"
echo "   git worktree remove \"$WORKTREE_PATH\""
echo "   git branch -d \"$BRANCH_NAME\"  # Only if safe to delete"
