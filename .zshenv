PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# use brew coreutils with their unprefixed names
PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
# add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
# homebrew ruby
PATH=$PATH:/usr/local/Cellar/ruby/2.1.0/bin
# user-installed ruby gems
PATH=$PATH:$HOME/.gem/ruby/2.1.0/bin
# find brew coreutils in man with their unprefixed names
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
LC_ALL="en_US.UTF-8"
LANG="en_US"
GEMPATH=/usr/local/Cellar/ruby/2.1.0/lib/ruby/gems/2.1.0:$HOME/.gem/ruby/2.1.0
GEMHOME=$HOME/.gem/ruby/2.1.0
