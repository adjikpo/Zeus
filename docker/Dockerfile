FROM debian:buster


# Upgrade base system
RUN apt update && apt dist-upgrade -y && \
    # DEPENDENCIES #############################################################
    apt install -y wget curl apt-transport-https ca-certificates git unzip && \
    # PHP DEB.SURY.CZ ##########################################################
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/php.list && \
    apt update && \
    apt install -y --no-install-recommends \
        php7.4-apc \
        php7.4-apcu \
        php7.4-bcmath \
        php7.4-bz2 \
        php7.4-calendar \
        php7.4-cgi \
        php7.4-cli \
        php7.4-ctype \
        php7.4-curl \
        php7.4-geoip \
        php7.4-gettext \
        php7.4-imap \
        php7.4-ldap \
        php7.4-mbstring \
        php7.4-memcached \
        php7.4-mongo \
        php7.4-mysql \
        php7.4-pdo \
        php7.4-pgsql \
        php7.4-redis \
        php7.4-soap \
        php7.4-sqlite3 \
        php7.4-zip \
        php7.4-xmlrpc \
        php7.4-xsl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.0.8


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN apt-get update && apt-get update -y && \
    # APACHE ###################################################################
    apt-get install -y apache2 && \
    a2enmod include && \
    a2enmod rewrite && \
    a2enmod proxy_fcgi && \
    rm /etc/apache2/sites-enabled/000-default.conf && \
    # CLEAN UP #################################################################
    apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

# VOLUME /srv
WORKDIR /srv

# EXPOSE 80
# EXPOSE 443


# EXPOSE 80
# VOLUME /var/www/documents