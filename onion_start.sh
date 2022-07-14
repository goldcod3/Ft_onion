docker build -t img-onion .
docker rm -fv ft_onion && docker run -p 80:80 -p 4242:4242 --name ft_onion img-onion
# bash test/debian.sh
