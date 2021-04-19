#!/bin/sh

# If necessary kill process using port 3306
#sudo kill "$(sudo lsof -t -i:3306)"

# open mysql to all incoming connection
sed -i "s|.*skip-networking.*|skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

# Initialize main standard sql database and user as per alpine reco
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"

# Launch mysql in daemon safe mode #and exit right after 
/usr/bin/mysqld_safe --datadir=/var/lib/mysql #--no-watch

# We wait until mysql is up - then we will be able to config it
until echo "show databases;" | mysql -u root
do
 	clear
	echo "mysql is not yet up - please wait"
done

# Config mysql
echo "create database dbprojet default character set utf8 collate utf8_unicode_ci;" | mysql -u root
echo "grant all on dbprojet.* to 'yo'@'%' identified by 'yopwd';" | mysql -u root
echo "grant all privileges on *.* TO 'root'@'%' identified by 'yopwd';" | mysql -u root
echo "flush privileges;" | mysql -u root

# Enable logging
echo "SET GLOBAL log_output = 'FILE';" | mysql -u root
echo "SET GLOBAL general_log_file='/tmp/sql.log';" | mysql -u root
echo "SET GLOBAL general_log = 'ON';" | mysql -u root
ln -sf /dev/stdout /tmp/sql.log

#tail -F /tmp/sql.log
#mysqld -u root