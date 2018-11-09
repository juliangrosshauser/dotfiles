gemupdate() {
  echo -e "Updating gem\n"
  gem update --system
  gem update
  gem cleanup
}
