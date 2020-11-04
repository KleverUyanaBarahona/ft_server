# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kbarahon <kbarahon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 01:56:08 by klever            #+#    #+#              #
#    Updated: 2020/11/04 21:12:24 by kbarahon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Install image debian 
FROM debian:buster
# Config Debian
RUN apt-get update
RUN apt-get upgrade -y
# Install PHP
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
# Install tools
RUN apt-get -y install wget
RUN apt-get install -y openssl
RUN apt-get install -y procps 
RUN apt-get install nano 
RUN apt-get install -y wget
# Install nginx
RUN apt-get -y install nginx
# Install MySQL
RUN apt-get -y install mariadb-server

RUN mkdir volumns
# Config NGINX
RUN mkdir volumns/localhost
RUN ln -s /volumns/localhost /etc/nginx/sites-available/localhost
RUN ln -s /volumns/localhost /etc/nginx/sites-enabled/localhost

COPY ./srcs/start_container.sh .
COPY ./srcs/nginx.conf ./volumns/localhost
COPY ./srcs/phpmyadmin.inc.php ./volumns
COPY ./srcs/wp-config.php ./volumns
COPY ./srcs/index.html ./volumns
COPY ./srcs/style.css ./volumns
COPY ./srcs/autoindex_off.sh ./
COPY ./srcs/autoindex_on.sh ./

CMD sh start_container.sh


