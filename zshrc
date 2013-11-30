# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export EDITOR='subl -n -w'
# pressing 'v' in less opens EDITOR, now sublime
export LESSEDIT='subl -n -w %f'

alias sudo='sudo '

alias rm='trash '
alias rrm='rm -i'
alias cp='cp -i '
alias mv='mv -i '
alias mkdir='mkdir -p '

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit -m '
alias gca='git commit -am '
alias go='git checkout '
# alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short --color'
alias gl='git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --graph --date=relative '
alias gn='git clone '
alias gp='git push '
alias gu='git pull '
alias gi='git init '
alias gm='git merge '
alias gmt='git mergetool '
alias gf='git diff-tree --no-commit-id --name-only -r '
alias grm='git rm '

alias subl='subl -a '
alias cat='pygmentize -g '
alias ccat='cat '
