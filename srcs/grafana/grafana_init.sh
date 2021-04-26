#!/bin/sh

sed -i 's/database = "telegraf"/database = "grafana"/' /etc/telegraf/telegraf.conf

telegraf &

exec grafana-server --config=/usr/share/grafana/conf/grafana.ini --homepath /usr/share/grafana/