#!/usr/bin/env bash

set -e
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

# back up existing files
for i in $HOME/.aliases $HOME/.functions $HOME/.gemrc $HOME/.npmrc $HOME/.vimrc $HOME/.zshenv $HOME/.zshrc $HOME/.gitconfig $HOME/.lldbinit; do
  if [ -e $i ]; then
    mv "${i}" "${i}.backup" || die "Could not move ${i} to ${i}.backup"
    echo "${i} has been renamed to ${i}.backup"
  fi
done

ln -s $PWD/aliases $HOME/.aliases
ln -s $PWD/functions $HOME/.functions
ln -s $PWD/gemrc $HOME/.gemrc
ln -s $PWD/npmrc $HOME/.npmrc
ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD/zshenv $HOME/.zshenv
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/gitconfig $HOME/.gitconfig
ln -s $PWD/lldbinit $HOME/.lldbinit

echo "Successfully linked dotfiles"

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

  OH_MY_ZSH=$HOME/.oh-my-zsh

  if [ ! -d "$OH_MY_ZSH" ]; then
    # install oh-my-zsh
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

    if [ -f $HOME/.zshrc.pre-oh-my-zsh ]; then
      mv -f $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
    fi

    echo "Installed oh-my-zsh"
  fi

  # install zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $OH_MY_ZSH/custom/plugins/zsh-syntax-highlighting
  echo "Installed zsh-syntax-highlighting"

  # install base16 shell colorschemes
  git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell
  echo "Installed base16 shell colorschemes"

  # install Vundle.vim
  if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    if [ ! -d $HOME/.vim/bundle ]; then
      mkdir -p $HOME/.vim/bundle
    fi

    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

    # install Vundle.vim plugins
    vim +PluginInstall +qall

    echo "Installed Vundle.vim"
  fi

  echo "Installed all dependencies"

  # force quiet logins
  if [ ! -f $HOME/.hushlogin ]; then
    touch $HOME/.hushlogin
    echo "Forced quiet logins by creating $HOME/.hushlogin"
  fi

  # link subl
  if [ -f "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"]; then
    ln -s "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
  fi
fi

echo "dotfiles setup complete"
exit 0
