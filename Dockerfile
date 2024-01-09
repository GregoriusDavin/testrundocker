#ambil official php image
FROM php:8.2-fpm

ARG user
ARG uid
 
#install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

#menghapus cache 
RUN apt-get clean && rm -rf /var/lib/apt/lists*

#install php extension
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

#install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#configurasi user
RUN useradd -G www-data,root -u ${uid} -d /home/${user} $user 
RUN mkdir -p /home/$user/ .composer && \
    chown -R $user:$user /home/$user

#working directory
WORKDIR /var/www

USER $user
