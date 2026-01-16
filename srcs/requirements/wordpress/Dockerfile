FROM debian:stable

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get -y install sudo
RUN sudo apt-get -y install curl

RUN apt update
RUN apt install -y wordpress apache2 mariadb-server
RUN apt install -y php-fpm
RUN ps aux | grep php-fpm



