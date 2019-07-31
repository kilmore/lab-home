 #!/bin/bash
 
 yum install -y bind bind-utils

# copy iin the /etc/named.conf

# Copy in the named.conf.local

sudo chmod 755 /etc/named

sudo mkdir /etc/named/zones

# copy in files /etc/named/zones/db.lab.local
# copy in files /etc/named/zones/db.10.1.1 
# change pers on /etc/named/zones to 755