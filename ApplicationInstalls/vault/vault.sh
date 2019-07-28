#!/bin/bash

sudo su 
mv /tmp/vault/ /opt/vault/
cd /opt/vault 
docker-compose -f /opt/vault/docker-compose.yaml up -d 

vault policy write admin-policy /opt/vault/admin-policy.hcl

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

