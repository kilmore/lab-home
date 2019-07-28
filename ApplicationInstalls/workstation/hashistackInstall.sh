#!/bin/sh

# install prerquisites 
sudo apt-get install unzip -y
sudo apt-get install --assume-yes jq

# Get hasicorp urls
terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
packer_url=$(curl https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
vault_url="https://releases.hashicorp.com/vault/1.1.3/vault_1.1.3_linux_amd64.zip"
consul_url="https://releases.hashicorp.com/consul/1.5.3/consul_1.5.3_linux_amd64.zip"

# Download executables
curl -o terraform.zip $terraform_url
curl -o packer.zip $packer_url
curl -o vault.zip $vault_url 
curl -o consul.zip $consul_url 

# Install 
sudo unzip -o terraform.zip -d /usr/local/bin
sudo unzip -o packer.zip -d /usr/local/bin
sudo unzip -o vault.zip -d /usr/local/bin 
sudo unzip -o consul.zip -d /usr/local/bin 