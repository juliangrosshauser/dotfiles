export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'

# use GNU coreutils with their unprefixed names
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
# find GNU coreutils in man with their unprefixed names
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

export CC=clang
export CXX=clang++

export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

# java_home returns the path to a java home directory
# specify java version with `java_home -v 1.x`, where
# x is the desired java version
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME='/usr/local/opt/android-sdk'
export ANDROID_NDK_HOME='/usr/local/opt/android-ndk'

export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh

export RUST_SRC_PATH=$HOME/dev/Rust/rust/src

export LUA_PATH="$HOME/.luarocks/share/lua/5.1/?.lua;/Users/julian/.luarocks/share/lua/5.1/?/init.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;./?.lua;/usr/local/Cellar/luajit/2.1/share/luajit-2.1.0-beta1/?.lua;/usr/local/Cellar/luajit/2.1/share/lua/5.1/?.lua;/usr/local/Cellar/luajit/2.1/share/lua/5.1/?/init.lua"
export LUA_CPATH="$HOME/.luarocks/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/?.so;./?.so;/usr/local/Cellar/luajit/2.1/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so"
export PATH="$PATH:$HOME/.luarocks/bin"

eval "$(rbenv init -)"
