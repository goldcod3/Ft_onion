FROM debian:latest

RUN apt-get update -y && apt upgrade -y
RUN apt-get install nginx tor openssh-server vim -y

ENTRYPOINT nginx ; tor
