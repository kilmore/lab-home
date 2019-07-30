#!/bin/bash

# This is a "hack" to register the node with the master
# this can go away when a config tool like Ansible/Chef or Salt are use. 
# The hack is to ssh from the node to the master and pull down the join command. 

chmod 600 ~/.ssh/id_rsa

yum install -y sshpass 

serverIP=`cat /tmp/configs/serverIP`
echo "$serverIP       kubernetes.lab.local"  >> /etc/hosts 

sshpass -p "vagrant" scp -o StrictHostKeyChecking=no vagrant@kubernetes.lab.local:/etc/kubeadm_join_cmd.sh .
sudo sh ./kubeadm_join_cmd.sh
