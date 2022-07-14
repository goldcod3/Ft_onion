FROM debian:latest

# Package installation and upgrades
RUN apt-get update -y && apt upgrade -y
RUN apt-get install nginx tor openssh-server vim -y

# Copy files sshd_config
COPY config/sshd_config /etc/ssh/sshd_config

# Copy files torrc
COPY config/torrc /etc/tor/torrc

# Copy file index.html
COPY config/index.html /usr/share/nginx/html/index.html

# Copy files nginx
COPY config/nginx.conf /etc/nginx/nginx.conf

# User ssh configuration
RUN useradd -m sshusr
RUN echo "sshusr:onion" | chpasswd

# Inicio del servicio.
ENTRYPOINT service ssh start; nginx; tor
