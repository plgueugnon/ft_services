FROM customlocalalpine
# We get a copy of a custom alpine image created just before

# PID directory /run/nginx must be created in order to launch nginx
# Creating ssl key
RUN apk update && apk add nginx \
&& mkdir -p /run/nginx \
&& apk add openssl \
&& openssl req -newkey rsa:4096 -sha256 -x509 -days 365 -nodes -out /etc/ssl/certs/cert.pem -keyout /etc/ssl/private/key.pem -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=pgueugno/CN=nginx" \
&& apk del wget \
&& rm /etc/nginx/http.d/default.conf \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk \
&& rm -rf /var/cache/apk/*

# Copy  1-custom nginx welcome page
#       2-nginx server conf file specifying rules for all webpages
#       3-nginx proxy conf file
COPY ./index.html /var/www/localhost/
COPY ./localhost.conf /etc/nginx/http.d/
COPY ./proxy.conf /etc/nginx/http.d/

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]