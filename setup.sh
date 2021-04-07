#!/bin/bash

# Build docker image ft_server
#echo "\033[32mStarting to build - please wait while docker image is being built\033[0m"
#touch log.txt
docker build -t localbaseimage srcs/base/
docker build -t nginx srcs/nginx/
#echo "\033[32mBuild finished\033[0m"

#docker run --name nginx -dit -p 80:80 nginx sh
docker run --name nginx -d -p 80:80 nginx
docker exec -it nginx sh