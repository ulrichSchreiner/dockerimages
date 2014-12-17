from ubuntu

run apt update && apt -y install unzip wget openjdk-7-jdk
run apt-get clean && rm -rf /var/lib/apt/lists/*

run mkdir -p /opt/bubbleupnpserver
workdir /opt/bubbleupnpserver
run wget -q http://www.bubblesoftapps.com/bubbleupnpserver/ffmpeg.zip
run wget -q http://bubblesoftapps.com/bubbleupnpserver/BubbleUPnPServer-distrib.zip -O bubbleupnpserver.zip
run unzip bubbleupnpserver.zip
run unzip ffmpeg.zip
run chmod +x launch.sh

expose 58050/tcp 58051/tcp 1900/udp
run mkdir /bubbledata
volume /bubbledata

cmd ["/opt/bubbleupnpserver/launch.sh","-dataDir","/bubbledata"]

