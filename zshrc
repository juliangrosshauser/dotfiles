if [[ "$OSTYPE" == "darwin"* ]]; then
  # Use GNU coreutils, find, sed and grep with their unprefixed names
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/grep/libexec/gnubin:$PATH"
  # Find GNU coreutils, find, sed and grep in man with their unprefixed names
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:/usr/local/opt/gnu-sed/libexec/gnuman:/usr/local/opt/grep/libexec/gnuman:$MANPATH"
fi

if [ -d "$HOME/.asdf" ]; then
  # Initialize asdf version manager
  source "$HOME/.asdf/asdf.sh"
  fpath=("$ASDF_DIR/completions" $fpath)
fi

fpath=("$HOME/.zsh/prompts/pure" "$HOME/.zsh/completions" "$HOME/.zsh/plugins/zsh-completions/src" $fpath)

# Use pure prompt
autoload -U promptinit; promptinit
prompt pure

# Reload completions
autoload -U compinit && compinit

# The first rule makes the completion case insensitive
# The second rule allows for partial completion before ., _ or -, e.g. f.b -> foo.bar
# The third rule allows for completion on the left side of the text
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# See: https://superuser.com/a/815317
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# Activate completion menu
zstyle ':completion:*' menu select

# Skip the correction and immediately insert the first match
# setopt menu_complete

# Set history options
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

# The `expand-aliases` file needs to be sourced before the alias files,
# because it provides the `not-expanding-alias` function.
source "$HOME/.zsh/functions/expand-aliases"

for alias_file in ~/.aliases/*; do
  source "$alias_file"
done

# Activate plugins
source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"

# The first time running `expand-aliases-and-accept-line` on the same command that was just executed right before, the expanded command
# will include the autosuggestions of the previously executed command, e.g. running `git branch -a` followed by `gb`.
# The `gb` command is an alias for `git branch` and will be expanded, but it will also include the `-a` argument from the previous command.
# To prevent this from happening we add `expand-aliases-and-accept-line` to the array of widgets that do not trigger any custom behavior of
# the zsh-autosuggestions plugin. See: https://github.com/zsh-users/zsh-autosuggestions#widget-mapping
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(expand-aliases-and-accept-line)

# Configure keybindings

# Helpful information for keybindings:
#
# * Use `read` command in terminal to obtain key sequences.
# * List of zsh's standard widgets, i.e. commands that can be used with `bindkey`: http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets
# * Multiple key sequences can be bound to the same command by simply adding another `bindkey` line with the same command but a different key sequence.
# * Table of keyboard shortcuts: https://en.wikipedia.org/wiki/Table_of_keyboard_shortcuts

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Go back a word with ⌥←
  bindkey '^[^[[D' backward-word
  # Go forward a word with ⌥→
  # Will also partially accept suggestions from zsh-autosuggestions.
  bindkey '^[^[[C' forward-word

  # Go to beginning of line with ⌘←
  # iTerm needs to be configured to send the
  # escape sequence "beginning" with the key combination
  bindkey '^[beginning' beginning-of-line
  # Go to end of line with ⌘→
  # iTerm needs to be configured to send the
  # escape sequence "end" with the key combination
  bindkey '^[end' end-of-line

  # See: https://github.com/zsh-users/zsh-history-substring-search#usage
  # Up arrow key ↑
  bindkey '^[[A' history-substring-search-up
  # Down arrow key ↓
  bindkey '^[[B' history-substring-search-down
fi

if [[ $(uname -r) == *"microsoft"* ]]; then
  # The following keybindings work in Windows Terminal.

  # Found here: https://github.com/microsoft/terminal/issues/755#issuecomment-530905894
  # Go back a word with Ctrl+←
  bindkey '^[[1;5D' backward-word
  # Go forward a word with Ctrl+→
  # Will also partially accept suggestions from zsh-autosuggestions.
  bindkey '^[[1;5C' forward-word

  # Go to beginning of line with Fn+←
  bindkey '^[[H' beginning-of-line
  # Go to beginning of line with Fn+→
  bindkey '^[[F' end-of-line

  # Delete word before cursor with Ctrl+Backspace
  bindkey '^H' backward-delete-word
  # Delete word after cursor with Ctrl+Delete
  bindkey '^[[3;5~' delete-word

  # See: https://github.com/zsh-users/zsh-history-substring-search#usage
  # Up arrow key ↑
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  # Down arrow key ↓
  bindkey "$terminfo[kcud1]" history-substring-search-down
fi

if [[ $(uname -r) == *"microsoft"* ]]; then
  # Use SSH agent running on Windows. Credits: https://github.com/rupor-github/wsl-ssh-agent#wsl-2-compatibility
  export SSH_AUTH_SOCK="$HOME/.ssh/agent.sock"
  ss -a | grep -q "$SSH_AUTH_SOCK"
  if [ $? -ne 0 ]; then
    rm -f "$SSH_AUTH_SOCK"
    ( setsid socat UNIX-LISTEN:"$SSH_AUTH_SOCK",fork EXEC:"$HOME/winhome/WSL/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork & ) >/dev/null 2>&1
  fi

  # Use X server running on Windows. See https://wiki.ubuntu.com/WSL and https://x410.dev/cookbook/wsl/using-x410-with-wsl2.
  test -z "$DISPLAY" && export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0.0
  # Force OpenGL rendering to happen in X server on Windows, i.e. use GPU on Windows (currently WSL can't use the GPU).
  export LIBGL_ALWAYS_INDIRECT=1
fi

if [ -d "$HOME/dev/anaconda" ]; then
  eval "$("$HOME/dev/anaconda/bin/conda" shell.zsh hook)"
fi

export PATH="$HOME/.bin:$PATH"

if [ -f "$HOME/.localrc" ]; then
  source "$HOME/.localrc"
fi
