#!/bin/sh

sed -e "s~##HOST_URL##~${HOST_URL}~g" /config/nginx_site.conf > /etc/nginx/conf.d/site.conf
cp /config/php_fpm_site.conf /etc/php7/php-fpm.d/www.conf

php-fpm7

exec "$@"
