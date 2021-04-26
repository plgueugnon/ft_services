#!/bin/sh

sed -i 's/database = "telegraf"/database = "nginx"/' /etc/telegraf/telegraf.conf

nginx

telegraf &

tail -f /var/log/nginx/*.log