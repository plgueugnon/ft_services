FROM alpine
LABEL pgueugno <pgueugno@student.42.fr>

# libc6 packages are necessary lib used by telegraf
RUN apk update && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ libc6-compat \
#&& apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ telegraf \
&& apk add wget \
&& apk add nano vim

#COPY ./telegraf.conf /etc/telegraf/