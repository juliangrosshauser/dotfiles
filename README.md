# dotfiles
![Platform](https://img.shields.io/badge/platform-osx%20%7C%20linux-lightgrey.svg)
[![License](https://img.shields.io/badge/license-MIT-3f3f3f.svg)](http://choosealicense.com/licenses/mit)

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
