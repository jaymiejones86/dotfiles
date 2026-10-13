#!/usr/bin/env bash
#
# Seed portable Codex defaults into the Codex-owned ~/.codex/config.toml.
#
# One-way, missing-only: adds keys from codex/config.seed.toml that are
# absent locally. Never overwrites, deletes, or syncs local state back
# (project trust entries, hook hashes, MCP servers, marketplaces).
# See codex/config.seed.toml for what is (and is not) tracked.

set -euo pipefail

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
seed="$script_dir/config.seed.toml"
target="$HOME/.codex/config.toml"
dry_run=false

usage() {
  cat <<'EOF'
Usage: ./codex/seed-codex-config.sh [options]

Seed missing keys from codex/config.seed.toml into ~/.codex/config.toml.

Options:
  --seed PATH    Seed fragment (default: codex/config.seed.toml)
  --target PATH  Codex config file (default: ~/.codex/config.toml)
  --dry-run      Print what would be added without writing
  -h, --help     Show this help
EOF
}

while (($#)); do
  case "$1" in
    --seed)
      if (($# < 2)); then
        printf 'error: --seed requires a path\n' >&2
        exit 2
      fi
      seed=$2
      shift
      ;;
    --target)
      if (($# < 2)); then
        printf 'error: --target requires a path\n' >&2
        exit 2
      fi
      target=$2
      shift
      ;;
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

if ! command -v python3 >/dev/null 2>&1; then
  printf 'error: python3 is required to merge TOML\n' >&2
  exit 1
fi
if [[ ! -f $seed ]]; then
  printf 'error: seed file not found: %s\n' "$seed" >&2
  exit 1
fi

if $dry_run; then
  dry_flag=true
else
  dry_flag=false
fi

python3 - "$seed" "$target" "$dry_flag" <<'PY'
import os
import re
import sys
import tomllib

seed_path, target_path, dry_run = sys.argv[1], sys.argv[2], sys.argv[3] == "true"

try:
    with open(seed_path, "rb") as handle:
        seed = tomllib.load(handle)
except tomllib.TOMLDecodeError as exc:
    print(f"error: invalid TOML in seed file: {exc}", file=sys.stderr)
    sys.exit(1)

try:
    with open(target_path, "rb") as handle:
        current = tomllib.load(handle)
    with open(target_path, encoding="utf-8") as handle:
        text = handle.read()
    exists = True
except FileNotFoundError:
    current = {}
    text = ""
    exists = False
except tomllib.TOMLDecodeError as exc:
    print(f"error: invalid TOML in target file: {exc}", file=sys.stderr)
    sys.exit(1)

BARE = re.compile(r"[A-Za-z0-9_-]+\Z")
TABLE_RE = re.compile(r"\s*\[")


def fmt_seg(segment):
    if BARE.match(segment):
        return segment
    escaped = segment.replace("\\", "\\\\").replace('"', '\\"')
    return f'"{escaped}"'


def fmt_header(path):
    return "[" + ".".join(fmt_seg(segment) for segment in path) + "]"


def fmt_value(value):
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, int):
        return str(value)
    if isinstance(value, float):
        return repr(value)
    if isinstance(value, str):
        escaped = (
            value.replace("\\", "\\\\")
            .replace('"', '\\"')
            .replace("\n", "\\n")
            .replace("\t", "\\t")
        )
        return f'"{escaped}"'
    if isinstance(value, list):
        return "[" + ", ".join(fmt_value(item) for item in value) + "]"
    if isinstance(value, dict):
        inner = ", ".join(
            f"{fmt_seg(key)} = {fmt_value(item)}" for key, item in value.items()
        )
        return "{ " + inner + " }"
    raise TypeError(f"unsupported TOML value: {value!r}")


def dotted(path, key):
    return ".".join([*path, key])


leaves = []


def walk(node, path):
    for key, value in node.items():
        if isinstance(value, dict) and value:
            walk(value, path + (key,))
        else:
            leaves.append((path, key, value))


walk(seed, ())

missing = []
present = 0
skipped = []
for table, key, value in leaves:
    node = current
    conflict = False
    for segment in table:
        if not isinstance(node, dict) or segment not in node:
            node = None
            break
        node = node[segment]
        if not isinstance(node, dict):
            conflict = True
            break
    if conflict:
        skipped.append(dotted(table, key))
        continue
    if isinstance(node, dict) and key in node:
        present += 1
    else:
        missing.append((table, key, value))

grouped = {}
order = []
for table, key, value in missing:
    if table not in grouped:
        grouped[table] = []
        order.append(table)
    grouped[table].append((key, value))

lines = text.splitlines() if text else []
added = []
for table in order:
    entries = [f"{fmt_seg(key)} = {fmt_value(value)}" for key, value in grouped[table]]
    if not table:
        index = next(
            (i for i, line in enumerate(lines) if TABLE_RE.match(line)), len(lines)
        )
        lines[index:index] = entries
        added.extend(f"{key} = {fmt_value(value)}" for key, value in grouped[table])
    else:
        header = fmt_header(table)
        index = next(
            (i for i, line in enumerate(lines) if line.strip() == header), None
        )
        if index is None:
            if lines and lines[-1].strip():
                lines.append("")
            lines.append(header)
            lines.extend(entries)
        else:
            lines[index + 1 : index + 1] = entries
        added.extend(dotted(table, key) for key, _ in grouped[table])

new_text = "\n".join(lines) + ("\n" if lines else "")
try:
    tomllib.loads(new_text)
except tomllib.TOMLDecodeError as exc:
    print(f"error: merged result is invalid TOML: {exc}", file=sys.stderr)
    sys.exit(1)

verb = "would seed" if dry_run else "seed"
for line in added:
    print(f"{verb}: {line}")
for path in skipped:
    print(f"skip: type conflict, left unchanged: {path}")

if dry_run:
    print(
        f"\nDry run: {len(added)} key(s) would be added, "
        f"{present} already present, {len(skipped)} skipped."
    )
    sys.exit(0)

if added or not exists:
    parent = os.path.dirname(target_path)
    if parent:
        os.makedirs(parent, exist_ok=True)
    with open(target_path, "w", encoding="utf-8") as handle:
        handle.write(new_text)
    if not exists:
        os.chmod(target_path, 0o600)

if not exists:
    print(f"\nCreated {target_path} from seed ({len(added)} key(s)).")
elif added:
    print(
        f"\nSeeded {len(added)} key(s) into {target_path} "
        f"({present} already present, {len(skipped)} skipped)."
    )
else:
    print(f"unchanged: {target_path} already contains all {present} seed key(s).")
PY
