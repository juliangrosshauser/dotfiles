export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'

if [[ "$OSTYPE" =~ ^darwin ]]; then
  # use brew coreutils with their unprefixed names
  export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

  # find brew coreutils in man with their unprefixed names
  export MANPATH='/usr/local/opt/coreutils/libexec/gnuman:$MANPATH'
fi

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if command -v go >/dev/null 2>&1; then
  export GOPATH=$HOME/dev/go
  export PATH=$PATH:$GOPATH/bin
fi

if [[ "$OSTYPE" =~ ^darwin ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
  export ANDROID_HOME='/usr/local/opt/android-sdk'
  export ANDROID_NDK_HOME='/usr/local/opt/android-ndk'
  export VAGRANT_DEFAULT_PROVIDER='parallels'
fi

if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
