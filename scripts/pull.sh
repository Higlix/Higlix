#!/usr/bin/env bash
# Pull the current versions of tracked config files from the system into this repo.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$REPO_DIR/scripts/config-map.sh"

for rel in "${CONFIG_FILES[@]}"; do
  src="$(config_dest "$rel")"
  dest="$REPO_DIR/.config/$rel"

  if [[ -f "$src" ]]; then
    mkdir -p "$(dirname "$dest")"
    cp -v "$src" "$dest"
  else
    echo "skip: $src not found" >&2
  fi
done

for rel in "${HOME_FILES[@]}"; do
  src="$HOME/$rel"
  dest="$REPO_DIR/home/$rel"

  if [[ -f "$src" ]]; then
    mkdir -p "$(dirname "$dest")"
    cp -v "$src" "$dest"
  else
    echo "skip: $src not found" >&2
  fi
done
