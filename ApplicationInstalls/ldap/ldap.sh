#!/bin/bash

export ldapPassword="ldppassword"

yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel



# Starup LDAP
systemctl start slapd
systemctl enable slapd

# Generate and save the Password
encryptedLDAP_Password=$(slappasswd -h {SSHA} -s $ldapPassword)

if [ -d "/data/ldap" ] ; then 
echo $encryptedLDAP_Password > /data/ldap/encryptedLDAP_Password
else 
echo $encryptedLDAP_Password > /tmp/files/encryptedLDAP_Password
fi

# create the base database
ldapmodify -Y EXTERNAL  -H ldapi:/// -f /tmp/files/db.ldif
ldapmodify -Y EXTERNAL  -H ldapi:/// -f /tmp/files/monitor.ldif

# Load from Templates
sudo cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
sudo chown ldap:ldap /var/lib/ldap/*
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif 
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif

ldapadd -x -w "$ldapPassword" -D "cn=ldapadm,dc=lab,dc=local" -f /tmp/files/base.ldif
ldapadd -x -w "$ldapPassword" -D "cn=ldapadm,dc=lab,dc=local" -f /tmp/files/ou-groups.ldif
ldapadd -x -w "$ldapPassword" -D "cn=ldapadm,dc=lab,dc=local" -f /tmp/files/group-admin.ldif
ldapadd -x -w "$ldapPassword" -D "cn=ldapadm,dc=lab,dc=local" -f /tmp/files/group-developers.ldif

ldapadd -x -w "$ldapPassword" -D "cn=ldapadm,dc=lab,dc=local" -f /tmp/files/user-admin1.ldif
ldappasswd -s password123 -w "$ldapPassword" -D "cn=ldapadm,dc=lab,dc=local" -x "uid=admin1,ou=People,dc=lab,dc=local"

ldapadd -x -w "$ldapPassword" -D "cn=ldapadm,dc=lab,dc=local" -f /tmp/files/user-developer1.ldif
ldappasswd -s password123 -w "$ldapPassword" -D "cn=ldapadm,dc=lab,dc=local" -x "uid=developer1,ou=People,dc=lab,dc=local"