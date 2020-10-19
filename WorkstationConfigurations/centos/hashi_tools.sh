#!/bin/bash

#First we Get the tools
terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | egrep "0.13.*" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
packer_url=$(curl https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
terragrunt_url=https://github.com/gruntwork-io/terragrunt/releases/download/v0.25.4/terragrunt_linux_amd64

curl -o terraform.zip $terraform_url
unzip terraform.zip
sudo mv terraform /usr/local/sbin

curl -o $packer.zip $packer_url
unzip packer.zip
sudo mv packer /usr/local/sbin

curl -L -o terragrunt $terragrunt_url
chmod 755 terragrunt
sudo mv terragrunt /usr/local/sbin

rm *.zip