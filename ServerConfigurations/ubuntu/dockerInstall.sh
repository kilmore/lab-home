#!/bin/sh

# Install Docker
sudo apt-get install \
          apt-transport-https \
          ca-certificates \
          curl \
          software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
          "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
          $(lsb_release -cs) \
          stable"

sudo apt-get update -y
sudo apt-get install docker-ce -y

sudo usermod -aG docker vagrant

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
