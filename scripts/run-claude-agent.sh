#!/bin/bash

set -euo pipefail

# === USAGE ===
# ./run-claude-agent.sh [optional-branch-name] [-- claude-args...]

# === CONTEXT ===
REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

WORKTREE_BASE="$REPO_ROOT/../worktrees"
mkdir -p "$WORKTREE_BASE"

# Optional: user-provided branch name, otherwise use timestamp
USER_BRANCH="${1:-}"
shift || true  # move past branch arg if provided

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BRANCH_NAME="${USER_BRANCH:-feat/claude-agent-$TIMESTAMP}"
WORKTREE_PATH="$WORKTREE_BASE/$BRANCH_NAME"

# === MAIN LOGIC ===

echo "🔍 Detected repo root: $REPO_ROOT"
echo "🌿 Creating branch: $BRANCH_NAME"
echo "📁 Worktree location: $WORKTREE_PATH"

# Create new branch from current HEAD
git switch -c "$BRANCH_NAME"

# Create worktree
git worktree add "$WORKTREE_PATH" "$BRANCH_NAME"

# Navigate to worktree
cd "$WORKTREE_PATH"

# === CLAUDE EXECUTION ===

echo "🚀 Running Claude Code in isolated workspace..."
CLAUDE_CMD="claude-code run $*"
eval "$CLAUDE_CMD"

echo "✅ Claude Code completed in: $WORKTREE_PATH"

# === Instructions ===

echo ""
echo "🧭 Navigate to review:"
echo "   cd $WORKTREE_PATH"
echo ""
echo "🧹 Clean up when ready:"
echo "   git worktree remove \"$WORKTREE_PATH\""
echo "   git branch -d \"$BRANCH_NAME\"  # Only if safe to delete"
