# Copy with progress
cpprogress() {
  rsync -WavP --human-readable --progress "$1" "$2"
}
