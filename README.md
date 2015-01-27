# dotfiles

Several dotfiles for zsh, git, vim, OS X and more.

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
