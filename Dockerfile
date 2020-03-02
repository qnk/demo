FROM php:7.4.0-cli

RUN apt-get update && apt-get -y install unzip libicu-dev

RUN docker-php-ext-configure intl && \
    docker-php-ext-install intl

ADD . /opt/demo

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /opt/demo
RUN composer install

ENTRYPOINT ["/usr/local/bin/php","-S","0.0.0.0:8000","-t","public"]
