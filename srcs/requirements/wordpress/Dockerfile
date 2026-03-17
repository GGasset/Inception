
FROM debian:Bookworm

RUN apt-get update && apt-get install -y \
  php-fpm \
  php-mysql \
  php-curl \
  php-gd \
  php-intl \
  php-mbstring \
  php-soap \
  php-xml \
  php-zip \
  wget \
  curl \
  && ln -s /usr/sbin/php-fpm8.4 /usr/local/bin/php-fpm

WORKDIR /var/www/html

# PHP-fpm conf
COPY conf/www.conf /etc/php/8.4/fpm/pool.d/

# copy + set permissions of setup script
COPY tools/setup_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/setup_wordpress.sh"]
