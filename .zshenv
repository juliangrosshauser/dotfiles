PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# use brew coreutils with their unprefixed names
PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
# find brew coreutils in man with their unprefixed names
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
LC_ALL="en_US.UTF-8"
LANG="en_US"
VAGRANT_DEFAULT_PROVIDER=parallels
