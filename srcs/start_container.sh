# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_container.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kbarahon <kbarahon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 12:28:55 by klever            #+#    #+#              #
#    Updated: 2020/11/03 17:57:21 by kbarahon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Start MySQL
service mysql start

# Config Access
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# create website folder
mkdir /var/www/localhost && touch /var/www/localhost/index.php
echo "<?php phpinfo(); ?>" >> /var/www/localhost/index.php

# SSL
mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=sdunckel' -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.pem

# Config NGINX
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
rm -rf /etc/nginx/sites-enabled/default

# Config MYSQL
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

# DL phpmyadmin
mkdir /var/www/localhost/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/localhost/phpmyadmin
mv ./volumns/phpmyadmin.inc.php /var/www/localhost/phpmyadmin/config.inc.php

# DL wordpress
cd /volumns/
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/localhost
mv /volumns/wp-config.php /var/www/localhost/wordpress

# Start
service php7.3-fpm start
service nginx start

bash 