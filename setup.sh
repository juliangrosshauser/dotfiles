#!/bin/sh

OH_MY_ZSH=~/.oh-my-zsh

# install dependencies
if [ ! -d "$OH_MY_ZSH" ]; then
  # install oh-my-zsh
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
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

echo "dotfiles setup complete"
exit 0
