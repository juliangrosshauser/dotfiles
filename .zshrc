# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pure"
DISABLE_CORRECTION="true"
# auto update without asking
DISABLE_UPDATE_PROMPT="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

if [[ "$OSTYPE" =~ ^darwin ]]; then
  plugins=(bower brew gem npm osx pod vagrant zsh-syntax-highlighting)
  source $ZSH/oh-my-zsh.sh

  # setup z
  . `brew --prefix`/etc/profile.d/z.sh

  # base16 color scheme
  BASE16_SCHEME="bright"
  BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
  [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
fi

source ~/.aliases
source ~/.functions

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
