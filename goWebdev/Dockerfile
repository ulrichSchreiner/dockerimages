FROM debian:jessie

MAINTAINER Ulrich Schreiner <ulrich.schreiner@gmail.com>

ENV GO_VERSION 1.6.2
ENV GB_VERSION 0.4.0
ENV NODE_VERSION node_5.x

RUN apt-get update && \
    apt-get -y install apt-transport-https ca-certificates curl --no-install-recommends && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo "deb https://deb.nodesource.com/$NODE_VERSION jessie main" >>/etc/apt/sources.list.d/addons.list && \
    apt-get update && apt-get install -y \
    build-essential \
    bzr \
    git \
    mercurial \
    nodejs \
    ssh \
    tar \
    zip \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    #&& ln -s /usr/bin/nodejs /usr/bin/node \
    && npm install -g webpack \
    && curl https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -xz \
    && mkdir -p /go/src /go/pkg /go/bin \
    && GOPATH=/go PATH=/usr/local/go/bin:$PATH go get \
      github.com/constabulary/gb/... \
    && rm -rf /go/pkg/* \
    && curl -sSL https://get.docker.com/builds/Linux/x86_64/docker-1.11.1 >/usr/bin/docker
    

