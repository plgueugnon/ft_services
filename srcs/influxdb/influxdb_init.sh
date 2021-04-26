#!/bin/sh

telegraf &

exec influxd run -config /etc/influxdb.conf