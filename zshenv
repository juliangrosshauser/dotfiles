export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# use GNU coreutils with their unprefixed names
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
# find GNU coreutils in man with their unprefixed names
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vim
export VISUAL=vim
export PAGER=less

export CC=clang
export CXX=clang++

export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$CUDA_HOME/lib:$DYLD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$DYLD_LIBRARY_PATH"

# java_home returns the path to a java home directory
# specify java version with `java_home -v 1.x`, where
# x is the desired java version
export JAVA_HOME=$(/usr/libexec/java_home)
