FROM localbaseimage
#FROM alpine
RUN apk update && apk add nginx && mkdir -p /run/nginx
#&& apk del --purge \
#&& rm -rf /var/lib/apk/lists/*
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
#CMD service nginx start \
#&& tail -f /var/log/nginx/*.log