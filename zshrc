# Use GNU coreutils with their unprefixed names
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Find GNU coreutils in man with their unprefixed names
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH="$CUDA_HOME/bin:$PATH"

fpath=("$HOME/.zfunctions" "$HOME/.zsh/zsh-completions/src" $fpath)

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

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST="$HISTSIZE"

# Write to the history file immediately, not when the shell exits
setopt inc_append_history
# Write the history file in the ":start:elapsed;command" format
setopt extended_history
# Delete old recorded entry if new entry is a duplicate
setopt hist_ignore_all_dups
# Don't record an entry starting with a space
setopt hist_ignore_space
# Don't execute immediately upon history expansion
setopt hist_verify
# Share history between all sessions
setopt share_history
# Remove superfluous blanks before recording entry
setopt hist_reduce_blanks

source "$HOME/.aliases"
source "$HOME/.functions"

source "$HOME/.asdf/asdf.sh"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh"
