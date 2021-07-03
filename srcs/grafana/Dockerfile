# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jlyessa <jlyessa@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/03 18:46:25 by jlyessa           #+#    #+#              #
#    Updated: 2021/03/04 21:51:13 by jlyessa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
EXPOSE		3000

RUN		apk update && apk upgrade
RUN		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache \
				telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY	./grafana.db /usr/share/grafana/data/

RUN		mkdir -p /etc/telegraf
COPY	./telegraf.conf /etc/telegraf

COPY	./server.sh /tmp/
RUN		chmod +x tmp/server.sh

CMD		["tmp/server.sh"]