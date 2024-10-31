#!/bin/sh

ln -s /dev/stdout /var/log/php-fpm.www.log
ln -s /dev/stdout /var/log/php-fpm.log
ln -s /dev/stdout /var/log/nginx/access.log

php-fpm83

exec "$@"
