dotfiles
========

To setup the dotfiles automatically you can use [setup.sh](https://github.com/juliangrosshauser/dotfiles/blob/master/setup.sh "Setup Script"). This script will also
install [oh-my-zsh](http://ohmyz.sh "oh-my-zsh") if necessary.

## Automatic Setup

[setup.sh](setup.sh) will link all dotfiles to their correct destination for you.  
Don't worry, the script will automatically create backups of your previous dotfiles.

Calling it without arguments will also install all necessary dependencies:
```shell
$ ./setup.sh
```

If you don't want to install the dependencies, just provide the `-l` switch as argument:
```shell
$ ./setup.sh -l
```

## License

MIT
