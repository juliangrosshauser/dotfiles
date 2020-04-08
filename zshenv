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

if [ -f /usr/libexec/java_home ]; then
    # java_home returns the path to a java home directory
    # specify java version with `java_home -v 1.x`, where
    # x is the desired java version
    export JAVA_HOME="$(/usr/libexec/java_home)"
fi
