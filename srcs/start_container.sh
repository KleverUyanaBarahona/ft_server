# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_container.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kbarahon <kbarahon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 12:28:55 by klever            #+#    #+#              #
#    Updated: 2020/11/02 19:49:13 by kbarahon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Config Debian
apt-get update
apt-get upgrade -y
apt-get install -y apt-utils
# Install PHP
apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
# Install tools
apt-get -y install wget
apt-get install -y openssl
apt-get install -y procps 
apt-get install nano 
apt-get install -y wget
# Install nginx
apt-get -y install nginx
# Install MySQL
apt-get -y install mariadb-server

# SSL
mkdir /etc/nginx/ssl
mkdir /etc/nginx/ssl/certs/
mkdir /etc/nginx/ssl/private/
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=sdunckel' -keyout /etc/nginx/ssl/private/localhost.key -out /etc/nginx/ssl/certs/localhost.crt

bash 