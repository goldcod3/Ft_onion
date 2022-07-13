FROM debian:latest

# Instalación y actualización de paquetes
RUN apt-get update -y && apt upgrade -y
RUN apt-get install nginx tor openssh-server nano -y

# Copy files sshd_config
COPY src/sshd_config /etc/ssh/sshd_config

# Copy files torrc
RUN mkdir -p /root/tor/hidden_service
RUN chmod 700 /root/tor/hidden_service
COPY src/torrc /etc/tor/torrc

# User ssh configuration
RUN useradd -m sshusr
RUN echo "sshusr:onion" | chpasswd

# Inicio del servicio.
ENTRYPOINT nginx; service ssh start; tor
