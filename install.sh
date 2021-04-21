#!/bin/bash
###########
# This script creates symlinks from $HOME dir to any desired dotfiles in $HOME/dotfiles
###########

########### Variables

DIR=~/dotfiles
OLDDIR=~/dotfiles_old
FILES=".bashrc .zshrc .dircolors .gitconfig .gitignore .oh-my-zsh .oh-my-zsh-custom"

###########

## Create dotfiles_old in $HOME dir
echo "Creating '$OLDDIR' to backup existing dotfiles in ~..."
mkdir -p $OLDDIR
echo "Done"

## Move any existing dotfiles in $HOME dir to newly created dotfiles_old dir
echo "Copying existing dotfiles in '$HOME' to '$OLDDIR'..."

for file in $(find ~/ -maxdepth 1 -type f); do
  cp $file $OLDDIR
done

echo "Done"

## Create symlinks from here to $HOME dir
cd $DIR
for file in $FILES; do
  echo "Creating symlink to '$file' in '$HOME'"
  ln -s -f $DIR/$file ~/$file
done

echo "Done"

install_zsh () {
# Test to see if zsh is installed. If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
  echo "ZSH is already installed"
  #Set default shell to zsh if it isn't currently set to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      echo "Changing default shell to zsh"
      chsh -s $(which zsh)
  fi
else
  # If zsh isn't installed, get the platform of the current machine
  echo "ZSH isn't installed"
  platform=$(uname);
  # If platform is Linux, install zsh then recurse
  if [[ $platform == 'Linux' ]]; then
    echo "Installing ZSH..."
    if [[ -f /etc/redhat-release ]]; then
      sudo yum install zsh
      install_zsh
    fi
    if [[ -f /etc/debian/version ]]; then
      sudo apt-get install zsh
      install_zsh
    fi
    echo "Done"
  # If the platform is OS X, prompt the user to install zsh
  elif [[ $platform == 'Darwin' ]]; then
    echo "Please install zsh, then rerun this script"
    exit
  fi
fi
}

install_zsh

echo "Finished installing dotfiles"
