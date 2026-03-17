
FROM debian:Bookworm

RUN apt-get update && apt-get install -y apt-transport-https

RUN apt-get -y install sudo
RUN sudo apt-get -y install curl
RUN apt-get install -y procps

#                                             Remove cached packages
RUN sudo apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

# Copy configuration
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/init_db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*

RUN mkdir -p /run/mysqld
RUN chown mysql:mysql /run/mysqld
RUN chown mysql:mysql /var/lib/mysql
RUN chmod 755 /run/mysqld

EXPOSE 3306

ENTRYPOINT [ "init_db.sh" ]
