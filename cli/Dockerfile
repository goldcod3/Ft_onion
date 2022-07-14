FROM debian:latest

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install tor ssh -y

ENTRYPOINT service ssh start; tor
