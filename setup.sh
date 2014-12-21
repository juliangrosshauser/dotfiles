#!/bin/sh

LINK_ONLY=0

while getopts ":hl" opt; do
  case $opt in
    l)
      echo "Only linking dotfiles"
      LINK_ONLY=1
      ;;
    h|\?)
      echo "Links dotfiles and installs dependencies"
      echo "Usage: ./setup.sh [-l]"
      echo "Using -l tells the script to only link files and not install dependencies"
      exit 0
      ;;
  esac
done

if [ $LINK_ONLY -eq 0 ]; then
  # install dependencies
  OH_MY_ZSH=~/.oh-my-zsh

  if [ ! -d "$OH_MY_ZSH" ]; then
    # install oh-my-zsh
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    echo "Installed oh-my-zsh"
  fi

  echo "Installed all dependencies"
fi

# backup existing files
for i in ~/.aliases ~/.functions ~/.vimrc ~/.zshrc; do
  if [ -e $i ]; then
    mv "${i}" "${i}.backup" || die "Could not move ${i} to ${i}.backup"
    echo "${i} has been renamed to ${i}.backup"
  fi
done

ln -s $PWD/aliases ~/.aliases
ln -s $PWD/functions ~/.functions
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/zshrc ~/.zshrc

if [[ "$OSTYPE" =~ ^darwin ]]; then
  # backup existing files
  for i in ~/.gitconfig ~/.gemrc ~/.zshenv; do
    if [ -e $i ]; then
      mv "${i}" "${i}.backup" || die "Could not move ${i} to ${i}.backup"
      echo "${i} has been renamed to ${i}.backup"
    fi
  done

  ln -s $PWD/gitconfig ~/.gitconfig
  ln -s $PWD/gemrc ~/.gemrc
  ln -s $PWD/zshenv ~/.zshenv
fi

echo "Successfully linked dotfiles"

echo "dotfiles setup complete"
exit 0
