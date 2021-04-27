FROM customlocalalpine
# We get a copy of a custom alpine image created just before

# Downloading & installing influxdb packages
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz \
&& tar -C . -xzf telegraf-1.14.0-static_linux_amd64.tar.gz \
&& chmod +x telegraf/* \
&& cp telegraf/telegraf /usr/bin/ \
&& mkdir /etc/telegraf \
&& mv telegraf/telegraf.conf /etc/telegraf/telegraf.conf \
&& rm -rf *.tar.gz* telegraf/ \
&& apk del wget \
&& rm -rf /var/lib/apk/lists/* \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk \
&& rm -rf /var/cache/apk/* 

COPY ./srcs/telegraf.conf /etc/telegraf/
COPY ./srcs/telegraf.conf /etc/

CMD /usr/bin/telegraf