FROM localbaseimage
# We get a copy of a custom alpine image created just before

# PID directory /run/nginx must be created in order to launch nginx
# Creating ssl key
RUN apk update && apk add nginx \
&& mkdir -p /run/nginx \
&& apk add openssl \
&& apk del --purge \
&& rm -rf /var/lib/apk/lists/*
# Copy  1-custom nginx welcome page
#####       2-nginx server global conf file
#       3-nginx server conf file specifyng rules for all webpages
#       4-nginx proxy conf file
#RUN openssl req -newkey rsa:4096 -sha256 -x509 -days 365 -nodes -out /etc/ssl/certs/cert.pem -keyout /etc/ssl/private/key.pem -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=pgueugno/CN=localhost"
COPY ./index.html /var/www/localhost/
#COPY ./localhost.conf /etc/nginx/http.d/
#COPY ./proxy.conf /etc/nginx/http.d/
####&& ./srcs/nginx/nginx.conf /etc/nginx/ \
EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
#CMD service nginx start \
#&& tail -f /var/log/nginx/*.log