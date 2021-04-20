#!/bin/sh

# Config mysql
echo "create database dbprojet character set utf8 collate utf8_bin;" | mysql -u root
echo "create user 'yo'@'%' identified by 'yopwd';" | mysql -u root
echo "grant all on dbprojet.* to 'yo'@'%' identified by 'yopwd';" | mysql -u root
echo "grant all privileges on *.* TO 'root'@'%' identified by ''yopwd'';" | mysql -u root
echo "flush privileges;" | mysql -u root

# Enable logging
echo "SET GLOBAL log_output = 'FILE';" | mysql -u root
echo "SET GLOBAL general_log_file='/tmp/sql.log';" | mysql -u root
echo "SET GLOBAL general_log = 'ON';" | mysql -u root
ln -sf /dev/stdout /tmp/sql.log