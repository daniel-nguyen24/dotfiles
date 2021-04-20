# Dotfiles
My personal repo to store my dotfiles.

**"WIP"...**
I'm still learning all about this  and I welcome any feedback / suggestion.

## Info
This repo should be cloned to home directory so that the path is `~/dotfiles/`. 

The included `install.sh` script creates backup of existing dotfiles into `~/dotfiles_old/` directory. It then creates symlinks (please note I also use the `-f` flag) from home directory to the files which are located in `~/dotfiles/`.

I also opt for `zsh` as my shell. The `install.sh` script then checks whether `zsh` is installed or not

 - If `zsh` is installed, It then checks whether `zsh` is configured as default shell, if not, it will execute `chsh -s $(which zsh)`.
 - if `zsh` is not install, it will try to install `zsh`.

