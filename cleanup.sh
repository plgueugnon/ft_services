#!/bin/bash

rm log.txt
docker kill $(docker ps -qa)
docker rm $(docker ps -qa)
#docker rmi alpine
#docker rmi nginx
docker rmi $(docker images -a)
#sudo apt remove lftp

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

# testing connection to ftps
# nc -zv 172.17.0.2 21
# lftpd ftp://172.17.0.2:21

# Inspect size
#docker container ls -s
#docker images
#docker image inspect [image name]

# Logs
#docker log [containername]
#docker service logs
#tail -f /proc/<pid>/fd/1
#tail -f /proc/<pid>/fd/2
#kubectl get pods -n metallb-system
#kubectl logs <controller-blablabla> -n metallb-system
#kubectl get services
#kubectl describe service <service>
#minikube service <service> #--url
#kubectl get events
#sudo iptables-save
#ip a | grep "docker" |  awk '/inet/ {print $2}'
#route
#kubectl get ep

#manage pod/container
#kubectl get pods
#kubectl exec -it <pod name> -- /bin/sh

#Testing
# curl -i https://172.17.0.2:5050 -k
# filezilla ftp://yo:yopwd@172.17.0.2:21

#kubectl -n default exec -ti busybox -- nslookup kubernetes.default
#kubectl -n default exec -ti busybox -- nslookup svc.cluster.local