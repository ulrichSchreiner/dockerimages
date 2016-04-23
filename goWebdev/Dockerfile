FROM debian:jessie

MAINTAINER Ulrich Schreiner <ulrich.schreiner@gmail.com>

ENV GO_VERSION 1.6.1
ENV GB_VERSION 0.4.0

RUN apt-get update && apt-get install -y \
    build-essential \
    bzr \
    ca-certificates \
    curl \
    git \
    mercurial \
    nodejs \
    npm \
    ssh \
    zip \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && npm install -g webpack \
    && curl https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -xz \
    && mkdir -p /go/src /go/pkg /go/bin \
    && GOPATH=/go PATH=/usr/local/go/bin:$PATH go get \
      github.com/constabulary/gb/... \
    && rm -rf /go/pkg/*
    

