#!/bin/bash
sudo yum install -y unzip

sudo su 
mv /tmp/configs/ /opt/vault/
cd /opt/vault 
docker-compose -f /opt/vault/docker-compose.yaml up -d 

vault policy write admin-policy /opt/vault/admin-policy.hcl

# Install Vault Client
# Used to setup Vault
vault_url="https://releases.hashicorp.com/vault/1.1.3/vault_1.1.3_linux_amd64.zip"
curl -o vault.zip $vault_url 
sudo unzip -o vault.zip -d /usr/local/bin 
sudo ln -s /usr/local/bin/vault /usr/bin/vault

# Setup LDAP Auth
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=mytoken

vault auth enable ldap
vault write auth/ldap/config \
    url="ldap://10.1.1.14" \
    userdn="ou=People,dc=lab,dc=local" \
    userattr="uid" \
    groupdn="ou=Groups,dc=lab,dc=local" \
    groupattr="cn" \
    insecure_tls=true 

vault write auth/ldap/groups/admin policies=admin-policy 

