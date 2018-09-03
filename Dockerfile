FROM hasholding/alpine-base:3.8
LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"
VOLUME /shared
RUN apk add nginx php7-fpm
RUN mkdir -p /run/nginx
RUN sed -i 's/user = nobody/user = nginx/g' /etc/php7/php-fpm.d/www.conf
RUN sed -i 's/group = nobody/group = nginx/g' /etc/php7/php-fpm.d/www.conf

RUN echo "<?php phpinfo();" >/var/lib/nginx/html/info.php
RUN chmod 755 /var/lib/nginx/html/info.php

ENV PHP_CONF "/etc/php7/php-fpm.d"
ENV CONF "/shared/local.conf"

EXPOSE 80 443
COPY entrypoint.sh /bin/entrypoint.sh
COPY local.conf /shared/local.conf
ENTRYPOINT ["/bin/entrypoint.sh"]