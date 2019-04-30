# Version: 0.0.1
# @edt M06 2018-2019
# ldapserver base edt.org
# -------------------------------------
FROM fedora:27
LABEL author="@edt ASIX M06-ASO"
LABEL description="ldaphost 2018-2018 ldapserver edt.org"
RUN dnf -y install openldap-clients 
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN cp /opt/docker/ldap.conf /etc/openldap/ldap.conf
WORKDIR /opt/docker
CMD ["/bin/bash"]


