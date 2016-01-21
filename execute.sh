#!/bin/bash
# Executing supervisord and mysql_user
# Author : Kaushal Kishore <kaushal.rahuljaiswal@gmail.com>

#/mysql_user.sh
#exec supervisord -n

#!/bin/sh
service php-fpm start
service nginx start

chown -R mysql:mysql /var/lib/mysql
mysql_install_db --user mysql > /dev/null

mysqld_safe --user mysql &

sleep 5s

mysql -v < /root/mariadb.sql

sleep 5s

ps -wef | grep mysql | grep -v grep | awk '{print $2}' | xargs kill -9

mysqld_safe --user mysql

service mysql start
