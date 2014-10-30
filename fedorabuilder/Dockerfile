FROM fedora:20

RUN yum --enablerepo=fedora clean metadata
RUN yum -y install rhnpush java-1.7.0-openjdk maven git socat wget || echo OK

CMD ["/bin/bash"]
