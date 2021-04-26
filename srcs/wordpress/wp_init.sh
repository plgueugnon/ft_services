#!/bin/sh

# wp quick config
wp config create --skip-check --allow-root --path=/var/www/localhost/wordpress/ --dbname=dbprojet --dbuser=yo --dbpass=yopwd --dbhost=mysql
sleep 10

wp core install --allow-root --path=/var/www/localhost/wordpress/ --url=https://172.17.0.2:5050 --title=ft_services --admin_user=yo --admin_password=yopwd --admin_email=yo@yo.com --skip-email
wp user create --path=/var/www/localhost/wordpress/ robert robert@robert.com --role=author --user_pass=robert
wp user create --path=/var/www/localhost/wordpress/ jeanine jeanine@jeanine.com --role=author --user_pass=jeanine
wp user create --path=/var/www/localhost/wordpress/ germain germain@germain.com --role=contributor --user_pass=germain
wp theme activate twentytwenty --path=/var/www/localhost/wordpress/
wp option update blogdescription "ft_services nearly killed me" --path=/var/www/localhost/wordpress/
wp post create /tmp/post.txt --post_title="Aller correcteur soit cool!" --post_excerpt="Soit sympa!" --post_status=publish --path=/var/www/localhost/wordpress/

 sed -i 's/database = "telegraf"/database = "wordpress"/' /etc/telegraf/telegraf.conf

php-fpm7
nginx

telegraf &

tail -f /var/log/nginx/*.log