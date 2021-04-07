#!/bin/bash/

docker kill $(docker ps -qa)
docker rm $(docker ps -qa)
docker rmi $(docker images -qa)