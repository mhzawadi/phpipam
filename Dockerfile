FROM alpine:3.20
MAINTAINER Matthew Horwood <matt@horwood.biz>

# Install required deb packages
RUN apk update && \
    apk add nginx php82-fpm php82-pdo_mysql php82-sockets php82-gd php82-ldap \
    php82-gettext php82-pcntl php82-mysqlnd php82-session php82-gmp php82-json \
    php82-mbstring php82-iconv php82-ctype php82-curl php82-pear php82-simplexml \
    php82-pecl-mcrypt php82-dom php82-posix php82-cli curl git \
    && mkdir -p /var/www/html/ \
    && mkdir -p /run/nginx \
    && rm -f /var/cache/apk/*; \
    [ -f /usr/bin/php ] && rm -f /usr/bin/php; \
    ln -s /usr/bin/php82 /usr/bin/php;

ENV PHPIPAM_SOURCE="https://github.com/phpipam/phpipam/releases/download" \
    PHPIPAM_VERSION="v1.6.0" \
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

COPY config /config

# copy phpipam sources to web dir
ADD ${PHPIPAM_SOURCE}/${PHPIPAM_VERSION}/phpipam-${PHPIPAM_VERSION}.tgz /tmp/
RUN tar -xzf /tmp/phpipam-${PHPIPAM_VERSION}.tgz -C /var/www/html/ --strip-components=1 && \
    cp /config/phpipam_config.php /var/www/html/config.php && \
    cp /config/php.ini /etc/php82/php.ini && \
    cp /config/php_fpm_site.conf /etc/php82/php-fpm.d/www.conf && \
    cp /config/php-fpm.conf /etc/php82/php-fpm.conf && \
    cp /config/nginx_site.conf /etc/nginx/http.d/default.conf;


EXPOSE 80
ENTRYPOINT ["/config/start.sh"]
CMD ["nginx", "-g", "daemon off;"]

## Health Check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD curl -f http://127.0.0.1/index.php || exit 1
