#!/bin/bash
DB_NAME="prova"
DB_USER="paolo"
DB_PASS="admin"
DB_HOST="10.10.20.10"
sudo apt update
sudo apt install mariadb-server -y

#Fonte: 
#https://mariadb.com/kb/en/server-system-variables/#bind_address
#imposto il bind address, modificando in-place il file di conf del sevrer di Mariadb
#sostiuisco il valore contenuto nel bind_address con l'ip del web server in modo che Mariadb accetti conessioni da esso
#la riga viene modificata anche se ci sono spazi davanti o e' commentata.
sudo sed -i -E "s/^[#[:space:]]*bind-address\s*=.*/bind-address = ${DB_HOST}/" /etc/mysql/mariadb.conf.d/50-server.cnf


sudo mysql -u root -e "CREATE DATABASE ${DB_NAME};"
sudo mysql -u root -e "CREATE USER '${DB_USER}'@'${DB_HOST}' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'${DB_HOST}';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"

sudo systemctl restart mariadb
