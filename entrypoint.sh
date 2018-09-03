#!/bin/sh
cp -u /etc/php7/php-fpm.d/www.conf ${PHP_CONF}
cp -u ${CONF} /etc/nginx/conf.d/
/usr/sbin/php-fpm7
/usr/sbin/nginx -g "daemon off;"
