# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jlyessa <jlyessa@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/02 19:07:34 by jlyessa           #+#    #+#              #
#    Updated: 2021/03/04 16:57:08 by jlyessa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
EXPOSE		22 80 443

RUN		apk update && apk upgrade
RUN		apk add	nginx \
				openssl \
				openssh \
				supervisor \
				telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN     adduser -D jlyessa
RUN		echo "jlyessa:jlyessa" | chpasswd

RUN		mkdir -p /run/nginx

COPY	./nginx.conf /etc/nginx/conf.d/default.conf
COPY	./supervisor.conf /etc/supervisord.conf

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/localhost.key \
		-out /etc/ssl/certs/localhost.crt \
		-subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=localhost"

RUN		mkdir -p /etc/telegraf
COPY	./telegraf.conf /etc/telegraf

COPY	./server.sh /tmp/
RUN		chmod +x tmp/server.sh

CMD		["tmp/server.sh"]
