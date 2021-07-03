# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jlyessa <jlyessa@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/28 15:52:32 by jlyessa           #+#    #+#              #
#    Updated: 2021/03/04 17:12:13 by jlyessa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM 		alpine:latest
EXPOSE 		5000

RUN 	apk update && apk upgrade
RUN 	apk add openssh \
				php7 \
				php7-fpm \
				php7-mysqli \
				php7-zlib \
				php7-curl \
				php7-mbstring \
				php7-json \
				php7-session \
				wget \
				nginx \
				supervisor \
				telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		mkdir -p /run/nginx
RUN		mkdir -p /etc/telegraf

COPY	./nginx.conf 		/etc/nginx/nginx.conf
COPY	./supervisor.conf 	/etc/supervisord.conf
COPY	./telegraf.conf 	/etc/telegraf

RUN 	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.xz && \
		tar -xf phpMyAdmin-5.0.2-english.tar.xz && \
	 	rm -rf phpMyAdmin-5.0.2-english.tar.xz && \
		mv phpMyAdmin-5.0.2-english phpmyadmin

COPY 	./config.inc.php phpmyadmin/config.inc.php
RUN 	chmod 755 phpmyadmin/config.inc.php

CMD 	["/usr/bin/supervisord"]