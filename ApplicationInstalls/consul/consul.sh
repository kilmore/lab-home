#!/bin/bash
sudo yum install -y unzip

sudo su 
mv /tmp/configs/ /opt/consul/
cd /opt/consul 
docker-compose -f /opt/consul/docker-compose.yaml up -d 

# Consul 
consul_url="https://releases.hashicorp.com/consul/1.5.3/consul_1.5.3_linux_amd64.zip"
curl -o consul.zip $consul_url 
sudo unzip -o consul.zip -d /usr/local/bin 
sudo ln -s /usr/local/bin/consul /usr/bin/consul

