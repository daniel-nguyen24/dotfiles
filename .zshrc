# ENV vars
DOTFILES=$HOME/dotfiles
PROJECTS=$HOME/Dev

# Path to your oh-my-zsh installation.
ZSH="$DOTFILES/.oh-my-zsh"

# Path to ZSH custom folder
ZSH_CUSTOM=$DOTFILES/.oh-my-zsh-custom

ZSH_THEME="agnoster"

plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=en_AU.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set colours for LS_colours
eval `dircolors ~/.dircolors`

# Set environment variables to point to Windows 10 file system (WSL2)
## M drive
export win10M="/mnt/m"

## C drive
export win10C="/mnt/c"

## H drive
export win10H="/mnt/h"
