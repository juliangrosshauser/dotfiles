# Remove specific line (first parameter) from `$HOME/.ssh/known_hosts`.
remove-line-ssh() {
  sed -i "$1d" "$HOME/.ssh/known_hosts"
}
