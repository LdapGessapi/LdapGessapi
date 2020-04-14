# ldaphost

## @edt ASIX M06-ASO 2018-2019

ldaphost 2018-2019 

host client ldap, ataca ldapserver edt.org

### Comandes:

 * **server** docker run --rm --network netldap -h ldapserver --name ldapserver -p 389:389 -d ldapserver:tmp
 * **host** docker run --network netldap -h ldaphost --name ldaphost --rm -it ldaphost:base

calen els --name per associar-lo realment en la netldap, mirar-ho amb inspect

### Network:

Per crear la xarxa que comparteixen ldapserver i ldaphost anomenada netldap:

```
# docker network create ldapnet
```

Per inspeccionar la xarxa:
```
# docker network inspect ldapnet
```

Per generar una xarxa concreta:
```
# docker network create --subnet 172.30.0.0/16 ldapnet
```



#### Execució:
```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net ldapnet -d danicano/ldapserver:external
docker run --rm --name host.edt.org -h host.edt.org --net ldapnet -it danicano/ldaphost:external
```

