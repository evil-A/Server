# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: evila-ro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/24 20:33:24 by evila-ro          #+#    #+#              #
#    Updated: 2020/03/06 19:02:47 by evila-ro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#debian
FROM debian:buster

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get upgrade -y --no-install-recommends apt-utils

#utils
RUN apt-get update && apt-get install -y procps
RUN apt-get install -y vim
RUN apt-get install -y openssl

#nginx
RUN apt-get install -y nginx
COPY /srcs/default /etc/nginx/sites-available/
#CMD service nginx start
EXPOSE 80:80 443/tcp

#mariadb/mysql
RUN apt-get install -y mariadb-server
CMD mysql_secure_installation
COPY /srcs/rc.conf /etc/

#php
RUN apt-get install -y php-fpm php-mysql php php-cli php-cgi php-mbstring php-zip
COPY /srcs/php.ini /etc/php/7.3/fpm/

#cosa
COPY /srcs/test.php /var/www/html/

#phpmyadmin
COPY /srcs/phpmyadmin.sql ./

#wordpress
COPY /srcs/html/ /var/www/html/
RUN chown -R www-data:www-data /var/www/html/
RUN chmod 755 -R -c /var/www/*
COPY /srcs/wordpress.sql ./

#init
CMD service nginx start && service php7.3-fpm start && service mysql start && mysql -u root < wordpress.sql && echo  "\e[0;32m               Skinet is online now              \e[0m" && bash && echo  "\e[0;31m                 Hasta la vista                 \e[0m"
#cambiar bash por infinity sleep && wait para un uso pasivo
