#!/bin/sh

ln -sf $PWD/aliases ~/.aliases
ln -sf $PWD/functions ~/.functions
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/zshrc ~/.zshrc

if [[ "$OSTYPE" =~ ^darwin ]]; then
  ln -sf $PWD/gitconfig ~/.gitconfig
  ln -sf $PWD/gemrc ~/.gemrc
  ln -sf $PWD/zshenv ~/.zshenv
fi

echo "linked dotfiles"
exit 0
