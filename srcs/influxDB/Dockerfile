# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jlyessa <jlyessa@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/03 15:19:37 by jlyessa           #+#    #+#              #
#    Updated: 2021/03/04 16:56:58 by jlyessa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
EXPOSE		8086

RUN		apk update && apk upgrade
RUN		apk add influxdb \
				telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		mkdir -p /etc/telegraf
COPY	./telegraf.conf /etc/telegraf

COPY	./server.sh ./tmp
RUN		chmod +x /tmp/server.sh

VOLUME	["/root/.influxdb"]
VOLUME	["/sys/fs/cgroup"]

CMD		["tmp/server.sh"]