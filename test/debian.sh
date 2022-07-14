docker build -t img-debian .
docker rm -fv ft_debian && docker run --name ft_debian img-debian
