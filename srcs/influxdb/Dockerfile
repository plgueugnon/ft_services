FROM customlocalalpine
# We get a copy of a custom alpine image created just before

# PID directory /run/nginx must be created in order to launch nginx
# Creating ssl key
RUN apk update && apk add influxdb \
&& apk del wget \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk \
&& rm -rf /var/cache/apk/*

EXPOSE 8086

CMD influxd