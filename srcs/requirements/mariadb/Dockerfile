
FROM debian:stable

RUN apt-get update && apt-get install -y apt-transport-https

RUN apt-get -y install sudo
RUN sudo apt-get -y install curl
RUN apt-get install -y procps

RUN sudo apt-get install -y mariadb-server mariadb-client

#RUN sudo mariadb-secure-installation << EOF \
#	
#EOF

RUN apt-get update

ENTRYPOINT [ "mariadb" ]
