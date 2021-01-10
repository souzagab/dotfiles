#!/bin/bash

echo "======= Installing Terminator ======"
if ! which "terminator"; then
  sudo add-apt-repository -y ppa:gnome-terminator

  sudo apt-get update

  sudo apt install -y terminator


  gsettings set org.gnome.desktop.default-applications.terminal exec `which terminator` 
  gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"

  sudo update-alternatives --config x-terminal-emulator
  
  mkdir ~/.config/terminator/
  cp -f $CONFIG_PATH/terminator  ~/.config/terminator/config 
  else
  echo Already instaled at $(which terminator)
fi


