FROM customlocalalpine
# We get a copy of a custom alpine image created just before

# PID directory /run/nginx must be created in order to launch nginx
# Creating ssl key
RUN apk update && apk add influxdb \
#&& apk add openssl \
#&& openssl req -newkey rsa:4096 -sha256 -x509 -days 365 -nodes -out /etc/ssl/certs/cert.pem -keyout /etc/ssl/private/key.pem -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=pgueugno/CN=nginx" \
&& apk del wget \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk \
&& rm -rf /var/cache/apk/*

COPY ./config_telegraf.sh /tmp/
COPY ./influxdb_init.sh /tmp/
RUN chmod +x /tmp/config_telegraf.sh \
&& chmod +x /tmp/influxdb_init.sh

EXPOSE 8086
RUN /tmp/config_telegraf.sh
#CMD telegraf & influxdb run -config /etc/influxdb.conf
CMD /tmp/influxdb_init.sh
#CMD sleep infinity