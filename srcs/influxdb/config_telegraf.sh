#!/bin/sh

  #sed -i 's/influxdb:8086/127.0.0.1:8086/' /etc/telegraf/telegraf.conf

  sed -i 's/database = "telegraf"/database = "influxdb"/' /etc/telegraf/telegraf.conf