FROM localbaseimage
# We get a copy of a custom alpine image created just before

# PID directory /run/nginx must be created in order to launch nginx
# PHP-FPM is need for nginx to manage fast_CGI request from WP to MYSQL
RUN apk update && apk add nginx \
&& mkdir -p /run/nginx && mkdir -p /var/www/localhost/wordpress \
&& apk add  php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer \
#&& apk add  php7 php7-fpm composer \
#&& ln -s /etc/php7 /usr/bin/php \
&& wget -P /tmp/ https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x /tmp/wp-cli.phar && mv /tmp/wp-cli.phar /usr/local/bin/wp \
&& wp core download --path=/var/www/localhost/wordpress/ --allow-root \
#&& wp core config --dbname=dbprojet --dbuser=yo --dbpass=yopwd --dbhost=localhost --path=/var/www/localhost/wordpress/ --allow-root \
&& wp core install --url="https://localhost/wordpress/" --title="ft_services" --admin_user="yo" --admin_password="yopwd" --admin_email="yo@yo.com" --path=/var/www/localhost/wordpress/ --allow-root \
&& wp user create robert robert@mail.fr --role=administrator --user_pass=robert \
&& wp user create jeanine jeanine@mail.fr --role=contributor --user_pass=jeanine \
&& wp user create germain germain@ya.com --role=author --user_pass=germain \
&& apk del --purge \
&& rm -rf /var/lib/apk/lists/*

# Copy  1-custom nginx welcome page
#       2-nginx server conf file specifying rules for all webpages
#COPY ./index.html /var/www/localhost/
COPY ./wordpress.conf /etc/nginx/http.d/

EXPOSE 5050
CMD service php7-fpm start && ["nginx", "-g", "daemon off;"]