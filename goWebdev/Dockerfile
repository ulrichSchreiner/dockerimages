FROM debian:stretch-backports

MAINTAINER Ulrich Schreiner <ulrich.schreiner@gmail.com>

ENV GO_VERSION=1.10.3 \
    GLIDE_VERSION=v0.12.3 \
    NODE_VERSION=node_10.x \
    DOCKER_VERSION=18.06.0 \
    DEP_VERSION=0.4.1 \
    HELM_VERSION=2.9.1

RUN apt-get update && \
    apt-get -y install apt-transport-https ca-certificates curl gnupg2 && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://deb.nodesource.com/$NODE_VERSION stretch main" >>/etc/apt/sources.list.d/addons.list && \
    echo "deb http://apt.kubernetes.io/ kubernetes-stretch main" >>/etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && apt-get -y install \
    autoconf \
    autotools-dev \
    build-essential \
    bzr \
    gcc \
    gettext-base \
    git \
    kubectl \
    libtool \
    make \
    mercurial \
    rpm \
    ruby \
    ruby-dev \
    rubygems \
    ssh \
    tar \
    zip 
RUN apt-get -y install nodejs \
    && gem install --no-ri --no-doc fpm \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g webpack less \
    && curl -sSL https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -xz \
    && curl -sSL https://github.com/golang/dep/releases/download/v${DEP_VERSION}/dep-linux-amd64 > /usr/bin/dep \
    && chmod +x /usr/bin/dep \
    && /usr/local/go/bin/go get -u golang.org/x/vgo \
    && ln -sf /root/go/bin/* /usr/bin/ \
    && curl -sSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz | tar -xzC /usr/bin --strip-components=1 docker/docker \
    && chmod +x /usr/bin/docker \
    && curl -sSL https://github.com/Masterminds/glide/releases/download/${GLIDE_VERSION}/glide-${GLIDE_VERSION}-linux-amd64.tar.gz \
       | tar --strip-components 1 -C /usr/bin -xzv \
    && curl -sSL https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
       | tar --strip-components 1 -xzC /usr/bin linux-amd64/helm

COPY gopath.sh /usr/bin/gopath.sh

ENV PATH $PATH:/usr/local/go/bin
CMD ["bash"]
