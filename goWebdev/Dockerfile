FROM ubuntu:14.04

RUN apt-get clean && apt-get update && apt-get -y --fix-missing install \
  npm nodejs curl git mercurial zip ruby-dev build-essential python-pip python-dev rpm ssh libyaml-dev apt-transport-https || /bin/true
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g less autoprefixer
RUN npm install -g less-plugin-clean-css
RUN curl https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz |tar -C /usr/local -xz
RUN gem install fpm
RUN mkdir /work
RUN cd /work && mkdir src pkg bin
ENV GOPATH /work
ENV PATH /usr/local/go/bin/:/work/bin:$PATH
RUN sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
RUN apt-get update
RUN apt-get -y --force-yes install lxc-docker

