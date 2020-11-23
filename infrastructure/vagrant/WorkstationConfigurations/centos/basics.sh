#!/bin/bash

sudo yum --enablerepo=extras install epel-release

sudo yum install wget vim -y
sudo yum install net-tools -y
sudo yum install jq -y
sudo yum install ansible -y 
sudo yum install python*-pip -y

# pip3 install molecule
