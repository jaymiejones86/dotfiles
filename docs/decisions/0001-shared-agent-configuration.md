# 0001: Shared agent configuration ownership

- Status: Accepted
- Date: 2026-09-29

## Context

Global instructions previously lived under `home/.codex/`. Personal skills were split between Codex, Claude, and `~/.agents/skills/`. The user asked for one tracked, provider-neutral inventory.

## Decision

Track global instructions at `home/.agents/AGENTS.md` and personal shared skills as complete directories under `home/.agents/skills/`. Link the instructions into provider-specific global paths and link each skill into Claude's personal skill directory. Codex discovers `~/.agents/skills/` directly. Preserve existing provider-managed skills and private work-specific skills outside this public repository.

## Consequences

`install.sh` maintains links without replacing unknown content. Migration of existing provider copies requires comparison and a backup. Skill names must remain unique within the shared inventory. Provider-specific features inside a shared skill may still need provider-specific validation.

## Alternatives considered

Keeping `home/.codex/` canonical would retain provider-specific ownership. Linking whole provider skill directories would risk replacing runtime or plugin content. Both were rejected.

## Affected implementation

- [`install.sh`](../../install.sh)
- [`README.md`](../../README.md)
- [`home/.agents/AGENTS.md`](../../home/.agents/AGENTS.md)
