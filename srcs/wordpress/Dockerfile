FROM customlocalalpine
# We get a copy of a custom alpine image created just before

# PID directory /run/nginx must be created in order to launch nginx
# PHP-FPM is need for nginx to manage fast_CGI request from WP to MYSQL
RUN apk update && apk add nginx \
&& mkdir -p /run/nginx \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer \
&& mkdir -p /var/www/localhost/wordpress \
&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
&& wp core download --path=/var/www/localhost/wordpress/ --allow-root \
&& apk del wget \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk

# Copy nginx server conf file specifying rules for all webpages
COPY ./wordpress.conf /etc/nginx/http.d/
COPY ./wp_init.sh /tmp/
RUN chmod +x /tmp/wp_init.sh

#RUN wp core download --path=/var/www/localhost/wordpress/ --allow-root

EXPOSE 5050
#RUN php-fpm7 
#RUN nginx
RUN sh /tmp/wp_init.sh
#CMD php-fpm7 && ["nginx", "-g", "daemon off;"]
#CMD sh /tmp/wp_init.sh 
CMD sleep infinity