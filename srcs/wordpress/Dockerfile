# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jlyessa <jlyessa@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/03 16:23:19 by jlyessa           #+#    #+#              #
#    Updated: 2021/03/04 17:06:06 by jlyessa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
EXPOSE		5050

RUN		apk update && apk upgrade
RUN		apk add wget \
				nginx \
				supervisor \
				php7 \
				php7-fpm \
				php7-opcache \
				php7-gd \
				php7-mysqli \
				php7-zlib \
				php7-curl \
				php7-mbstring \
				php7-json \
				php7-session \
				telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xvf latest.tar.gz
RUN		mv wordpress		/var/www/wordpress

RUN		mkdir -p /run/nginx
RUN		mkdir -p /etc/telegraf

COPY	./nginx.conf		/etc/nginx/conf.d/nginx.conf
COPY	./supervisor.conf	/etc/supervisord.conf
COPY	./wp-config.php		/var/www/wordpress/wp-config.php
COPY	./telegraf.conf 	/etc/telegraf

CMD 	["/usr/bin/supervisord"]