#!/bin/bash
# Author : Ludo Bermejo <LudoBermejo@gmail.com>

export TERM=dumb

service php-fpm start >> log.txt
service mysql start >> log.txt

mysql -v < /root/db_source.sql > log.txt

service nginx start >> log.txt
