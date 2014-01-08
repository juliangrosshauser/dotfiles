export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# use brew coreutils with their unprefixed names
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
# find brew coreutils in man with their unprefixed names
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
