#!/bin/bash

export ROOT_PATH=`git rev-parse --show-toplevel`
export CONFIG_PATH="${ROOT_PATH}/config"

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

echo "==============================================================="
echo "                  INSTALLING DEV DEPENDENCIES"
echo "==============================================================="
bin/deps.sh

# Install zsh and set as default shell
sudo apt install -y zsh
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
