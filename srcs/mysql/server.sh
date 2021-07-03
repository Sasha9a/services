#!/bin/sh

rc default

/etc/init.d/mariadb setup
rc-service mariadb start

echo "CREATE DATABASE wordpress;" | mysql
echo "GRANT ALL ON *.* TO jlyessa@'%' IDENTIFIED BY 'jlyessa' WITH GRANT OPTION;" | mysql
echo "FLUSH PRIVILEGES;" | mysql

mysql wordpress < wordpress.sql

rc-service mariadb stop

telegraf & usr/bin/mysqld -u root