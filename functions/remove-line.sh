# Remove specific line (first parameter) from file (second parameter).
function remove-line() {
  sed -i "$1d" "$2"
}
