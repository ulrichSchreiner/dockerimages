FROM ubuntu:14.04

RUN rm -rf /var/cache/apt/archives/partials
RUN rm -rf /var/lib/apt/lists/partial/*
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean && apt-get update && apt-get -y --fix-missing install \
  npm nodejs curl git mercurial zip ruby-dev build-essential python-pip python-dev rpm ssh libyaml-dev
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g less autoprefixer
RUN npm install -g less-plugin-clean-css
RUN curl https://storage.googleapis.com/golang/go1.4.linux-amd64.tar.gz |tar -C /usr/local -xz
RUN gem install fpm

