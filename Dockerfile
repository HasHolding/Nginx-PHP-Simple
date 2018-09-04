FROM hasholding/nginx
LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"

EXPOSE 80 443
ENV PHP_CONF "/etc/php7/php-fpm.d/www.conf"
ENV WEB_CONF "/etc/nginx/conf.d/default.conf"
VOLUME /shared

RUN apk add --update --no-cache php7-fpm && \
    sed -i 's/user = nobody/user = nginx/g' /etc/php7/php-fpm.d/www.conf  && \
    sed -i 's/group = nobody/group = nginx/g' /etc/php7/php-fpm.d/www.conf && \
    echo "<?php phpinfo();" >/var/lib/nginx/html/info.php && \
    chmod 755 /var/lib/nginx/html/info.php

COPY entrypoint.sh /bin/entrypoint.sh
COPY default.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["/bin/entrypoint.sh"]