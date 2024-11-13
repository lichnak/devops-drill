# F13 application: DevOps_PHP.
# F13 build Stage: Alpha
# Author: Adam Lichnovsky (@lichnak)
# License: GPL-3.0

ARG DEBIAN_VERSION=bullseye

FROM dockette/debian:${DEBIAN_VERSION}

LABEL maintainer="Adam Lichnovsky (@lichnak)"
LABEL Description="Lightweight container for F13 application with Nginx 1.22 & PHP 8.2 based on Debian Linux."
LABEL Name="DevOps-PHP"
LABEL Version="v0.0.3"

# PHP
ENV PHP_MODS_DIR=/etc/php/8.2/mods-available
ENV PHP_CLI_DIR=/etc/php/8.2/cli/
ENV PHP_CLI_CONF_DIR=${PHP_CLI_DIR}/conf.d
ENV PHP_CGI_DIR=/etc/php/8.2/cgi/
ENV PHP_CGI_CONF_DIR=${PHP_CGI_DIR}/conf.d
ENV PHP_FPM_DIR=/etc/php/8.2/fpm/
ENV PHP_FPM_CONF_DIR=${PHP_FPM_DIR}/conf.d
ENV PHP_FPM_POOL_DIR=${PHP_FPM_DIR}/pool.d
ENV PHP_FPM_BIN=/usr/sbin/php-fpm8.2
ENV PHP_FPM_CONF=/etc/php/8.2/php-fpm.conf
ENV TZ=Europe/Prague

# INSTALLATION
RUN apt update && apt dist-upgrade -y && \
    # DEPENDENCIES #############################################################
    apt install -y wget curl apt-transport-https ca-certificates lsb-release git unzip gnupg && \
    # PHP DEB.SURY.CZ ##########################################################
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    wget -O- http://nginx.org/keys/nginx_signing.key | apt-key add - && \
    echo "deb http://nginx.org/packages/debian/ $(lsb_release -sc) nginx" > /etc/apt/sources.list.d/nginx.list && \
    echo "deb-src http://nginx.org/packages/debian/ $(lsb_release -sc) nginx" >> /etc/apt/sources.list.d/nginx.list && \
    apt update && \
    apt dist-upgrade -y && \
    apt install -y --no-install-recommends \
        nginx \
        supervisor \
        #php8.2-apc \
        php8.2-apcu \
        php8.2-bz2 \
        php8.2-bcmath \
        php8.2-calendar \
        php8.2-cgi \
        php8.2-cli \
        php8.2-ctype \
        php8.2-curl \
        php8.2-fpm \
        php8.2-gettext \
        php8.2-gd \
        php8.2-intl \
        php8.2-imap \
        php8.2-ldap \
        php8.2-mbstring \
        php8.2-memcached \
        #php8.2-mongo \
        php8.2-mysql \
        php8.2-pdo \
        php8.2-pgsql \
        php8.2-redis \
        php8.2-soap \
        php8.2-sqlite3 \
        php8.2-ssh2 \
        php8.2-tidy \
        php8.2-zip \
        php8.2-xmlrpc \
        php8.2-xsl && \
    # COMPOSER #################################################################
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --2 && \
    # NGINX ####################################################################
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    # Attachments directory #####################################################
    mkdir -p /srv/attachments && \
    chown -R www-data:www-data /srv/attachments && \
    chmod -R 777 /srv/attachments && \
    # CLEAN UP #################################################################
    rm /etc/nginx/conf.d/default.conf && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get remove -y wget && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

# PHP
ADD ./conf/docker/dev/php/php-fpm.conf /etc/php/8.2/
ADD ./conf/docker/dev/php/php.ini /etc/php/8.2/conf.d/

# NGINX
ADD ./conf/docker/dev/nginx/nginx.conf /etc/nginx/
ADD ./conf/docker/dev/nginx/mime.types /etc/nginx/
ADD ./conf/docker/dev/nginx/sites.d /etc/nginx/sites.d

# WWW
# Setup document root
COPY --chown=www-data:www-data ./src/ /srv
#ADD ../public /srv/public/

# SUPERVISOR
ADD ./conf/docker/dev/supervisor/supervisord.conf /etc/supervisor/
ADD ./conf/docker/dev/supervisor/services /etc/supervisor/conf.d/

# APPLICATION
WORKDIR /srv

# Install deps
RUN composer install --no-dev --classmap-authoritative --no-plugins --no-scripts && \
    composer update --no-dev --classmap-authoritative --no-plugins --no-scripts

# Install bash
RUN apt-get update && apt-get install -y bash

# PORTS
EXPOSE 80
COPY ./conf/docker/dev/entrypoint.sh /usr/sbin/entrypoint.sh
RUN chmod +x /usr/sbin/entrypoint.sh
CMD ["/usr/sbin/entrypoint.sh"]
