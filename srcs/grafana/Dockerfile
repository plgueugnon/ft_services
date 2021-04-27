FROM customlocalalpine
# We get a copy of a custom alpine image created just before

# Creating ssl key
# Downloading & installing grafana packages
RUN apk update && apk add openssl \
&& openssl req -newkey rsa:4096 -sha256 -x509 -days 365 -nodes -out /etc/ssl/certs/cert.pem -keyout /etc/ssl/private/key.pem -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=pgueugno/CN=nginx" \
&& wget -P /tmp/ https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz \
&& tar -zxvf /tmp/grafana-enterprise-7.5.4.linux-amd64.tar.gz -C /tmp/ \
&& mkdir -p /tmp/grafana-7.5.4/conf/provisioning/dashboards/data \
&& rm /tmp/grafana-enterprise-7.5.4.linux-amd64.tar.gz \
&& apk del wget \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk \
&& rm -rf /var/cache/apk/*

# Config file specifying from where data used by grafana comes from
COPY ./srcs/influxb_datasources.yaml /tmp/grafana-7.5.4/conf/provisioning/datasources/
# grafana config file
COPY ./srcs/grafana.ini /tmp/grafana-7.5.4/conf/
# Config file overheading dashboards spec files
COPY ./srcs/dashboard_provider.yaml /tmp/grafana-7.5.4/conf/provisioning/dashboards/
# Dashboards spec files
COPY ./srcs/dashboards/* /tmp/grafana-7.5.4/conf/provisioning/dashboards/data/

EXPOSE 3000

CMD /tmp/grafana-7.5.4/bin/grafana-server --config=/tmp/grafana-7.5.4/conf/grafana.ini --homepath /tmp/grafana-7.5.4/