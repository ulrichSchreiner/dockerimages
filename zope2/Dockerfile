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

#RUN pip install zope.interface==4.1.1
#RUN pip install Zope2==2.13.22
#RUN pip install --index-url=http://download.zope.org/Zope2/index/2.13.21/ Zope2 zope.interface
#RUN pip install boto==2.27.0
RUN mkdir /src
RUN cd /src && git clone https://github.com/zopefoundation/Zope.git
RUN pip install --upgrade setuptools==1.0
RUN cd /src/Zope && python bootstrap.py
RUN cd /src/Zope && bin/buildout

#RUN ln -s /usr/lib/`uname -i`-linux-gnu/libjpeg.so /usr/lib
#RUN ln -s /usr/lib/`uname -i`-linux-gnu/libfreetype.so /usr/lib
#RUN ln -s /usr/lib/`uname -i`-linux-gnu/libz.so /usr/lib
#RUN pip install PIL==1.1.7

RUN useradd zope
RUN echo "zope:zope" | chpasswd

RUN mkdir /zope
RUN chown zope:zope /zope
ADD run /src/run
ADD zope.conf /src/zope.conf

EXPOSE 8080
VOLUME /zope
USER zope
ENTRYPOINT /src/run