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
