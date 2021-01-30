#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -y automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev
git clone https://github.com/asdf-vm/asdf.git ~/.asdf;

case $SHELL in
  */zsh)
      # assume Zsh
      echo 'autoload bashcompinit' >> ~/.zshrc
      echo 'bashcompinit' >> ~/.zshrc
      echo 'source $HOME/.asdf/asdf.sh' >> ~/.zshrc
      echo 'source $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
    ;;
  */bash)
      echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
      echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
    ;;
esac

# Install useful plugins
echo "[INFO] Installing asdf plugins...";
source $HOME/.asdf/asdf.sh;

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git;
asdf plugin-add node https://github.com/asdf-vm/asdf-nodejs.git;
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'