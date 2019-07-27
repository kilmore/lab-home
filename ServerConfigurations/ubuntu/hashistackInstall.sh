#!/bin/sh

# install prerquisites 
sudo apt-get install unzip -y
sudo apt-get install --assume-yes jq

# Get hasicorp urls
terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
packer_url=$(curl https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')

echo $terraform_url

# Download executables
curl -o terraform.zip $terraform_url
curl -o packer.zip $packer_url

# Install 
sudo unzip -o terraform.zip -d /usr/local/bin
sudo unzip -o packer.zip -d /usr/local/bin