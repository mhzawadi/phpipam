#!/bin/sh

cp /config/nginx_site.conf /etc/nginx/conf.d/default.conf
ln -s /dev/stdout /var/log/fpm-php.www.log
ln -s /dev/stdout /var/log/nginx/access.log

php-fpm7

exec "$@"
