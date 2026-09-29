# Dotfiles repository guidance

Read `README.md`, `CODING_STANDARDS.md`, and the [decision registry](docs/decisions/README.md) before editing.

This repository installs selected configuration from `home/` into `$HOME` through `install.sh`. It must preserve existing unmanaged files, directories, and links. Do not add credentials, private work material, caches, or generated application state to the public repository.

Agent instructions live in `home/.agents/AGENTS.md`. Shared personal skills live as complete directories in `home/.agents/skills/`; the installer creates per-skill links for Codex and Claude without replacing their provider-managed content. Keep the work-specific `ci-results` skill and the Claude-provided `frontend-design` skill outside this tracked inventory.

For installer changes, run `bash -n install.sh` and the relevant `./install.sh --dry-run` or `./install.sh --agent-links --dry-run` mode. Test live links only when authorized; dry-run output alone does not prove they work. Inspect the final Git diff and preserve unrelated changes.
