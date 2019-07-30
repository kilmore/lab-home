#!/bin/bash
IP_ADDR=$(ip  -f inet a show eth1| grep inet| awk '{ print $2}' | cut -d/ -f1)

# install k8s master
HOST_NAME=$(hostname -s)

kubeadm init --apiserver-advertise-address=$IP_ADDR --apiserver-cert-extra-sans=$IP_ADDR,kubernetes.lab.local  --node-name $HOST_NAME --pod-network-cidr=172.16.0.0/16

#copying credentials to regular user - vagrant
sudo --user=vagrant mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown $(id -u vagrant):$(id -g vagrant) /home/vagrant/.kube/config

# install Calico pod network addon
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f /tmp/configs/rbac-kdd.yaml
kubectl apply -f /tmp/configs/calico.yaml

# Generate the join token to a shell script
kubeadm token create --print-join-command >> /etc/kubeadm_join_cmd.sh
chmod +x /etc/kubeadm_join_cmd.sh

# required for setting up password less ssh between guest VMs
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart


