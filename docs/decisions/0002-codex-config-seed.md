# 0002: Codex configuration seed pattern

- Status: Proposed
- Date: 2026-10-14

## Context

`~/.codex/config.toml` mixes portable preferences (model, sandbox and
approval policy, plugin toggles, desktop theme) with machine-specific paths,
private project names, generated hook hashes, and MCP hosts and credential
helpers. Tracking the live file would leak private work material and churn on
every Codex rewrite. TOML has no import mechanism and Codex offers no include
directive, so a fragment cannot be referenced from the live file.

## Decision

Track a seed-only fragment at `codex/config.seed.toml` with portable,
non-sensitive defaults, applied one-way by `codex/seed-codex-config.sh`,
which adds only missing keys and never overwrites or syncs back local state.

## Consequences

New-machine setup reproduces baseline Codex behavior while local edits and
Codex-managed state stay local and untracked. Changing a tracked default does
not update machines where the key already exists; those edits stay manual.
The fragment needs periodic review when Codex adds keys worth tracking.

## Alternatives considered

Tracking the live file was rejected (private project paths, generated state,
constant churn). A `--profile` overlay was rejected (requires an explicit flag
on every invocation). Two-way sync was rejected (stale copies, merge
conflicts against app-owned state).

## Links

- [`codex/config.seed.toml`](../../codex/config.seed.toml)
- [`codex/seed-codex-config.sh`](../../codex/seed-codex-config.sh)
