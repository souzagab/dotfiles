#!/bin/bash

sudo add-apt-repository -y ppa:gnome-terminator

sudo apt-get update

sudo apt-get install -y terminator


gsettings set org.gnome.desktop.default-applications.terminal exec `which terminator` 
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"

sudo update-alternatives --config x-terminal-emulator
# TODO: Export config files

# cp ../config/terminator_config $HOME/.config/terminator/config 
