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

ENV ZOPEVER 2.13.19
RUN cd /src && wget http://pypi.python.org/packages/source/Z/Zope2/Zope2-$ZOPEVER.zip
RUN cd /src && unzip Zope2-$ZOPEVER.zip
RUN cd /src/Zope2-$ZOPEVER && python bootstrap.py
RUN cd /src/Zope2-$ZOPEVER && python bin/buildout
RUN cd /src && ln -s Zope2-$ZOPEVER Zope

RUN ln -s /usr/lib/`uname -i`-linux-gnu/libjpeg.so /usr/lib
RUN ln -s /usr/lib/`uname -i`-linux-gnu/libfreetype.so /usr/lib
RUN ln -s /usr/lib/`uname -i`-linux-gnu/libz.so /usr/lib
RUN pip install PIL==1.1.7

RUN useradd zope
RUN echo "zope:zope" | chpasswd

#RUN mkdir /zope
#RUN chown zope:zope /zope
ADD run /src/run
ADD zope.conf /src/zope.conf

EXPOSE 8080
VOLUME /zope
CMD /src/run