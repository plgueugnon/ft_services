#!/bin/bash/

docker kill $(docker ps -qa)
docker rm $(docker ps -qa)
#docker rmi alpine
#docker rmi nginx
docker rmi $(docker images -qa)

#Debug
#sudo groupadd docker 
#sudo usermod -aG docker ${USER}
#newgrp docker
#su -s ${USER}

# Hardcore debug
#sudo chmod 666 /var/run/docker.sock

# See open port and processes
#sudo netstat -pna | grep 80
#sudo netstat -tulpn | grep LISTEN
#docker inspect [id container]
#docker inspect --format '{{.State.Pid}}' [id container]
#ps -a (while within a container)
#top

# Inspect size
#docker container ls -s
#docker images
#docker image inspect [image name]

# Logs
#docker log [containername]