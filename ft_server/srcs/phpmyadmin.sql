CREATE DATABASE wordpress;
CREATE USER 'newuser'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'localhost';
FLUSH PRIVILEGES;
