# Kerberos khost
## @edt ASIX M11-SAD Curs 2018-2019

**edtasixm11/k18:khostpl** host amb PAM amb autenticació AP de  kerberos i IP de ldap.
  El servidor kerberos al que contacta s'ha de dir *kserver.edt.org*. El servidor ldap
  s'anomena ldap.edt.org. Aquest host es configura amb authconfig .
  
per generar autenticació PAM amb kerberos i ldap cal:

Part Global:
  * instal·lar procs passwd.
  * crear els usuaris i assignar password als locals.
  * un cop fet tot, configurar amb authconfig la autenticació local,
    kerberos i ldap.

Part Ldap:
 * instal·lar openldap-clients nss-pam-ldapd authconfig
 * copiar la configuració client /etc/openldap/ldap.conf.
 * copiar la configuració client /etc/nslcd.
 * copiar la configuració ns /etc/nsswitch.conf.
 * activar el servei nslcd
 * activar el servei nscd

Part Kerberos
 * instal·lar pam_krb5 authconfig
 * copiar /etc/krb5.conf per la configuració client kerberos

Authconfig:
```
authconfig  --enableshadow --enablelocauthorize --enableldap \
            --ldapserver='ldap.edt.org' --ldapbase='dc=edt,dc=org' \
            --enablekrb5 --krb5kdc='kserver.edt.org' \
            --krb5adminserver='kserver.edt.org' --krb5realm='EDT.ORG' \
            --updateall
```

#### Execució:
```
docker run --rm --name kserver.edt.org -h kserver.edt.org --net ldapnet -d danicano/k18:kserver_gssapi
docker run --rm --name ldap.edt.org -h ldap.edt.org --net ldapnet -d danicano/ldapserver:gssapi
docker run --rm --name khost.edt.org -h khost.edt.org --net ldapnet -it danicano/k18:khost_gssapi
```

Test:



```
[root@khost docker]# kinit pere
	Password for pere@EDT.ORG: 
[root@khost docker]# ldapwhoami  -D 'dc=edt,dc=org' -Y GSSAPI -ZZ
	SASL/GSSAPI authentication started
	SASL username: pere@EDT.ORG
	SASL SSF: 256
	SASL data security layer installed.
	dn:uid=pere,cn=edt.org,cn=gssapi,cn=auth
[root@khost docker]# kinit admin/admin
	Password for admin/admin@EDT.ORG: 
[root@khost docker]# ldapwhoami  -D 'dc=edt,dc=org' -Y GSSAPI -ZZ
	SASL/GSSAPI authentication started
	SASL username: admin/admin@EDT.ORG
	SASL SSF: 256
	SASL data security layer installed.
	dn:cn=manager,dc=edt,dc=org
[root@khost docker]# kdestroy 
[root@khost docker]# kinit admin
	Password for admin@EDT.ORG: 
[root@khost docker]# ldapwhoami  -D 'dc=edt,dc=org' -Y GSSAPI -ZZ
	SASL/GSSAPI authentication started
	SASL username: admin@EDT.ORG
	SASL SSF: 256
	SASL data security layer installed.
	dn:cn=manager,dc=edt,dc=org
[root@khost docker]# ldapadd -f maquines.ldif  -h ldap_gssapi.edt.org -Y GSSAPI
	SASL/GSSAPI authentication started
	SASL username: admin@EDT.ORG
	SASL SSF: 256
	SASL data security layer installed.
	adding new entry "uid=maquina01,ou=usuaris,dc=edt,dc=org"
```
