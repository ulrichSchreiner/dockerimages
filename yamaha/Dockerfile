FROM ubuntu

RUN apt-get update
RUN apt-get -y install python-pip
RUN pip install rxv
ENV RX600 http://RXS600/YamahaRemoteControl/ctrl
RUN mkdir /app
ADD app.py /app/app.py

ENTRYPOINT ["/app/app.py"]

