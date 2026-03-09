#!/bin/bash

# exit on any error
set -e


if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql-install-db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

echo "Starting temporary MariaDB server..."
mysqld --skip-networking --socket=/run/mysqld/mysqld.sock --user=mysql & pid="$!"

echo "Waiting for MariaDB to be ready..."
until mysqladmin --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1; do
    sleep .5
done

echo "Running SQL setup..."
mysql --socket=/run/mysqld/mysqld.sock -u root << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "shutting down"

mysqladmin --socket=/run/mysqld/mysqld.sock -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

wait "$pid" 

echo "mariadb setup complete"
exec mysqld --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock

