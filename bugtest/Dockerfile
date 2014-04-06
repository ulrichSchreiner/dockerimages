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
  zip \
  libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev
 
ENV LC_ALL C.UTF-8
 
RUN mkdir /src
RUN cd /src && git clone https://github.com/zopefoundation/Zope.git
RUN pip install --upgrade setuptools
RUN pip install --upgrade distribute==0.6.36
RUN cd /src/Zope && python bootstrap.py
RUN cd /src/Zope && bin/buildout

