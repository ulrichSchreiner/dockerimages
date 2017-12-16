FROM debian:jessie

MAINTAINER Ulrich Schreiner <ulrich.schreiner@gmail.com>

ENV GO_VERSION=1.9.2 \
    GLIDE_VERSION=v0.12.3 \
    NODE_VERSION=node_8.x \
    DOCKER_VERSION=17.09.1

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >>/etc/apt/sources.list && \
    apt-get update && \
    apt-get -y install apt-transport-https ca-certificates curl --no-install-recommends && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo "deb https://deb.nodesource.com/$NODE_VERSION jessie main" >>/etc/apt/sources.list.d/addons.list && \
    apt-get update && apt-get -t jessie-backports -y install \
    build-essential \
    bzr \
    gcc \
    git \
    make \
    mercurial \
    rpm \
    ruby-dev \
    rubygems \
    ssh \
    tar \
    zip \
    --no-install-recommends 
RUN apt-get -y install nodejs \
    && gem install fpm \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g webpack less \
    && curl https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -xz \
    && mkdir -p /go/src /go/pkg /go/bin \
    && GOPATH=/go PATH=/usr/local/go/bin:$PATH go get \
      github.com/golang/dep/... \
    && rm -rf /go/pkg/* \
    && ln -sf /go/bin/* /usr/bin/ \
    && curl -sSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz | tar -xzC /usr/bin --strip-components=1 docker/docker \
    && chmod +x /usr/bin/docker \
    && curl -sSL https://github.com/Masterminds/glide/releases/download/${GLIDE_VERSION}/glide-${GLIDE_VERSION}-linux-amd64.tar.gz \
       | tar --strip-components 1 -C /usr/bin -xzv

COPY gopath.sh /usr/bin/gopath.sh

ENV PATH $PATH:/usr/local/go/bin
CMD ["bash"]
