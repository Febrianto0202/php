FROM php:7.4-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    openssl \
    unzip \
    git \
    curl \
    postgresql \ 
    postgresql-contrib \
    libpq-dev \
    libzip-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Manila /etc/localtime

# Install extensions
RUN docker-php-ext-install pdo_mysql pdo_pgsql zip exif pcntl
RUN docker-php-ext-enable pdo_mysql pdo_pgsql zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ 
#RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
