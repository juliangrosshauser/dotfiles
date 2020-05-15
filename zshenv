if [[ "$OSTYPE" == "darwin"* ]]; then
    # Fix the MANPATH not being set
    export MANPATH="$MANPATH"

    export CC=clang
    export CXX=clang++
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vim
export VISUAL=vim
export PAGER=less

if [ -d /usr/local/go/bin ]; then
    export PATH="/usr/local/go/bin:$PATH"
fi

if [ -d "$HOME/dev/go" ]; then
    export GOPATH="$HOME/dev/go"
fi

if [ -n "$GOPATH" ]; then
    export PATH="$GOPATH/bin:$PATH"
fi

if [ -f /usr/libexec/java_home ]; then
    # java_home returns the path to a java home directory
    # specify java version with `java_home -v 1.x`, where
    # x is the desired java version
    export JAVA_HOME="$(/usr/libexec/java_home)"
fi

if [[ "$OSTYPE" == "linux"* ]]; then
    # Enable passphrase prompt for gpg
    export GPG_TTY=$(tty)
fi
