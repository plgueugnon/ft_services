FROM customlocalalpine
# We get a copy of a custom alpine image created just before

# Downloading vsftpd packages
# openrc is a service dependancy and boot manager like systemd which we will need 
# Creating ssl key
RUN apk update && apk add vsftpd \ 
&& apk add openrc openssl \
#&& apk add lftp \
&& openssl req -newkey rsa:4096 -sha256 -x509 -days 365 -nodes -out /etc/ssl/certs/cert.pem -keyout /etc/ssl/private/key.pem -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=pgueugno/CN=nginx" \
&& apk del wget \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk \
&& rm -rf /var/cache/apk/*

COPY ./vsftpd.conf /etc/vsftpd/
COPY ./catch_me_if_you_can_haha.txt /tmp/
COPY ./ftps_init.sh /tmp/
RUN chmod +x /tmp/ftps_init.sh

EXPOSE 20 21 30020 30021

#CMD ./ftps_init.sh > script.log 2>&1
CMD /tmp/ftps_init.sh
#CMD sleep infinity