#!/bin/bash
sudo apt update
sudo apt install apache2 php php-mysql -y
wget -O /var/www/html/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

