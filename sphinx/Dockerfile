FROM ubuntu:14.04

RUN apt update
RUN apt install -y python-pip
RUN apt install -y texlive texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-lang* 
RUN pip install Sphinx
RUN pip install sphinx_bootstrap_theme
RUN mkdir /doc
WORKDIR /doc

