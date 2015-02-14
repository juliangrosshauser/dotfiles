# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pure"
DISABLE_CORRECTION="true"
# auto update without asking
DISABLE_UPDATE_PROMPT="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

if [[ "$OSTYPE" =~ ^darwin ]]; then
  plugins=(bower brew gem npm osx pod vagrant zsh-syntax-highlighting)
else
  plugins=(bower gem npm zsh-syntax-highlighting)
fi

source $ZSH/oh-my-zsh.sh

# set base16 colorscheme
BASE16_SCHEME="bright"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# setup z
if command -v brew >/dev/null 2>&1; then
  . `brew --prefix`/etc/profile.d/z.sh
else
  if [ -d ~/.z-git ]; then
    . ~/.z-git/z.sh
  fi
fi

source ~/.aliases
source ~/.functions
