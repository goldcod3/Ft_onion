# Ft_onion
Web Hidden Server developed in the cybersecurity bootcamp at the 42Madrid.

<img src='https://media.giphy.com/media/kE54wc0PNxtVJeARb5/giphy.gif' width=300 height= 300></img>

Resume:
---
The goal of this project is to create a web page and make it accessible from the Tor network by creating a hidden service.

The hidden service is a web service that is hidden in the Tor network.

Dependencies:
---
You just need to have **Docker Desktop** and **make** installed on your computer.

Instructions:
---
1. Clone the repository.
2. Run 'make' inside the cloned repository.
3. The server container generates in the directory srv/url the HTTP and SSH connection links to the hidden tor services.

Makefile options:
---
- make: Generates the Client-Server images and containers.
- make server: Generate the image and the Server container.
- make client: Generate the image and the Client container.
- make exe: Run the Client container and run a bash to test the SSH connection.
- make clean: Stops and removes the Server container and the Client container. 

Access to services:
---
To access HTTP nginx web server, we must use the tor browser with the 'url.onion' generated in the srv/url/hidden_nginx/hostname file when creating the container. [localhost is locked]
[Download Tor](https://www.torproject.org/es/download)

To access the SSH service we must connect to the docker client container:
```bash
docker run -it ft_debian /bin/bash
```
or
```bash
make exe
```

And then run the command
```bash
torify ssh sshusr@url.onion -p 4242
```
Where:
- sshusr: default username enabled for the ssh connection. [password: onion]
- url.onion: url generated in the srv/url/hiddenssh/hostname file for the ssh connection. [replace url.onion with the correct url].

Overview:
---
Server:
Docker container running the following services:

- nginx web server [port 80:80].
- openssh-server service (Server) [port 4242:4242].
- tor hidden service.

Client:
---
Docker container running the following services:

- ssh service (Client).
- tor service (Client).

---
Proyect in progress.

![lgomes-o's 42 ft_onion Score](https://badge42.vercel.app/api/v2/cl4osmqtg006109jvtxcd7k3u/project/2661741)


