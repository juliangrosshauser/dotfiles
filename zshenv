# Fix the MANPATH not being set
export MANPATH="$MANPATH"

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
export JAVA_HOME="$(/usr/libexec/java_home)"
