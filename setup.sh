#!/bin/bash

# Setting colors for bash script
YEL='\033[33m'
NC='\033[0m'
GRE='\033[32m'

echo "Starting ft_services project intall & config script${NC}"

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

# # Dowloading filezilla to test ftp server later
# echo "${YEL}Checking if you have Filezilla${NC}"
# if filezilla -v | grep -oq FileZilla > /dev/null 2>&1;
# then
#     echo "${GRE}Great Filezilla is already installed :-)${NC}"
# else
#     echo "${YEL}Installing Filezilla${NC}"
#     printf "%s\n" user42 O | sudo apt install filezilla
#     echo "${GRE}Done !${NC}"
# fi

rm log.log
eval $(minikube docker-env -u)
minikube delete

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
touch log.log
docker build -t customlocalalpine srcs/base/ >> log.log
docker build -t telegraf srcs/telegraf/ >> log.log
echo "${GRE}\ttelegraf image built!${NC}"
docker build -t ftps srcs/ftps/ >> log.txt >> log.log
echo "${GRE}\tftps image built!${NC}"
docker build -t influxdb srcs/influxdb/ >> log.log
echo "${GRE}\tinfluxdb image built!${NC}"
docker build -t grafana srcs/grafana/ >> log.log
echo "${GRE}\tgrafana image built!${NC}"
docker build -t mysql srcs/mysql/ >> log.log
echo "${GRE}\tmysql image built!${NC}"
docker build -t nginx srcs/nginx/ >> log.log
echo "${GRE}\tnginx image built!${NC}"
docker build -t phpmyadmin srcs/phpmyadmin/ >> log.log
echo "${GRE}\tphpmyadmin image built!${NC}"
docker build -t wordpress srcs/wordpress/ >> log.log
echo "${GRE}\twordpress image built!${NC}"
echo "${GRE}Build finished${NC}"

echo "${GRE}Applying yaml config files - please wait while pods are being created${NC}"
kubectl apply -f ./srcs/telegraf/telegraf_deployment.yaml
kubectl apply -f ./srcs/influxdb/influxdb_deployment.yaml
kubectl apply -f ./srcs/grafana/grafana_deployment.yaml
kubectl apply -f ./srcs/ftps/ftps_deployment.yaml
kubectl apply -f ./srcs/mysql/mysql_deployment.yaml
kubectl apply -f ./srcs/nginx/nginx_deployment.yaml
kubectl apply -f ./srcs/phpmyadmin/php_deployment.yaml
kubectl apply -f ./srcs/wordpress/wp_deployment.yaml
echo "${GRE}Pods created${NC}"