#!/bin/sh

#sed -i 's/database = "telegraf"/database = "grafana"/' /etc/telegraf/telegraf.conf

exec /tmp/grafana-7.5.4/bin/grafana-server --config=/tmp/grafana-7.5.4/conf/grafana.ini --homepath /tmp/grafana-7.5.4/

#telegraf

#exec /tmp/grafana-7.5.4/bin/grafana-server --config=/tmp/grafana-7.5.4/conf/grafana.ini --homepath /tmp/grafana-7.5.4/