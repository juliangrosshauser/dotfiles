#!/bin/bash
OH_MY_ZSH = ~/.oh-my-zsh
JANUS = ~/.vim/janus

# install dependencies
if [ ! -d "$OH_MY_ZSH" ]; then
  # install oh-my-zsh
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

if [ ! -d "$JANUS" ]; then
  # install janus
  curl -Lo- https://bit.ly/janus-bootstrap | bash
fi

if hash npm 2>/dev/null; then
  npm install -g pure-prompt
  ln -s /usr/local/lib/node_modules/pure-prompt/pure.zsh $OH_MY_ZSH/custom/pure.zsh-theme
fi

# backup existing files
for i in ~/.aliases ~/.functions ~/.vimrc.after ~/.zshrc; do
  if [ -e $i ]; then
    mv "${i}" "${i}.backup" || die "Could not move ${i} to ${i}.backup"
    echo "${i} has been renamed to ${i}.backup"
  fi
done

ln -s $PWD/.aliases ~/.aliases
ln -s $PWD/.functions ~/.functions
ln -s $PWD/.vimrc.after ~/.vimrc.after
ln -s $PWD/.zshrc ~/.zshrc

if [[ "$OSTYPE" =~ ^darwin ]]; then
  # backup existing files
  for i in ~/.gitconfig ~/.slate ~/.gemrc ~/.zshenv ~/.zlogin; do
    if [ -e $i ]; then
      mv "${i}" "${i}.backup" || die "Could not move ${i} to ${i}.backup"
      echo "${i} has been renamed to ${i}.backup"
    fi
  done

  ln -s $PWD/.gitconfig ~/.gitconfig
  ln -s $PWD/.slate ~/.slate
  ln -s $PWD/.gemrc ~/.gemrc
  ln -s $PWD/.zshenv ~/.zshenv
  ln -s $PWD/.zlogin ~/.zlogin
fi
