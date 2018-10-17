# Remove specific line (first parameter) from `$HOME/.ssh/known_hosts`.
function remove-line-ssh() {
  sed -i "$1d" "$HOME/.ssh/known_hosts"
}
