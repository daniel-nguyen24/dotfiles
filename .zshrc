############
# ENV vars #
############

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
sudo mount -t drvfs '\\90M-LAIT109619\Users\daniel.nguyen\OneDrive - cohealth Ltd' /mnt/cohealth
export win10Z="/mnt/cohealth"

# Path to oh-my-zsh installation
ZSH="$DOTFILES/.oh-my-zsh"

# Path to ZSH custom folder
ZSH_CUSTOM=$DOTFILES/.oh-my-zsh-custom

# ZSH theme
ZSH_THEME="agnoster"

# Pyenv stuffs
export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# NVM stuffs
NVM_AUTOLOAD=1

#######################
# ZSH plugins to load #
#######################

# omz plugins can be found in ~/.oh-my-zsh/plugins/*
# custom plugins can be added to ~/.oh-my-zsh-custom/
plugins=(git ssh-agent colored-man-pages command-not-found node npm nvm)

zstyle :omz:plugins:ssh-agent identities git_daniel-nguyen24

source $ZSH/oh-my-zsh.sh

######################
# User configuration #
######################

export LANG=en_AU.UTF-8
export LANGUAGE=en_AU:en
export LC_ALL=en_AU.UTF-8
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set colours for LS_colours
eval `dircolors ~/.dircolors`

# Personal aliases
alias dotfiles="cd $DOTFILES"
alias ohmyzsh="cd $ZSH"
alias reloadsh="eval $SHELL && clear"
alias rmrf="rm -rf"
alias cl="clear"

######################
# Updating utilities #
######################

# All credits go to samhwang https://github.com/samhwang/dotfiles/commit/386b1d5f6d337ce6cbed9e90a27257358252f3dd

function update_packages() {
  # To be added later
  #if [ $(uname) = "Darwin" ]; then
  #  brew update
  #  brew upgrade
  #  brew cleanup
  #elif [ $(uname) = "Linux" ]; then
  if [ $(uname) = "Linux" ]; then
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
  fi
}

function pkg_up () {
  echo "UPDATING SYSTEM PACKAGES"
  update_packages

  echo "GOING TO DOTFILES DIRECTORY"
  cd $DOTFILES
  echo "CURRENTLY AT $(pwd)"

  echo "UPDATING SUBMODULES IN DOTFILES DIRECTORY"
  git submodule update --recursive --remote

  echo "FINISHED UPDATING. GOING BACK TO PREVIOUS DIRECTORY"
  cd -
  echo "CURRENTLY AT $(pwd)"
}
