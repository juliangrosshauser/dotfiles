# Copy with progress
function cpprogress() {
  rsync -WavP --human-readable --progress $1 $2
}
