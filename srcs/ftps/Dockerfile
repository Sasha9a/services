# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jlyessa <jlyessa@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/03 12:23:04 by jlyessa           #+#    #+#              #
#    Updated: 2021/03/04 17:14:16 by jlyessa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM        alpine:latest
EXPOSE      21 30000

RUN     apk update
RUN     apk add openssl \
				vsftpd \
				telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		mkdir -p /etc/telegraf

RUN     adduser -D jlyessa
RUN     echo "jlyessa:jlyessa" | chpasswd

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/localhost.key \
		-out /etc/ssl/certs/localhost.crt \
		-subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=localhost"

COPY    ./vsftpd.conf 		/etc/vsftpd/vsftpd.conf
COPY	./telegraf.conf 	/etc/telegraf

COPY	./server.sh /tmp/
RUN		chmod +x tmp/server.sh

CMD		["tmp/server.sh"]