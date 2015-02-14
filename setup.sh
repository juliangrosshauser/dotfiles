#!/usr/bin/env bash

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
  # check dependencies

  # check if zsh is used
  if [ -z "$ZSH_VERSION" ]; then
    if ! command -v zsh >/dev/null 2>&1; then
      die "Please install zsh and restart setup"
    else
      die "Please switch to zsh with 'chsh -s $(which zsh)'"
    fi
  fi

  if ! command -v git >/dev/null 2>&1; then
    die "Please install git and restart setup"
  fi

  # install dependencies

  OH_MY_ZSH=~/.oh-my-zsh

  if [ ! -d "$OH_MY_ZSH" ]; then
    # install oh-my-zsh
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    echo "Installed oh-my-zsh"
  fi

  # install zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $OH_MY_ZSH/custom/plugins/zsh-syntax-highlighting
  echo "Installed zsh-syntax-highlighting"

  # install z
  git clone https://github.com/rupa/z.git ~/.z-git
  echo "Installed z"

  # install base16 shell colorschemes
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
  echo "Installed base16 shell colorschemes"

  echo "Installed all dependencies"
fi

# backup existing files
for i in ~/.aliases ~/.functions ~/.gemrc ~/.vimrc ~/.zshenv ~/.zshrc; do
  if [ -e $i ]; then
    mv "${i}" "${i}.backup" || die "Could not move ${i} to ${i}.backup"
    echo "${i} has been renamed to ${i}.backup"
  fi
done

ln -s $PWD/aliases ~/.aliases
ln -s $PWD/functions ~/.functions
ln -s $PWD/gemrc ~/.gemrc
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/zshenv ~/.zshenv
ln -s $PWD/zshrc ~/.zshrc

if [[ "$OSTYPE" =~ ^darwin ]]; then
  # backup existing file
  if [ -e ~/.gitconfig ]; then
    mv "~/.gitconfig" "~/.gitconfig.backup" || die "Could not move ~/.gitconfig to ~/.gitconfig.backup"
    echo "~/.gitconfig has been renamed to ~/.gitconfig.backup"
  fi

  ln -s $PWD/gitconfig ~/.gitconfig
fi

echo "Successfully linked dotfiles"

echo "dotfiles setup complete"
exit 0
