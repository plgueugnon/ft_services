FROM customlocalalpine
# We get a copy of a custom alpine image created just before

RUN apk add mariadb mariadb-common mariadb-client \
&& mkdir -p /run/mysqld \
&& apk del wget \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk

COPY ./sql_init.sh /tmp/
RUN chmod +x /tmp/sql_init.sh

EXPOSE 3306
RUN sh /tmp/sql_init.sh
CMD sleep infinity
#CMD sh /tmp/sql_init.sh