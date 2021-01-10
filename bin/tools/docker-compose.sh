#!/bin/bash

echo "======= Installing Docker-Compose ======"
sudo apt install -y py-pip python-dev libffi-dev openssl-dev gcc libc-dev make
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose