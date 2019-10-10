FROM ubuntu:disco

RUN apt-get update && apt-get install -y scantailor

VOLUME /data
WORKDIR /data
