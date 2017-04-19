FROM debian:jessie

MAINTAINER Ulrich Schreiner <ulrich.schreiner@gmail.com>

ENV GO_VERSION 1.8.1
ENV GB_VERSION 0.4.3
ENV GLIDE_VERSION v0.12.3
ENV NODE_VERSION node_6.x

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
    nodejs \
    rpm \
    ruby-dev \
    rubygems \
    ssh \
    tar \
    zip \
    --no-install-recommends \
    && gem install fpm \
    && rm -rf /var/lib/apt/lists/* \
    #&& ln -s /usr/bin/nodejs /usr/bin/node \
    && npm install -g webpack less \
    && curl https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -xz \
    && mkdir -p /go/src /go/pkg /go/bin \
    && GOPATH=/go PATH=/usr/local/go/bin:$PATH go get \
      github.com/constabulary/gb/... \
      github.com/golang/dep/... \
      github.com/kardianos/govendor \
    && rm -rf /go/pkg/* \
    && ln -sf /go/bin/* /usr/bin/ \
    && curl -sSL https://get.docker.com/builds/Linux/x86_64/docker-1.11.2.tgz | tar -xzC /usr/bin --strip-components=1 \
    && curl -sSL https://github.com/Masterminds/glide/releases/download/${GLIDE_VERSION}/glide-${GLIDE_VERSION}-linux-amd64.tar.gz \
       | tar --strip-components 1 -C /usr/bin -xzv
    
ENV PATH $PATH:/usr/local/go/bin
CMD ["bash"]
