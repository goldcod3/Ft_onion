I_SERVER = img_server
I_CLIENT = img_client

S_NAME = ft_onion
C_NAME = ft_debian

S_DIR = srv
C_DIR = cli

V_DIR = $(PWD)/srv/url:/var/lib/tor/

all: server client
	@echo "*--> Containers Sucess Running <--*"

server:
	@docker build -t $(I_SERVER) $(S_DIR)/.
	@docker rm -fv $(S_NAME) && docker run -d -v $(V_DIR) -p 80:80 -p 4242:4242 --name $(S_NAME) $(I_SERVER)
	@echo "*--> Server Sucess Running <--*"

client:
	@docker build -t $(I_CLIENT) $(C_DIR)/.
	@docker rm -fv $(C_NAME) && docker run -d --name $(C_NAME) $(I_CLIENT)
	@echo "*--> Client Sucess Running <--*"

exe: client
	@docker exec -it $(C_NAME) bash

clean:
	@docker rm -fv $(S_NAME) && docker rm -fv $(C_NAME)
	@echo "*--> Containers Stoped and Deleted <--*"
