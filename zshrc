# Use GNU coreutils with their unprefixed names
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Find GNU coreutils in man with their unprefixed names
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH="$CUDA_HOME/bin:$PATH"

fpath=("$HOME/.zfunctions" $fpath)

autoload -U promptinit && promptinit
prompt pure

# Reload completions
autoload -U compinit && compinit

# The first rule makes the completion case insensitive
# The second rule allows for partial completion before ., _ or -, e.g. f.b -> foo.bar
# The third rule allows for completion on the left side of the text
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Activate completion menu
zstyle ':completion:*' menu select

# Skip the correction and immediately insert the first match
setopt menu_complete

source "$HOME/.aliases"
source "$HOME/.functions"

source "$HOME/.asdf/asdf.sh"
eval "$(pyenv init -)"
eval "$(rbenv init -)"
