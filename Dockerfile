FROM alpine:3.9.4
MAINTAINER Matthew Horwood <matt@horwood.biz>

# Install required deb packages
RUN apk update && \
	apk add nginx php7-fpm php7-pdo_mysql php7-sockets php7-gd php7-ldap \
	php7-gettext php7-pcntl php7-mysqlnd php7-session php7-gmp php7-json \
	php7-mbstring php7-iconv php7-ctype php7-curl php7-pear \
	&& mkdir -p /var/www/html/ \
	&& mkdir -p /run/nginx \
	&& rm -f /var/cache/apk/*;

ENV PHPIPAM_SOURCE="https://github.com/phpipam/phpipam/archive/" \
		PHPIPAM_VERSION="1.4" \
    MYSQL_HOST="mysql" \
    MYSQL_USER="phpipam" \
    MYSQL_PASSWORD="phpipamadmin" \
    MYSQL_DB="phpipam" \
    MYSQL_PORT="3306" \
    SSL="false" \
    SSL_KEY="/path/to/cert.key" \
    SSL_CERT="/path/to/cert.crt" \
    SSL_CA="/path/to/ca.crt" \
    SSL_CAPATH="/path/to/ca_certs" \
    SSL_CIPHER="DHE-RSA-AES256-SHA:AES128-SHA"

COPY php.ini /usr/local/etc/php/

# copy phpipam sources to web dir
ADD ${PHPIPAM_SOURCE}/${PHPIPAM_VERSION}.tar.gz /tmp/
RUN tar -xzf /tmp/${PHPIPAM_VERSION}.tar.gz -C /var/www/html/ --strip-components=1 && \
    cp /var/www/html/config.dist.php /var/www/html/config.php

# Use system environment variables into config.php
RUN sed -i \
    -e "s/\['host'\] = 'localhost'/\['host'\] = getenv(\"MYSQL_HOST\")/" \
    -e "s/\['user'\] = 'phpipam'/\['user'\] = getenv(\"MYSQL_USER\")/" \
    -e "s/\['pass'\] = 'phpipamadmin'/\['pass'\] = getenv(\"MYSQL_PASSWORD\")/" \
    -e "s/\['name'\] = 'phpipam'/\['name'\] = getenv(\"MYSQL_DB\")/" \
    -e "s/\['port'\] = 3306/\['port'\] = getenv(\"MYSQL_PORT\")/" \
    -e "s/\['ssl'\] *= false/\['ssl'\] = getenv(\"SSL\")/" \
    -e "s/\['ssl_key'\] *= '\/path\/to\/cert.key'/['ssl_key'\] = getenv(\"SSL_KEY\")/" \
    -e "s/\['ssl_cert'\] *= '\/path\/to\/cert.crt'/['ssl_cert'\] = getenv(\"SSL_CERT\")/" \
    -e "s/\['ssl_ca'\] *= '\/path\/to\/ca.crt'/['ssl_ca'\] = getenv(\"SSL_CA\")/" \
    -e "s/\['ssl_capath'\] *= '\/path\/to\/ca_certs'/['ssl_capath'\] = getenv(\"SSL_CAPATH\")/" \
    -e "s/\['ssl_cipher'\] *= 'DHE-RSA-AES256-SHA:AES128-SHA'/['ssl_cipher'\] = getenv(\"SSL_CIPHER\")/" \
    /var/www/html/config.php

COPY config /config

EXPOSE 80
ENTRYPOINT ["/config/start.sh"]
CMD ["nginx", "-g", "daemon off;"]
