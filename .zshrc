## Personal folders
DOTFILES=$HOME/dotfiles
PROJECTS=$HOME/Dev

# Mounts for Win10 drives (WSL2)
# M drive
export win10M="/mnt/m"
# C drive
export win10C="/mnt/c"
# H drive
export win10H="/mnt/d"
# Z drive (work laptop)
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
eval "$(pyenv init --path)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#pyenv-virtualenv init
eval "$(pyenv virtualenv-init -)"

# NVM stuffs
NVM_AUTOLOAD=1

# Docker stuffs
export PATH="$PATH:$HOME/.local/bin"

#######################
# ZSH plugins to load #
#######################

# omz plugins can be found in ~/.oh-my-zsh/plugins/*
# custom plugins can be added to ~/.oh-my-zsh-custom/

#plugins=(git ssh-agent colored-man-pages command-not-found node npm nvm zsh-autosuggestions)
plugins=(git colored-man-pages command-not-found node npm nvm zsh-autosuggestions)

#zstyle :omz:plugins:ssh-agent identities git_daniel-nguyen24

source $ZSH/oh-my-zsh.sh

######################
# User configuration #
######################

#sudo locale-gen en_AUS.UTF-8
#sudo update-locale LANGE=en_AUS.UTF-8

export LANG=en_AU.UTF-8
export LANGUAGE=en_AU:en
export LC_ALL=en_AU.UTF-8
export MANPATH="/usr/local/man:$MANPATH"

DEFAULT_USER='idark'

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

#Mount network drive from work laptop
#sudo mount -t drvfs Z: /mnt/cohealth -o metadata,uid=1000,guid=1000,umask=22,fmask=111

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
