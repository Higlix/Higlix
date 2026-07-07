#!/usr/bin/env bash
# Install tracked config files from this repo into the system.
# Existing files at the destination are overwritten with the repo's version.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$REPO_DIR/scripts/config-map.sh"

for rel in "${CONFIG_FILES[@]}"; do
  src="$REPO_DIR/.config/$rel"
  dest="$(config_dest "$rel")"

  if [[ -f "$src" ]]; then
    mkdir -p "$(dirname "$dest")"
    cp -v "$src" "$dest"
  else
    echo "skip: $src not found" >&2
  fi
done

for rel in "${HOME_FILES[@]}"; do
  src="$REPO_DIR/home/$rel"
  dest="$HOME/$rel"

  if [[ -f "$src" ]]; then
    mkdir -p "$(dirname "$dest")"
    cp -v "$src" "$dest"
  else
    echo "skip: $src not found" >&2
  fi
done
