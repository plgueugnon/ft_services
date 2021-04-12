#!/bin/bash/

# Config mysql
echo "create database dbprojet default character set utf8 collate utf8_unicode_ci;" | mysql -u root
echo "grant all on dbprojet.* to 'yo'@'localhost' identified by 'yopwd';" | mysql -u root
echo "grant all privileges on *.* TO 'root'@'%' identified by 'yopwd';" | mysql -u root
echo "flush privileges;" | mysql -u root
