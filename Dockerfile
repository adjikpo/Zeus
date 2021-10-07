FROM debian:11

RUN apt update -qq && \
    apt -yqq install lsb-release apt-transport-https ca-certificates wget git && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" && \
    apt update -yqq && \
    apt -yqq install php7.4 php7.4-gd php7.4-curl php7.4-intl php7.4-zip php7.4-mysqli php7.4-mbstring php7.4-xml apache2 libapache2-mod-php7.4 && \
    apt clean

COPY dolibarr.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/

RUN git clone https://github.com/dolibarr/dolibarr -b 14.0 dolibarr && \
    chown -R www-data:www-data dolibarr

EXPOSE 80
CMD apachectl -D FOREGROUND