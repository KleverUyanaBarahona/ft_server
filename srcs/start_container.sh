# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_container.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: klever <klever@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 12:28:55 by klever            #+#    #+#              #
#    Updated: 2020/11/02 14:49:10 by klever           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# SSL
mkdir /etc/nginx/ssl/certs/
mkdir /etc/nginx/ssl/private/
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=sdunckel' -keyout /etc/nginx/ssl/private/localhost.key -out /etc/nginx/ssl/certs/localhost.crt

bash 