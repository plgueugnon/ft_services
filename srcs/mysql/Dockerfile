FROM customlocalalpine
# We get a copy of a custom alpine image created just before

# Downloading and installing mariadb packages
RUN apk update && apk add mariadb mariadb-common mariadb-client \
&& apk del wget \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk \
&& rm -rf /var/cache/apk/*

COPY ./srcs/sql_init.sh .
COPY ./srcs/liveness_probe.sh /tmp/
COPY ./srcs/create_db.sh .
RUN chmod +x /create_db.sh && chmod +x /sql_init.sh && chmod +x /tmp/liveness_probe.sh

EXPOSE 3306
# Uncomment if need to debug script
#CMD ./sql_init.sh > script.log 2>&1
CMD ./sql_init.sh