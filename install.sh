#!/usr/bin/env bash

set -euo pipefail

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
home_root="$repo_root/home"
home_directory=$(CDPATH= cd -- "$HOME" && pwd -P)
dry_run=false
install_brew=false
install_fonts=false
adopt_count=0
adopted=0
linked=0
unchanged=0
migrated=0
conflicts=0
removed_legacy=0
prepared_directories=$'\n'
adopt_paths=()

usage() {
  cat <<'EOF'
Usage: ./install.sh [options]

Link the files under home/ to the equivalent paths in $HOME.

Options:
  --adopt FILE  Move a file from $HOME into home/ and replace it with a link
  --all         Link dotfiles, install Brewfile packages, and install fonts
  --brew        Install packages with Homebrew Bundle
  --fonts       Copy bundled fonts to ~/Library/Fonts
  --dry-run     Print changes without modifying the filesystem
  -h, --help    Show this help

Repeat --adopt to add more than one file. Directories and paths outside $HOME
are rejected.
EOF
}

log_command() {
  printf '+'
  printf ' %q' "$@"
  printf '\n'
}

run() {
  if $dry_run; then
    log_command "$@"
  else
    "$@"
  fi
}

link_points_into_repo() {
  local target=$1
  local link_target

  link_target=$(/usr/bin/readlink "$target")
  case "$link_target" in
    "$repo_root"|"$repo_root"/*) return 0 ;;
    *) return 1 ;;
  esac
}

# Older versions linked whole application directories. Convert those links to
# real directories so generated files remain outside this repository.
materialize_directory() {
  local directory=$1
  local temporary

  if [[ -L $directory ]]; then
    if ! link_points_into_repo "$directory"; then
      printf 'conflict: directory is an unmanaged symlink: %s -> %s\n' \
        "$directory" "$(/usr/bin/readlink "$directory")" >&2
      conflicts=$((conflicts + 1))
      return 1
    fi

    printf 'migrate: %s (managed directory link -> real directory)\n' "$directory"
    if ! $dry_run; then
      temporary="${directory}.dotfiles.$$"
      mkdir -p "$temporary"
      if [[ -d $directory ]]; then
        cp -pR "$directory/." "$temporary/"
      fi
      rm "$directory"
      mv "$temporary" "$directory"
    fi
    migrated=$((migrated + 1))
    return 0
  fi

  if [[ -e $directory ]]; then
    if [[ ! -d $directory ]]; then
      printf 'conflict: parent path is not a directory: %s\n' "$directory" >&2
      conflicts=$((conflicts + 1))
      return 1
    fi
    return 0
  fi

  run mkdir -p "$directory"
}

ensure_directory() {
  local directory=$1
  local parent

  [[ $directory == "$HOME" ]] && return 0
  [[ $prepared_directories == *$'\n'"$directory"$'\n'* ]] && return 0
  parent=$(dirname "$directory")
  ensure_directory "$parent" || return 1
  materialize_directory "$directory" || return 1
  prepared_directories+="$directory"$'\n'
}

link_file() {
  local source=$1
  local relative=${source#"$home_root"/}
  local target="$HOME/$relative"
  local current

  ensure_directory "$(dirname "$target")" || return

  if [[ -L $target ]]; then
    current=$(/usr/bin/readlink "$target")
    if [[ $current == "$source" ]]; then
      unchanged=$((unchanged + 1))
      return
    fi
    if ! link_points_into_repo "$target"; then
      printf 'conflict: refusing to replace unmanaged link: %s -> %s\n' \
        "$target" "$current" >&2
      conflicts=$((conflicts + 1))
      return
    fi
    run rm "$target"
  elif [[ -e $target ]]; then
    if [[ -f $target ]] && cmp -s "$source" "$target"; then
      printf 'adopt: %s (identical file -> managed link)\n' "$target"
      run rm "$target"
    else
      printf 'conflict: refusing to replace existing path: %s\n' "$target" >&2
      conflicts=$((conflicts + 1))
      return
    fi
  fi

  run ln -s "$source" "$target"
  printf 'link: %s -> %s\n' "$target" "$source"
  linked=$((linked + 1))
}

adopt_file() {
  local input=$1
  local candidate
  local parent
  local target
  local relative
  local source

  case "$input" in
    "~") candidate=$HOME ;;
    "~/"*) candidate="$HOME/${input:2}" ;;
    /*) candidate=$input ;;
    *) candidate="$PWD/$input" ;;
  esac

  parent=$(dirname "$candidate")
  if [[ ! -d $parent ]]; then
    printf 'error: adopt parent directory does not exist: %s\n' "$parent" >&2
    return 1
  fi
  parent=$(CDPATH= cd -- "$parent" && pwd -P)
  target="$parent/$(basename "$candidate")"

  case "$target" in
    "$home_directory"/*) relative=${target#"$home_directory"/} ;;
    *)
      printf 'error: can only adopt files inside $HOME: %s\n' "$target" >&2
      return 1
      ;;
  esac
  source="$home_root/$relative"

  if [[ -L $target ]]; then
    if [[ $(/usr/bin/readlink "$target") == "$source" ]]; then
      printf 'unchanged: already managed: %s\n' "$target"
      return 0
    fi
    printf 'error: refusing to adopt a symlink: %s -> %s\n' \
      "$target" "$(/usr/bin/readlink "$target")" >&2
    return 1
  fi
  if [[ ! -e $target ]]; then
    printf 'error: adopt target does not exist: %s\n' "$target" >&2
    return 1
  fi
  if [[ ! -f $target ]]; then
    printf 'error: adopt accepts regular files only: %s\n' "$target" >&2
    return 1
  fi

  if [[ -e $source || -L $source ]]; then
    if [[ -f $source ]] && cmp -s "$source" "$target"; then
      printf 'adopt: identical repository file already exists: %s\n' "$source"
      adopted=$((adopted + 1))
      return 0
    fi
    printf 'error: managed path already exists with different content: %s\n' \
      "$source" >&2
    return 1
  fi

  if git -C "$repo_root" check-ignore -q -- "home/$relative"; then
    printf 'error: refusing to adopt an ignored repository path: home/%s\n' \
      "$relative" >&2
    return 1
  fi

  run mkdir -p "$(dirname "$source")"
  run mv "$target" "$source"
  printf 'adopt: %s -> %s\n' "$target" "$source"
  adopted=$((adopted + 1))

  if $dry_run; then
    log_command ln -s "$source" "$target"
    printf 'link: %s -> %s\n' "$target" "$source"
    linked=$((linked + 1))
  fi
}

remove_legacy_link() {
  local target=$1

  if [[ -L $target ]] && link_points_into_repo "$target"; then
    run rm "$target"
    printf 'remove: obsolete managed link: %s\n' "$target"
    removed_legacy=$((removed_legacy + 1))
  fi
}

link_dotfiles() {
  local source

  while IFS= read -r source; do
    link_file "$source"
  done < <(find "$home_root" \( -type f -o -type l \) -print | LC_ALL=C sort)
}

install_homebrew_packages() {
  if ! command -v brew >/dev/null 2>&1; then
    printf 'error: Homebrew is required for --brew\n' >&2
    return 1
  fi
  run brew bundle --file "$repo_root/Brewfile"
}

install_font_files() {
  local font
  local target="$HOME/Library/Fonts"

  [[ $(uname -s) == Darwin ]] || {
    printf 'error: --fonts is currently supported only on macOS\n' >&2
    return 1
  }

  run mkdir -p "$target"
  while IFS= read -r font; do
    run cp -f "$font" "$target/$(basename "$font")"
  done < <(find "$repo_root/fonts" -type f ! -name '.DS_Store' -print | LC_ALL=C sort)
}

while (($#)); do
  case "$1" in
    --all)
      install_brew=true
      install_fonts=true
      ;;
    --adopt)
      if (($# < 2)); then
        printf 'error: --adopt requires a file path\n' >&2
        exit 2
      fi
      adopt_paths[$adopt_count]=$2
      adopt_count=$((adopt_count + 1))
      shift
      ;;
    --brew) install_brew=true ;;
    --fonts) install_fonts=true ;;
    --dry-run) dry_run=true ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'error: unknown option: %s\n\n' "$1" >&2
      usage >&2
      exit 2
      ;;
  esac
  shift
done

remove_legacy_link "$HOME/.alacritty.toml"
remove_legacy_link "$HOME/.alacritty.yml"

for ((index = 0; index < adopt_count; index++)); do
  adopt_file "${adopt_paths[$index]}"
done

link_dotfiles

if [[ -L $HOME/.gnupg ]] && link_points_into_repo "$HOME/.gnupg"; then
  printf 'warning: ~/.gnupg still points into this repository; see README.md before migrating it.\n' >&2
fi

if ((conflicts)); then
  printf '\n%d conflict(s); existing unmanaged files were left unchanged.\n' "$conflicts" >&2
  exit 1
fi

$install_brew && install_homebrew_packages
$install_fonts && install_font_files

printf '\nDotfiles: %d adopted, %d linked, %d unchanged, %d directory links migrated, %d obsolete links removed.\n' \
  "$adopted" "$linked" "$unchanged" "$migrated" "$removed_legacy"
