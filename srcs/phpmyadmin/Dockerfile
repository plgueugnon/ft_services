FROM customlocalalpine
# We get a copy of a custom alpine image created just before

# PID directory /run/nginx must be created in order to launch nginx
# PHP-FPM is need for nginx to manage fast_CGI request from WP to MYSQL
RUN apk update && apk add nginx \
&& apk add  php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer \
&& mkdir -p /run/nginx \
&& mkdir -p /var/www/localhost \
&& wget -P /tmp/ https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -xzvf /tmp/phpMyAdmin-4.9.0.1-all-languages.tar.gz -C /tmp/ \
&& mv /tmp/phpMyAdmin-4.9.0.1-all-languages var/www/localhost/phpmyadmin \
&& rm /tmp/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& apk del wget \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk

COPY ./phpmyadmin.conf /etc/nginx/http.d/

EXPOSE 5000
RUN php-fpm7
CMD ["nginx", "-g", "daemon off;"]