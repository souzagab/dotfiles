#!/bin/bash

export ROOT_PATH=`git rev-parse --show-toplevel`
export CONFIG_PATH="${ROOT_PATH}/config"

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
export add
source add

# TODO: Add more dependencies / Isolate in another file
add git
add htop
add curl
add build-essential
add wget
add libcanberra-gtk-module

# Install zsh and set as default shell
add zsh
chsh -s $(which zsh)

# if [ "${SHELL}" != "`which zsh`" ]; then
# 	# TODO: Set zsh as default shell if chsh dont work.
# 	# https://unix.stackexchange.com/questions/136423/making-zsh-default-shell-without-root-access
# 	echo "==================="
# fi

echo "==============================================================="
echo "                  INSTALLING TOOLS"
echo "==============================================================="

for f in bin/tools/*.sh; do zsh "$f" -H; done

echo "==============================================================="
echo "                  CONFIG FILES"
echo "==============================================================="

bin/copy.sh



echo "==============================================================="
echo "                  INSTALLING PROGRAMS"
echo "==============================================================="

for f in bin/programs/*.sh; do zsh "$f" -H; done

sudo apt upgrade -y
sudo apt autoremove -y

exec zsh
source ~/.zshrc