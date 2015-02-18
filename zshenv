export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'

if [[ "$OSTYPE" =~ ^darwin ]]; then
  if command -v brew >/dev/null 2>&1; then
    if [ -d $(brew --prefix coreutils)/libexec/gnubin ]; then
      # use brew coreutils with their unprefixed names
      export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
    fi

    if [ -d $(brew --prefix coreutils)/libexec/gnuman ]; then
      # find brew coreutils in man with their unprefixed names
      export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH
    fi
  fi
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
  # java_home returns the path to a java home directory
  # specify java version with `java_home -v 1.x`, where
  # x is the desired java version
  if [ -f /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
  fi

  if [ -d /usr/local/opt/android-sdk ]; then
    export ANDROID_HOME='/usr/local/opt/android-sdk'
  fi

  if [ -d /usr/local/opt/android-ndk ]; then
    export ANDROID_NDK_HOME='/usr/local/opt/android-ndk'
  fi

  if command -v vagrant >/dev/null 2>&1; then
    export VAGRANT_DEFAULT_PROVIDER='parallels'
  fi

  export NVM_DIR=$HOME/.nvm

  if command -v brew >/dev/null 2>&1; then
    if [ -f $(brew --prefix nvm)/nvm.sh ]; then
      source $(brew --prefix nvm)/nvm.sh
    fi
  fi
fi

if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
