#!/bin/bash/

# wp quick config

wp config create --skip-check --dbname=dbprojet --dbuser=yo --dbpass=yopwd --dbhost=localhost --path=/var/www/localhost/wordpress/ --allow-root
wp core install --url="https://localhost/wordpress/" --title="ft_services" --admin_user="yo" --admin_password="yopwd" --admin_email="yo@yo.com" --path=/var/www/localhost/wordpress/ --allow-root
wp user create robert robert@mail.fr --role=administrator --user_pass=robert
wp user create jeanine jeanine@mail.fr --role=contributor --user_pass=jeanine
wp user create germain germain@ya.com --role=author --user_pass=germain