 #!/bin/bash
 
 yum install -y bind bind-utils

# Copy in the main config file
mv /etc/named.conf /etc/named.conf_backup
cp /tmp/configs/named.conf /etc/named.conf 

# Copy in the main domain conf file
cp /tmp/configs/named.conf.local /etc/named/named.conf.local 
chmod 755 /etc/named

# Create Zones directory
mkdir /etc/named/zones

# Copy in Zone Files
cp /tmp/configs/db.lab.local /etc/named/zones/db.lab.local
cp /tmp/configs/db.lab.local /etc/named/zones/db.10.1.1

# Starup BIND
systemctl start named
systemctl enable named 


# Check DNS Configuration files
#  sudo named-checkconf


