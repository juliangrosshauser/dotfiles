# Use GNU coreutils with their unprefixed names
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Find GNU coreutils in man with their unprefixed names
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH="$CUDA_HOME/bin:$PATH"

fpath=("$HOME/.zfunctions" $fpath)

autoload -U promptinit && promptinit
prompt pure

source "$HOME/.aliases"
source "$HOME/.functions"

source "$HOME/.asdf/asdf.sh"
eval "$(pyenv init -)"
eval "$(rbenv init -)"
