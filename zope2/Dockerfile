FROM ubuntu:13.04

RUN apt-get update && apt-get install -y \
  git \
  mercurial \
  bzr \
  wget \
  python \
  build-essential \
  make \
  gcc \
  python-dev \
  locales \
  python-pip \
  zip 

ENV LC_ALL C.UTF-8

RUN pip install zope.interface==4.1.1
RUN pip install Zope2==2.13.22
RUN pip install boto==2.27.0
RUN pip install PIL==1.1.7

