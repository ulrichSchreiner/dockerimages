FROM fedora:20

RUN yum --enablerepo=fedora clean metadata
RUN yum -y install rhnpush java-1.7.0-openjdk maven git socat wget sudo fedora-packager rpm-sign expect spawn || echo OK
RUN  sed -i "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

CMD ["/bin/bash"]
