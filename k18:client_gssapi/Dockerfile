# Version: 0.0.1
# @edt M06 2018-2019
# sshd
# -------------------------------------
FROM fedora:27
LABEL author="@edt ASIX M06-ASO"
LABEL description="kerberos 2018-2019"
RUN dnf -y install krb5-workstation passwd openldap-clients nss-pam-ldapd procps vim
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/startup.sh /opt/docker/install.sh
WORKDIR /opt/docker
CMD [ "/opt/docker/startup.sh" ]

