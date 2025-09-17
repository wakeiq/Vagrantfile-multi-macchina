#!/bin/bash
DB_NAME="prova"
DB_USER="paolo"
DB_PASS="admin"
DB_HOST="10.10.20.10"
sudo apt update
sudo apt install mariadb-server -y

sudo systemctl start mariadb
sudo systemctl enable mariadb

sudo mysql -u root -e "CREATE DATABASE ${DB_NAME};"
sudo mysql -u root -e "CREATE USER '${DB_USER}'@'${DB_HOST}' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'${DB_HOST}';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"
sudo touch /etc/mysql/mariadb.conf.d/99-server.cnf
sudo bash -c 'echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/99-server.cnf'

sudo systemctl restart mariadb
