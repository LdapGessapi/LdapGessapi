# ldapserver:simple


## @edt ASIX M06-ASO Curs 2018-2019

Servidor ldap amb edt.org, amb usuaris i grups, RDN=uid
Exercici per practicar tots els conceptes treballats.


S'han afegit els grups que són posixGroup i identifiquen als membres del group amb l'atribut memberUid.

#### Exemple de dades .ldif

Entitat **grups** per acollir els grups:
```
dn: ou=grups,dc=edt,dc=org
ou: groups
description: Container per a grups
objectclass: organizationalunit
```

Entitat grup 2asix:
```
dn: cn=2asix,ou=grups,dc=edt,dc=org
cn: 2asix
gidNumber: 611
description: Grup de 2asix
memberUid: user06
memberUid: user07
memberUid: user08
memberUid: user09
memberUid: user10
objectclass: posixGroup
```


#### Execució

```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net ldapnet -d danicano/ldapserver:md5_cram
```

ldapsearch -h localhost -p 389 -x -b "" -s base -LLL supportedSASLMechanisms


saslpasswd2 -c pere
Password: 
Again (for verification): 
[root@ldap docker]# sasldblistusers2 
anna@ldap.md5_cram: userPassword
pere@ldap.md5_cram: userPassword
[root@ldap docker]# ldapsearch -U pere uid=jordi
SASL/CRAM-MD5 authentication started
Please enter your password: 
ldap_sasl_interactive_bind_s: Invalid credentials (49)
	additional info: SASL(-13): user not found: no secret in database
