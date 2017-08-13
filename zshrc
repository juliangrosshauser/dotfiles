export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=refined
DISABLE_CORRECTION=true
# Auto update without asking
DISABLE_UPDATE_PROMPT=true
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

plugins=(zsh-syntax-highlighting zsh-autosuggestions)

source "$ZSH/oh-my-zsh.sh"

# Use GNU coreutils with their unprefixed names
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Find GNU coreutils in man with their unprefixed names
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH="$CUDA_HOME/bin:$PATH"

source "$HOME/.aliases"
source "$HOME/.functions"

source "$HOME/.asdf/asdf.sh"
eval "$(pyenv init -)"
eval "$(rbenv init -)"
