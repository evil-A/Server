FROM debian:buster

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get upgrade -y --no-install-recommends apt-utils
RUN apt-get update
# apt-get install ufw   // firewall no funciona
#weget para descargar desde enlacces , a;adir tar
RUN apt-get update && apt-get install -y procps
RUN	apt-get install -y vim
RUN apt-get install -y nginx
RUN apt-get install -y mariadb-server
CMD mysql_secure_installation
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y php
RUN apt-get install -y php-cli
RUN apt-get install -y php-cgi
RUN apt-get install -y php-mbstring
RUN apt-get install -y php-zip
RUN apt-get install -y openssl 
#RUN apt-get install -y php-zip
#construir pagina en index.html con enlaces a worpress y phpmyadmin


#RUN apt-get install -y wget
#CMD wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz
#CMD tar xvf phpMyAdmin-5.0.1-all-languages.tar.gz
#CMD mkdir ./html/phpmyadmin
#CMD mv ./phpMyAdmin-5.0.1-all-languages/ ./html/phpmyadmin/
COPY /srcs/html /var/www/html/
COPY /srcs/wordpress.sql ./
COPY /srcs/phpmyadmin.sql ./
#CMD mkdir -p /var/lib/phpmyadmin/tmp
#CMD chown -R www-data:www-data /var/lib/phpmyadmin
#CMD mkdir /etc/phpmyadmin/
#COPY /srcs/config.inc.php /usr/share/phpmyadmin/

COPY /srcs/default /etc/nginx/sites-available/
COPY /srcs/rc.conf /etc/
COPY /srcs/php.ini /etc/php/7.3/fpm/
COPY /srcs/test.php /var/www/html/
RUN chmod 755 -R -c /var/www
#EXPOSE 80:80 443/tcp
EXPOSE 80 443 
#RUN service nginx start && service php7.3-fpm start && service mysql start
# && mysql -u newuser -ppassword < /wordpress.sql && bash
#RUN service
CMD service nginx start && service php7.3-fpm start && service mysql start && bash
# mysql -u newuser -ppassword < wordpress && bash

 #mysl -u root -proot < wordpress.sql && use wordpress && bash
#Comando en phpmyadmin.sql para crear base de datos luego añadir argumento de cual base de datos importar wordpress.sql
