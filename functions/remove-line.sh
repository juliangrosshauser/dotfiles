# Remove specific line (first parameter) from file (second parameter).
remove-line() {
  sed -i "$1d" "$2"
}
