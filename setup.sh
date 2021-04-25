#!/bin/bash

# Setting colors for bash script
YEL='\033[33m'
NC='\033[0m'
GRE='\033[32m'

# Dealing with nginx service as a precaution
if service nginx status | grep -oq running;
then
    echo "${YEL}Killing nginx service before starting${NC}"
    echo "user42" | sudo systemctl stop nginx
    echo "${GRE}Done !${NC}"
fi

# Dealing with mysql service as a precaution
if pgrep mysql > /dev/null 2>&1;
then
    echo "${YEL}Killing mysql service before starting${NC}"
    echo "user42" | sudo pkill mysql
    echo "${GRE}Done !${NC}"
fi

# Dowloading filezilla to test ftp server later
echo "${YEL}Checking if you have Filezilla${NC}"
if filezilla -v | grep -oq FileZilla;
then
    echo "${GRE}Great Filezilla is already installed :-)${NC}"
else
    echo "${YEL}Installing Filezilla${NC}"
    echo "user42" | sudo apt install filezilla
    echo "${GRE}Done !${NC}"
fi

rm log.txt
eval $(minikube docker-env -u)
minikube delete

#echo "user42" | sudo apt install lftp
#set ftp:ssl-force on
#set ssl:verify-certificate no

# Launch minikube
minikube start --vm-driver=docker

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metalb_configmap.yaml

eval $(minikube docker-env)

# Build docker images
echo "${GRE}Starting to build - please wait while docker images are being built${NC}"
touch log.txt
docker build -t customlocalalpine srcs/base/ >> log.txt

docker build -t ftps srcs/ftps/
# docker build -t grafana srcs/grafana/
# docker build -t influxdb srcs/influxdb/
docker build -t mysql srcs/mysql/ >> log.txt
docker build -t nginx srcs/nginx/ >> log.txt
docker build -t phpmyadmin srcs/phpmyadmin/ >> log.txt
docker build -t wordpress srcs/wordpress/ >> log.txt
echo "${GRE}Build finished${NC}"

# docker run --name nginx -d -p 80:80 -p 443:443 nginx
# docker exec -it nginx sh
# docker run --name wordpress -d -p 5050:5050 wordpress
# docker exec -it wordpress sh
# docker run --name phpmyadmin -d -p 5000:5000 phpmyadmin
# docker exec -it phpmyadmin sh
# docker run --name mysql -d -p 3306:3306 mysql
# docker exec -it mysql sh
# docker run --name ftps -d -p 21 -p 20 ftps
# docker exec -it ftps sh

echo "${GRE}Applying yaml config files - please wait while pods are being created${NC}"
kubectl apply -f ./srcs/ftps/ftps_deployment.yaml
kubectl apply -f ./srcs/mysql/mysql_deployment.yaml
kubectl apply -f ./srcs/nginx/nginx_deployment.yaml
kubectl apply -f ./srcs/phpmyadmin/php_deployment.yaml
kubectl apply -f ./srcs/wordpress/wp_deployment.yaml
echo "${GRE}Pods created${NC}"