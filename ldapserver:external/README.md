# ldapserver:simple


## @edt ASIX M06-ASO Curs 2018-2019

#### Creacio certificat

##### Generar clau

	[user@localhost ldapserver:external]$ openssl genrsa -out serverkey.ldap.pem
	Generating RSA private key, 2048 bit long modulus (2 primes)
	.............+++++
	............................................................................+++++
	e is 65537 (0x010001)

##### Peticio

	[user@localhost ldapserver:external]$ openssl req -new -key serverkey.ldap.pem -nodes -out serverreq.ldap.pem
	You are about to be asked to enter information that will be incorporated
	into your certificate request.
	What you are about to enter is what is called a Distinguished Name or a DN.
	There are quite a few fields but you can leave some blank
	For some fields there will be a default value,
	If you enter '.', the field will be left blank.
	-----
	Country Name (2 letter code) [XX]:ca
	State or Province Name (full name) []:bcn
	Locality Name (eg, city) [Default City]:bcn
	Organization Name (eg, company) [Default Company Ltd]:edt
	Organizational Unit Name (eg, section) []:inf
	Common Name (eg, your name or your server's hostname) []:ldapserver
	Email Address []:ldapserver@edt.org  
	
	Please enter the following 'extra' attributes
	to be sent with your certificate request
	A challenge password []:
	An optional company name []:

##### Signar peticio

	[user@localhost ldapserver:external]$ openssl x509 -CA cacert.pem -CAkey cakey.pem -req -in serverreq.ldap.pem -days 3650 -CAcreateserial -out servercert.ldap.pem 
	Signature ok
	subject=C = ca, ST = bcn, L = bcn, O = edt, OU = inf, CN = ldapserver, emailAddress = ldapserver@edt.org
	Getting CA Private Key


#### Execució

```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net ldapnet -d danicano/ldapserver:external
```

ldapsearch -h localhost -p 389 -x -b "" -s base -LLL supportedSASLMechanisms

