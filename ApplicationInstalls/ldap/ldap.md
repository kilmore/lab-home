## Pre-Reqs
```
yum install net-tools vim -y
```

## Install OpenLDAP
```
yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel
```

## Start Services
systemctl start slapd
systemctl enable slapd

## Verify
netstat -antup | grep -i 389

## Create LDAP Root Password
slappasswd -h {SSHA} -s ldppassword
{SSHA}w8z3q1RY0jJHVR3fkgS34au+pS8YR9JI


## Set LDAP DB info
ldapmodify -Y EXTERNAL  -H ldapi:/// -f db.ldif

## Configure Monitoring
ldapmodify -Y EXTERNAL  -H ldapi:/// -f monitor.ldif

## Setup LDAP - Load from Template
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
chown ldap:ldap /var/lib/ldap/*

## Add Cosine and nis ldap schemas 
## These are files that we copied from the templates 
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif 
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif

ldapadd -x -W -D "cn=ldapadm,dc=lab,dc=local" -f base.ldif

## Add User
ldapadd -x -W -D "cn=ldapadm,dc=lab,dc=local" -f users.ldif

## Assign Password
ldappasswd -s password123 -W -D "cn=ldapadm,dc=lab,dc=local" -x "uid=dan,ou=People,dc=lab,dc=local"


## Debugging
 ldapsearch -x -h 127.0.0.1 'dc=ldap,dc=com' -s base '(objectclass=*)'
 ldapsearch -x cn=dan -b dc=lab,dc=local


 ## Resources
 [itz geeks - Simple LDAP Setup](https://www.itzgeek.com/how-tos/linux/centos-how-tos/step-step-openldap-server-configuration-centos-7-rhel-7.html)
 [itz geeks - replicated LDAP Setup](https://www.itzgeek.com/how-tos/linux/centos-how-tos/configure-openldap-multi-master-replication-linux.html)
 
 [Adding Groups](http://www.zytrax.com/books/ldap/ch11/groups.html)

 [Open LDAP Admin Guide](https://www.openldap.org/doc/admin24/index.html)
 [Manpages search](http://www.openldap.org/software//man.cgi)