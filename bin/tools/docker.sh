#!/bin/bash

echo "======= Installing Docker ======"

if ! which "docker"; then
  sudo apt-get update

  sudo apt-get remove docker docker-engine docker.io containerd runc
  sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
  sudo apt-get update
  sudo apt install -y docker-ce docker-ce-cli containerd.io

  sudo groupadd docker
  sudo usermod -aG docker $USER
  sudo systemctl enable docker

  else
  
  echo Docker installed at $(which docker)
fi
