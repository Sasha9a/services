# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jlyessa <jlyessa@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/02 20:57:43 by jlyessa           #+#    #+#              #
#    Updated: 2021/03/05 00:53:04 by jlyessa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
EXPOSE		3306

RUN		apk add openrc \
				mysql \
				mysql-client \
				telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		mkdir -p /etc/telegraf

COPY	./my.cnf			./etc/mysql/
COPY	./telegraf.conf 	/etc/telegraf
COPY	./wordpress.sql		./

COPY	./server.sh /tmp/
RUN		chmod +x /tmp/server.sh

VOLUME	["/var/lib/mysql"]

CMD		["/tmp/server.sh"]