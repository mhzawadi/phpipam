FROM alpine:3.15
MAINTAINER Matthew Horwood <matt@horwood.biz>

# Install required deb packages
RUN apk update && \
    apk add nginx php7-fpm php7-pdo_mysql php7-sockets php7-gd php7-ldap \
    php7-gettext php7-pcntl php7-mysqlnd php7-session php7-gmp php7-json \
    php7-mbstring php7-iconv php7-ctype php7-curl php7-pear php7-simplexml \
    php7-pecl-mcrypt php7-dom curl git \
    && mkdir -p /var/www/html/ \
    && mkdir -p /run/nginx \
    && rm -f /var/cache/apk/*;

ENV PHPIPAM_SOURCE="https://github.com/phpipam/phpipam/archive/" \
    PHPIPAM_VERSION="1.5.0" \
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
ADD ${PHPIPAM_SOURCE}/${PHPIPAM_VERSION}.tar.gz /tmp/
RUN tar -xzf /tmp/${PHPIPAM_VERSION}.tar.gz -C /var/www/html/ --strip-components=1 && \
    cp /config/phpipam_config.php /var/www/html/config.php && \
    cp /config/php.ini /etc/php7/php.ini && \
    cp /config/php_fpm_site.conf /etc/php7/php-fpm.d/www.conf && \
    cp /config/nginx_site.conf /etc/nginx/http.d/default.conf;


EXPOSE 80
ENTRYPOINT ["/config/start.sh"]
CMD ["nginx", "-g", "daemon off;"]

## Health Check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD curl -f http://127.0.0.1/index.php || exit 1
