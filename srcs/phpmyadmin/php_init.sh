#!/bin/sh

sed -i 's/database = "telegraf"/database = "phpmyadmin"/' /etc/telegraf/telegraf.conf

php-fpm7

telegraf &

nginx -g 'daemon off;'