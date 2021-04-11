#!/bin/bash

# Dealing with nginx service as a precaution
echo "\033[33mKilling nginx service before starting - please enter admin code to proceed\033[0m"
sudo systemctl stop nginx
echo "\033[33mDone - thank you!\033[0m"

# Build docker image ft_server
echo "\033[32mStarting to build - please wait while docker images are being built\033[0m"
#touch log.txt
docker build -t localbaseimage srcs/base/
docker build -t nginx srcs/nginx/
docker build -t wordpress srcs/wordpress
echo "\033[32mBuild finished\033[0m"

#docker run --name nginx -d -p 80:80 -p 443:443 nginx
#docker exec -it nginx sh
docker run --name wordpress -d -p 5050:5050 -p 80:80 wordpress
docker exec -it wordpress sh