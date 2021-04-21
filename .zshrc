### ENV vars

# Personal folders
DOTFILES=$HOME/dotfiles
PROJECTS=$HOME/Dev

# Mounts for Win10 drives (WSL2)
# M drive
export win10M="/mnt/m"
# C drive
export win10C="/mnt/c"
# H drive
export win10H="/mnt/h"
# Z drive (work laptop)
export win10Z="/mnt/cohealth"

# Path to oh-my-zsh installation
ZSH="$DOTFILES/.oh-my-zsh"

# Path to ZSH custom folder
ZSH_CUSTOM=$DOTFILES/.oh-my-zsh-custom

# ZSH theme
ZSH_THEME="agnoster"

### ZSH plugins to load
# omz plugins can be found in ~/.oh-my-zsh/plugins/*
# custom plugins can be added to ~/.oh-my-zsh-custom/
plugins=(git ssh-agent colored-man-pages command-not-found)

zstyle :omz:plugins:ssh-agent identities git_daniel-nguyen24

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
