FROM customlocalalpine
# We get a copy of a custom alpine image created just before

# PID directory /run/nginx must be created in order to launch nginx
# PHP-FPM is need for nginx to manage fast_CGI request from WP to MYSQL
RUN apk update && apk add nginx \
&& mkdir -p /run/nginx \
&& apk add openssl \
&& openssl req -newkey rsa:4096 -sha256 -x509 -days 365 -nodes -out /etc/ssl/certs/cert.pem -keyout /etc/ssl/private/key.pem -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=pgueugno/CN=localhost" \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer \
&& mkdir -p /var/www/localhost/wordpress \
&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
&& wp core download --path=/var/www/localhost/wordpress/ \
&& apk del wget \
&& rm /etc/nginx/http.d/default.conf \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk \
&& rm -rf /var/cache/apk/*

# Copy nginx server conf file specifying rules for all webpages
COPY ./srcs/wordpress.conf /etc/nginx/http.d/
COPY ./srcs/wp_init.sh /tmp/
COPY ./srcs/liveness_probe.sh /tmp
RUN chmod +x /tmp/wp_init.sh && chmod +x /tmp/liveness_probe.sh
COPY ./srcs/post.txt /tmp/

EXPOSE 5050

# Uncomment if need to debug script
#CMD /tmp/wp_init.sh > script.log 2>&1
CMD /tmp/wp_init.sh