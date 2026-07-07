# Tracked dotfiles, shared by pull.sh and install.sh so both stay in sync.

# Paths relative to .config/ (both in ~/.config and in the repo's .config/).
CONFIG_FILES=(
  "ghostty/config"
  "starship.toml"
  "htop/htoprc"
  "mimeapps.list"
  "Code/User/settings.json"
)

# Paths relative to $HOME (both in $HOME and in the repo's home/).
HOME_FILES=(
  ".tmux.conf"
)

# Resolve a CONFIG_FILES entry to its real path on this OS.
# Everything lives under ~/.config on Linux; a few apps differ on macOS.
config_dest() {
  local rel="$1"
  if [[ "$(uname)" == "Darwin" ]]; then
    case "$rel" in
      "Code/User/settings.json")
        printf '%s\n' "$HOME/Library/Application Support/Code/User/settings.json"; return ;;
    esac
  fi
  printf '%s\n' "$HOME/.config/$rel"
}
