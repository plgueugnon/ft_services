#!/bin/bash

# Dealing with nginx service as a precaution
if service nginx status | grep -oq running;
then
    echo "\033[33mKilling nginx service before starting\033[0m"
    echo "user42" | sudo systemctl stop nginx
    echo "\033[33mDone\033[0m"
fi

if pgrep mysql > /dev/null 2>&1 
then
    echo "\033[33mKilling mysql service before starting\033[0m"
    echo "user42" | sudo pkill mysql
    echo "\033[33mDone\033[0m"
fi
rm log.txt
eval $(minikube docker-env -u)
minikube delete

# Launch minikube
minikube start --vm-driver=docker

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# # On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metalb_configmap.yaml

eval $(minikube docker-env)

# Build docker images
echo "\033[32mStarting to build - please wait while docker images are being built\033[0m"
touch log.txt
docker build -t customlocalalpine srcs/base/ >> log.txt
docker build -t mysql srcs/mysql/ >> log.txt
docker build -t nginx srcs/nginx/ >> log.txt
docker build -t phpmyadmin srcs/phpmyadmin/ >> log.txt
docker build -t wordpress srcs/wordpress/ >> log.txt
echo "\033[32mBuild finished\033[0m"

# docker run --name nginx -d -p 80:80 -p 443:443 nginx
# docker exec -it nginx sh
# docker run --name wordpress -d -p 5050:5050 wordpress
# docker exec -it wordpress sh
# docker run --name phpmyadmin -d -p 5000:5000 phpmyadmin
# docker exec -it phpmyadmin sh
# docker run --name mysql -d -p 3306:3306 mysql
# docker exec -it mysql sh

kubectl apply -f ./srcs/mysql/mysql_deployment.yaml
kubectl apply -f ./srcs/nginx/nginx_deployment.yaml
kubectl apply -f ./srcs/phpmyadmin/php_deployment.yaml
kubectl apply -f ./srcs/wordpress/wp_deployment.yaml