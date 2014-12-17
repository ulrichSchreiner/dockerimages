#!/bin/sh

docker run -d -p 25565:25565 -v /mnt/daten/minecraft-world:/minecraft --memory 1536m minecraft
