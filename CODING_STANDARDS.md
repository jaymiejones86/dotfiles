# Coding standards

The installer is Bash and uses `set -euo pipefail`. Quote path expansions, use arrays for argument lists, and keep link operations idempotent. Never overwrite unmanaged home-directory content. Keep provider aliases and the tracked skill inventory documented in `README.md`.

The canonical local verification entrypoints are `./install.sh --dry-run` for the full linker and `./install.sh --agent-links --dry-run` for agent setup. Run `bash -n install.sh` first. A full dry run can report unrelated configuration conflicts; distinguish those from agent-link conflicts. Live link checks require inspecting `readlink` and resolving the final file or `SKILL.md`. These checks do not verify provider UI discovery, cloud sessions, or remote installation.
