#!/bin/sh

if [ -f "${PHP_CONF}" ];
then
	cp -f ${PHP_CONF} /etc/php7/php-fpm.d/www.conf
fi

if [ -f "${WEB_CONF}" ];
then
	cp -f ${WEB_CONF} /etc/nginx/conf.d/default.conf
fi

/usr/sbin/php-fpm7
/usr/sbin/nginx -g "daemon off;"
