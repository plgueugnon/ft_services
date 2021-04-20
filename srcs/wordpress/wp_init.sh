#!/bin/sh

php-fpm7

#nginx -g 'daemon off;'
nginx
# wp quick config

# wp config create --skip-check --dbname=dbprojet --dbuser=yo --dbpass=yopwd --dbhost=mysql --path=/var/www/localhost/wordpress/ --allow-root
# wp core install --path=/var/www/localhost/wordpress/ --url="https://172.17.0.2:5050" --title="ft_services" --admin_user="yo" --admin_password="yopwd" --admin_email="yo@yo.com" --allow-root
# wp user create --path=/var/www/localhost/wordpress/ robert robert@mail.fr --role=administrator --user_pass=robert
# wp user create --path=/var/www/localhost/wordpress/ jeanine jeanine@mail.fr --role=contributor --user_pass=jeanine
# wp user create --path=/var/www/localhost/wordpress/ germain germain@ya.com --role=author --user_pass=germain

wp config create --skip-check --allow-root --path=/var/www/localhost/wordpress/ --dbname=dbprojet --dbuser=yo --dbpass=yopwd --dbhost=mysql

sleep 10
# while :
# do
#         ping -c 3 172.17.0.2:3306
#         if [[ $? -eq 0 ]];
#         then
#                 echo "wp-mysql connection establised"
#                 break
#         else
#                 echo "waiting for connection to mysql db"
#         fi
# done

#!/bin/sh

# COUNT=10
# while :
# do
#         echo "waiting for database connection"
#         wp core is-installed | grep "Error establishing"
#         #wp core install --allow-root --path=/var/www/localhost/wordpress/ \
#         #--url=https://172.17.0.2:5050 --title=ft_services \
#         # --admin_user=yo --admin_password=yopwd \
#         # --admin_email=yo@yo.com | grep "Error establishing"
#         if [[ $? = 0 ]]
#         then
#                 let "COUNT--"
#                 echo "$COUNT"
#                 sleep 1
#                 if [[ $COUNT = 0 ]]
#                 then
#                         exit 1
#                 fi
#         else
#                 echo "database connected"
#                 break
#         fi
# done

wp core install --allow-root --path=/var/www/localhost/wordpress/ --url=https://172.17.0.2:5050 --title=ft_services --admin_user=yo --admin_password=yopwd --admin_email=yo@yo.com --skip-email
wp plugin install log-emails disable-emails --activate --path=/var/www/localhost/wordpress/
wp user create --path=/var/www/localhost/wordpress/ robert robert@robert.com --role=author --user_pass=robert
wp user create --path=/var/www/localhost/wordpress/ jeanine jeanine@jeanine.com --role=author --user_pass=jeanine

#nginx -g 'daemon off;'

tail -f /var/log/nginx/*.log