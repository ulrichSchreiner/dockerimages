#!/bin/sh

docker run -d --net host -v `pwd`/data:/bubbledata -P bubble

