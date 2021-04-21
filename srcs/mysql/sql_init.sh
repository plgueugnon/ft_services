#!/bin/sh

# If necessary kill process using port 3306
#sudo kill "$(sudo lsof -t -i:3306)"

# open mysql to all incoming connection
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

# Initialize main standard sql database and user as per alpine reco
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"

# Launch mysql in daemon safe mode #and exit right after 
/usr/bin/mysqld_safe --datadir=/var/lib/mysql --no-watch

# We wait until mysql is up - then we will be able to config it
until echo "show databases;" | mysql -u root
do
 	clear
	echo "mysql is not yet up - please wait"
done

# Config mysql
./create_db.sh

tail -F /tmp/sql.log