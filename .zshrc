# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pure"
DISABLE_CORRECTION="true"

if [[ "$OSTYPE" =~ ^darwin ]]; then
  plugins=(osx brew)
  source $ZSH/oh-my-zsh.sh

  # setup z
  . `brew --prefix`/etc/profile.d/z.sh

  # base16 color scheme
  BASE16_SCHEME="tomorrow"
  BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
  [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
fi

source ~/.aliases
source ~/.functions
