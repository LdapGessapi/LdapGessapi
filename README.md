# LDAP GSSAPI  

## Tecnologies: LDAP, Kerberos, TLS, Docker, GIT

* Aquest projecte tracta del servei LDAP i com establir que els clients que l’utilitzen s’autentiquin
apropiadament. També d’establir que les comunicacions client/servidor siguin segures. Caldrà
implementar els diferents tipus d’autenticació que permet LDAP: **SIMPLE**, **MD5/CRAM**,
**EXTERNAL** i **GSSAPI**, en especial aquest últim. La comunicació segura es proporcionarà via
**TLS i STARTTLS**:

1. Implementar un servidor LDAP amb containers Docker que funcioni detach. Ha de
disposar d’una extensa base de dades d’usuris, grups i màquines entre altres dades.
2. Autenticació LDAP. Implementar exemples de funcionament amb containers Docker
d’autenticació:  
	* Simple  
	* MD5/CRAM  
	* External  
	* GSSAPI  
3. Crear clients de prova per verificar els diferents tipus d’autenticació.
4. Tràfic LDAP segur. Implementar exemples amb containers Docker de tràfic LDAP segur
amb:
	* Tràfic TLS amb certificat de servidor generat per una entitat CA propia.  
	* Tràfic TLS amb certificat de client i de servidor.  
	* Tràfic amb STARTTLS.  
5. Crear una entitat de certificació propia que generi els certificats necessaris.  
6. SSF Security Strength Factors
