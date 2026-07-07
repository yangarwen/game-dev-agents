#!/usr/bin/env bash
#
# install.sh — install this pack's agents globally (~/.claude/agents/)
#
# By default the agents in this repo are PROJECT-scoped: they work when you
# open Claude Code inside this folder. Run this script if you also want them
# available in every project on this machine.
#
# Usage:
#   ./install.sh              Copy agents to ~/.claude/agents/
#   ./install.sh --link       Symlink instead of copy (repo updates propagate)
#   ./install.sh --dry-run    Show what would happen, change nothing
#   ./install.sh --uninstall  Remove this pack's agents from ~/.claude/agents/
#
# Note: the memory notes (.claude/notes/) stay in this repo. Globally-installed
# agents will read/write .claude/notes/ relative to whatever project you're in,
# so each project accumulates its own notes — that's usually what you want.

set -euo pipefail

SRC_DIR="$(cd "$(dirname "$0")" && pwd)/.claude/agents"
DEST_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/agents"

MODE="copy"
DRY_RUN=false
UNINSTALL=false

for arg in "$@"; do
  case "$arg" in
    --link)      MODE="link" ;;
    --dry-run)   DRY_RUN=true ;;
    --uninstall) UNINSTALL=true ;;
    -h|--help)   sed -n '2,18p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "Unknown option: $arg (try --help)"; exit 1 ;;
  esac
done

[ -d "$SRC_DIR" ] || { echo "Error: $SRC_DIR not found — run from the repo."; exit 1; }

if $UNINSTALL; then
  for f in "$SRC_DIR"/*.md; do
    name="$(basename "$f")"
    target="$DEST_DIR/$name"
    if [ -e "$target" ] || [ -L "$target" ]; then
      if $DRY_RUN; then echo "[dry-run] would remove $target"
      else rm "$target"; echo "removed $target"; fi
    fi
  done
  echo "Done."
  exit 0
fi

$DRY_RUN || mkdir -p "$DEST_DIR"

count=0
for f in "$SRC_DIR"/*.md; do
  name="$(basename "$f")"
  target="$DEST_DIR/$name"
  if $DRY_RUN; then
    echo "[dry-run] would $MODE $name -> $target"
  else
    if [ "$MODE" = "link" ]; then
      ln -sf "$f" "$target"
    else
      cp "$f" "$target"
    fi
    echo "$MODE: $name -> $target"
  fi
  count=$((count + 1))
done

echo ""
echo "$count agents ${DRY_RUN:+(dry-run) }processed ($MODE mode)."
$DRY_RUN || echo "They are now available in every project. Uninstall with: ./install.sh --uninstall"
