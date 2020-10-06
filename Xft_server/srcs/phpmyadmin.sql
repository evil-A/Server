CREATE DATABASE wordpress;
CREATE USER 'root'@'localhost 'IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
UPDATE mysql.user set plugin = 'mysql_native_password' where user='evila';" |  mysql -u evila && \
mysql wordpress -u evila --password= Putophp0  < wordpress.sql > hide
