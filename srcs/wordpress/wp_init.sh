#!/bin/sh

php-fpm7

nginx -g 'daemon off'

# wp quick config

wp config create --skip-check --dbname=dbprojet --dbuser=yo --dbpass=yopwd --dbhost=mysql --path=/var/www/localhost/wordpress/ --allow-root
wp core install --path=/var/www/localhost/wordpress/ --url="https://localhost/wordpress/" --title="ft_services" --admin_user="yo" --admin_password="yopwd" --admin_email="yo@yo.com" --allow-root
wp user create --path=/var/www/localhost/wordpress/ robert robert@mail.fr --role=administrator --user_pass=robert
wp user create --path=/var/www/localhost/wordpress/ jeanine jeanine@mail.fr --role=contributor --user_pass=jeanine
wp user create --path=/var/www/localhost/wordpress/ germain germain@ya.com --role=author --user_pass=germain

#tail -f /var/log/nginx/*.log