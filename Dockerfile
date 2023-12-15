FROM alpine:3.19
MAINTAINER Matthew Horwood <matt@horwood.biz>

# Install required deb packages
RUN apk update && \
    apk add nginx php81-fpm php81-pdo_mysql php81-sockets php81-gd php81-ldap \
    php81-gettext php81-pcntl php81-mysqlnd php81-session php81-gmp php81-json \
    php81-mbstring php81-iconv php81-ctype php81-curl php81-pear php81-simplexml \
    php81-pecl-mcrypt php81-dom curl git \
    && mkdir -p /var/www/html/ \
    && mkdir -p /run/nginx \
    && rm -f /var/cache/apk/*;

ENV PHPIPAM_SOURCE="https://github.com/phpipam/phpipam/releases/download" \
    PHPIPAM_VERSION="v1.5.1" \
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
    cp /config/php.ini /etc/php81/php.ini && \
    cp /config/php_fpm_site.conf /etc/php81/php-fpm.d/www.conf && \
    cp /config/nginx_site.conf /etc/nginx/http.d/default.conf;


EXPOSE 80
ENTRYPOINT ["/config/start.sh"]
CMD ["nginx", "-g", "daemon off;"]

## Health Check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD curl -f http://127.0.0.1/index.php || exit 1
