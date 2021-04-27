FROM alpine
# this is the custom base image we will use for the rest of our builds

LABEL pgueugno <pgueugno@student.42.fr>

# libc6 packages are necessary lib used by telegraf
RUN apk update && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ libc6-compat \
&& apk add wget
# tools to uncomment to help debugging
#&& apk add nano vim