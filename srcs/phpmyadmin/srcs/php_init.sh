#!/bin/sh

php-fpm7

exec nginx -g 'daemon off;'