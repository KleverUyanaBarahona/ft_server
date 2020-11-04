# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: klever <klever@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 01:56:08 by klever            #+#    #+#              #
#    Updated: 2020/11/04 04:42:58 by klever           ###   ########.fr        #
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
COPY ./srcs/start_container.sh .
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
COPY ./srcs/phpmyadmin.inc.php ./volumns
COPY ./srcs/wp-config.php ./volumns
COPY ./srcs/index.html ./volumns
COPY ./srcs/style.css ./volumns

CMD sh start_container.sh


