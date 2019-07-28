# Install Docker

echo "==== DOCKER INSTALL Starting =============================================================================="
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2                  

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo  

 sudo yum install -y docker-ce docker-ce-cli containerd.io    
 sudo systemctl enable docker
 sudo systemctl start docker
 sudo usermod -aG docker vagrant

# Install Docker Compose
 sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 sudo chmod +x /usr/local/bin/docker-compose
 sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

 echo "==== DOCKER INSTALL COMPLETE =============================================================================="