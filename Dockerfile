# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: klever <klever@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 01:56:08 by klever            #+#    #+#              #
#    Updated: 2020/11/02 02:28:42 by klever           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y curl
#RUN apt-get update
#RUN apt-get upgrade -y


#COPY ./srcs/start_container.sh ./

#CMD sh start_container.sh

