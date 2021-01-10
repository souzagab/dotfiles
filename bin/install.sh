#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi


# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function add {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# TODO: Add more dependencies
add git
add htop
add curl
add build-essential
add wget
add libcanberra-gtk-module

# Install zsh and set as default shell
add zsh
chsh -s $(which zsh)

if [ "${SHELL}" != "`which zsh`" ]; then
	# TODO: Set zsh as default shell if chsh dont work.
	# https://unix.stackexchange.com/questions/136423/making-zsh-default-shell-without-root-access
	echo "==================="
fi


# Install all Tools
for f in tools/*.sh; do zsh "$f" -H; done

#TODO: Replace/Import all config file
# git zsh, alias, etc.

for f in programs/*sh do bash "$f" -H; done

sudo apt upgrade -y
sudo apt autoremove -y

# exec zsh
