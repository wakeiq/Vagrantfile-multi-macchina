#!/bin/bash
sudo apt update
sudo apt install mariadb-server -y
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql -u root -e "CREATE DATABASE m340_db;"
sudo mysql -u root -e "CREATE USER 'm340_user'@'%' IDENTIFIED BY 'm340_pass';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON m340_db.* TO 'm340_user'@'10.10.20.10';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"
sudo systemctl restart mariadb

