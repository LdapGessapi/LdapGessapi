### `krb5-workstation` no fa falta al servidor

### Ordres
[/usr/sbin/kdb5_util create -s] --> crear base de datos de kerberos

#### interactiu
kadmin.local; list_principals --> interactiu
kadmin.local -q "list_principals"

#### crear users/principals
kadmin.local -q "addprinc -pw kpere pere"

#### borrar users/principals

	kadmin.local -q "delprinc pere"

	Are you sure you want to delete the principal "pere@EDT.ORG"? (yes/no): yes
	Principal "pere@EDT.ORG" deleted.
	Make sure that you have removed this principal from all ACLs before reusing.
	
#### listar users/principals

	kadmin.local -q "list_principals"
		Authenticating as principal root/admin@EDT.ORG with password.
		K/M@EDT.ORG
		jordi@EDT.ORG
		julia@EDT.ORG
		kadmin/admin@EDT.ORG
		kadmin/changepw@EDT.ORG
		kadmin/kserver.edt.org@EDT.ORG
		kiprop/kserver.edt.org@EDT.ORG
		krbtgt/EDT.ORG@EDT.ORG
		marta/admin@EDT.ORG
		marta@EDT.ORG
		pau@EDT.ORG
		pere@EDT.ORG
		superuser@EDT.ORG
		
####obtener ticket

	[kinit pau]
		Password for pau@EDT.ORG: 
	[klist]
		Ticket cache: FILE:/tmp/krb5cc_0
		Default principal: pau@EDT.ORG
	
		Valid starting     Expires            Service principal
		02/20/19 09:48:30  02/21/19 09:48:30  krbtgt/EDT.ORG@EDT.ORG
	[destroy] --> quitar ticket

#### kinit/kadmin
	[kinit jordi]
		Password for jordi@EDT.ORG: 
	[klist]
		Ticket cache: FILE:/tmp/krb5cc_0
		Default principal: jordi@EDT.ORG
		
		Valid starting     Expires            Service principal
		02/20/19 10:21:21  02/21/19 10:21:21  krbtgt/EDT.ORG@EDT.ORG
	[kadmin]
		Authenticating as principal jordi/admin@EDT.ORG with password.
		kadmin: Client 'jordi/admin@EDT.ORG' not found in Kerberos database while initializing kadmin interface
	[kdestroy ]
	[kadmin -p jordi]
		Authenticating as principal jordi with password.
		Password for jordi@EDT.ORG: 
	[kadmin:  listprincs]
		get_principals: Operation requires ``list`` privilege while retrieving list.



	[kinit pere/admin]
		Password for pere/admin@EDT.ORG: 
	[kadmin]
		Authenticating as principal pere/admin@EDT.ORG with password.
		Password for pere/admin@EDT.ORG: 
	[kadmin:  listprincs]
		K/M@EDT.ORG
		anna@EDT.ORG
		jordi@EDT.ORG
		julia@EDT.ORG
		kadmin/admin@EDT.ORG
		kadmin/changepw@EDT.ORG
		kadmin/kserver.edt.org@EDT.ORG
		kiprop/kserver.edt.org@EDT.ORG
		krbtgt/EDT.ORG@EDT.ORG
		marta@EDT.ORG
		pau@EDT.ORG
		pere/admin@EDT.ORG
		pere@EDT.ORG
		superuser@EDT.ORG


kinit pere: kpere  --> login pere
klist
kdestroy  --> logout pere/(eliminar tickert)
kinit superuser: ksuperuser; klist;kdestroy
kinit pere: kpere; klist; kadmin (ens diu que per fer kadmin em de ser pere/admin);kdestroy
kinit anna: kanna; klist; kadmin (Client 'anna/admin@EDT.ORG' not found in Kerberos database while initializing kadmin interface)
kadmin -p superuser:ksuperuser;
admin:  delprinc julia	
Are you sure you want to delete the principal "julia@EDT.ORG"? (yes/no): yes
Principal "julia@EDT.ORG" deleted.
Make sure that you have removed this principal from all ACLs before reusing.
kadmin:  quit
[root@kserver docker]# klist
Ticket cache: FILE:/tmp/krb5cc_0
Default principal: anna@EDT.ORG

Valid starting     Expires            Service principal
02/18/19 11:32:10  02/19/19 11:32:10  krbtgt/EDT.ORG@EDT.ORG
kadmin -p pere     
Authenticating as principal pere with password.
Password for pere@EDT.ORG: 
kadmin:  listprincs
get_principals: Operation requires ``list`` privilege while retrieving list.
kadmin:  quit
[root@kserver docker]# kadmin -p pere/admin  --> (**-p** en nom de qui et vols connectar)(Volem ser **pere/admin**)
Authenticating as principal pere/admin with password.
Password for pere/admin@EDT.ORG: 
kadmin:  listprincs
K/M@EDT.ORG
anna@EDT.ORG
jordi@EDT.ORG
kadmin/admin@EDT.ORG
kadmin/changepw@EDT.ORG
kadmin/kserver@EDT.ORG
kiprop/kserver@EDT.ORG
krbtgt/EDT.ORG@EDT.ORG
marta@EDT.ORG
pau@EDT.ORG
pere/admin@EDT.ORG
pere@EDT.ORG
superuser@EDT.ORG
