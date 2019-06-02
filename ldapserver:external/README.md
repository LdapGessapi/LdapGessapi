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
docker run --rm --name ldap.edt.org -h ldap.edt.org --net ldapnet -d danicano/ldapserver:external
```

ldapsearch -h localhost -p 389 -x -b "" -s base -LLL supportedSASLMechanisms

