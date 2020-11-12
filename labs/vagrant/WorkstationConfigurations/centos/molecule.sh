sudo yum install -y gcc python3-pip python3-devel openssl-devel python3-libselinux
sudo python3 -m pip install "molecule"
sudo python3 -m pip install "molecule[lint,podman,docker,vagrant]"
 sudo python3 -m pip install molecule-ec2