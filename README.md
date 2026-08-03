# Dotfiles

macOS configuration stored in the same shape as the home directory it is
linked into. The repository can be cloned anywhere; `install.sh` derives its
location at runtime.

## Quick Start

On a new Mac, install the command-line tools and Homebrew, then clone the
repository:

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone https://github.com/jaymiejones86/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Preview the setup before changing anything:

```sh
./install.sh --dry-run
```

Then link the dotfiles and optionally install the declared packages and fonts:

```sh
./install.sh
./install.sh --brew --fonts
```

The repository does not install Oh My Zsh, language runtimes, credentials, or
SSH/GPG keys. Install those separately when needed. The shell configuration
guards optional tools, so it remains usable while the machine is bootstrapped.

## Layout

```text
.
├── home/       Files linked into $HOME, preserving their relative paths
├── fonts/      Optional font files copied into ~/Library/Fonts
├── gnupg/      GPG config and existing local state; not installed automatically
├── archive/    Inactive Bash, Vim, and superseded application configuration
├── Brewfile    Optional Homebrew Bundle packages
└── install.sh  Safe, idempotent linker and optional package/font installer
```

The path under `home/` is the complete source-to-target mapping. For example:

| Repository source | Installed target |
| --- | --- |
| `home/.zshrc` | `~/.zshrc` |
| `home/.config/nvim/init.lua` | `~/.config/nvim/init.lua` |
| `home/.config/ghostty/config` | `~/.config/ghostty/config` |
| `home/.bundle/config` | `~/.bundle/config` |
| `home/.local/bin/run-agent` | `~/.local/bin/run-agent` |

Only files are linked. Parent directories are real directories in `$HOME`, so
applications can create caches, lock files, and other runtime state without
writing into this repository.

## Install

Preview the link changes first:

```sh
./install.sh --dry-run
```

Create or update the links:

```sh
./install.sh
```

The installer is deliberately conservative:

- Existing links into this repository are updated during migrations.
- Legacy whole-directory links are converted to real directories while
  preserving their contents.
- Existing regular files and links managed elsewhere are reported as
  conflicts and are never overwritten.
- Re-running the installer is safe and reports already-correct links as
  unchanged.

Resolve a reported conflict by comparing and moving the existing target, then
run the installer again. There is no force option by design.

## Adopt New Configuration

When a new application creates a configuration file, adopt that specific file
into the repository:

```sh
./install.sh --adopt ~/.config/newapp/config.toml
```

This moves the file to `home/.config/newapp/config.toml` and replaces the
original with a symlink. Future edits made by either the application or in this
repository update the same file.

Preview an adoption without moving the file:

```sh
./install.sh --dry-run --adopt ~/.config/newapp/config.toml
```

Adopt several files in one run by repeating the option:

```sh
./install.sh \
  --adopt ~/.config/newapp/config.toml \
  --adopt ~/.config/newapp/keybindings.json
```

Adoption is explicit rather than automatic. The installer accepts regular
files inside `$HOME` and rejects directories, symlinks, ignored destinations,
and a path that would overwrite different managed content. Select stable
configuration files rather than whole application directories, which commonly
contain credentials, caches, sockets, databases, or other generated state.

After adoption, review `git status` and the file contents before committing.

## Optional Setup

Install packages declared in the Brewfile:

```sh
./install.sh --brew
```

Install bundled fonts on macOS:

```sh
./install.sh --fonts
```

Run links, packages, and fonts together:

```sh
./install.sh --all
```

These phases are opt-in so updating a symlink never unexpectedly downloads or
executes third-party software. Homebrew itself, Oh My Zsh, language runtimes,
SSH signing keys, and tool-specific plugins should be installed independently.

## Local Configuration

Machine-specific or private shell configuration belongs in `~/.localsettings`,
which `.zshrc` sources when present. Git also includes
`~/.local/.gitconfig-local` for machine-specific settings.

Do not add credentials, private keys, keyrings, caches, sockets, or generated
application state to `home/`.

## GPG Migration

The current `gnupg/` directory is intentionally excluded from automatic setup.
It contains tracked configuration alongside ignored live keyring state, and an
installer must not relocate private keys without an explicit review.

If `~/.gnupg` is a link into this repository, migrate it to a real directory
before using this setup on another machine:

1. Back up `~/.gnupg` securely.
2. Copy all of its contents to a temporary directory outside the repository.
3. Replace the symlink with that directory and set its mode to `0700`.
4. Keep `gpg.conf` and `gpg-agent.conf` there as regular local files, or manage
   those two files separately after verifying GnuPG permissions.
5. Confirm signing and decryption work before deleting the old repository copy.

Private-key material must never be committed, even when ignored by Git.

## Archived Configuration

`archive/` contains the previous Vim/Vundle, Vim-Plug, Bash, Alacritty YAML,
Pow, and theme configuration. It is retained for reference but is not linked.
The active editor configuration is Neovim with Lua under
`home/.config/nvim/`.
