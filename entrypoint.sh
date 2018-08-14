#!/bin/sh
cp -u /etc/php7/php-fpm.d/www.conf ${PHP_CONF}
cp -u /etc/nginx/conf.d/default.conf ${NGINX_CONF}
/usr/sbin/php-fpm7
/usr/sbin/nginx -g "daemon off;"
