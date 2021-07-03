# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jlyessa <jlyessa@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/26 14:39:07 by jlyessa           #+#    #+#              #
#    Updated: 2021/03/04 15:58:14 by jlyessa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

minikube stop
minikube delete
minikube start --vm-driver=docker
eval $(minikube docker-env)
minikube addons enable metallb
docker build -t nginx_image ./srcs/nginx/
docker build -t mysql_image ./srcs/mysql/
docker build -t wordpress_image ./srcs/wordpress/
docker build -t phpmyadmin_image ./srcs/phpmyadmin/
docker build -t ftps_image ./srcs/ftps/
docker build -t influxdb_image ./srcs/influxDB/
docker build -t grafana_image ./srcs/grafana/
kubectl apply -f srcs/configmap.yaml
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/influxdb.yaml
kubectl apply -f srcs/grafana.yaml