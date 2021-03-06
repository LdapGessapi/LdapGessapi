#! /bin/bash
# @edt ASIX M06 2018-2019
# instal.lacio slapd edt.org
# -------------------------------------
groupadd local01
groupadd kusers
useradd -g users -G local01 local01
useradd -g users -G kusers user01
echo "local01" | passwd --stdin local01

cp  /opt/docker/ldap.conf /etc/openldap/ldap.conf
mkdir /etc/openldap/certs
cp /opt/docker/cacert.pem /etc/openldap/certs/.
cp /opt/docker/servercert.ldap.pem /etc/openldap/certs/.
cp /opt/docker/serverkey.ldap.pem  /etc/openldap/certs/.

rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/ldap/*
cp /opt/docker/DB_CONFIG /var/lib/ldap
slaptest -F /etc/openldap/slapd.d -f /opt/docker/slapd.conf
slapadd -F /etc/openldap/slapd.d -l /opt/docker/edt.ldif
chown -R ldap.ldap /etc/openldap/slapd.d
chown -R ldap.ldap /var/lib/ldap

cp /opt/docker/krb5.conf /etc/krb5.conf
kadmin -p admin -w kadmin -q "ktadd -k /etc/krb5.keytab ldap/ldap.edt.org" #exportar claus
