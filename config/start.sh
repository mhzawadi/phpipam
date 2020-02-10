#!/bin/sh

sed -e "s~##HOST_URL##~${HOST_URL}~g" /config/nginx_site.conf > /etc/nginx/conf.d/site.conf
ln -s /dev/stdout /var/log/fpm-php.www.log
ln -s /dev/stdout /var/log/nginx/access.log

php-fpm7

exec "$@"
