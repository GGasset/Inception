#!/bin/bash

mkdir -p /etc/nginx/ssl

: "${DOMAIN_NAME:=localhost}"

if [ ! -f /etc/nginx/ssl/cert.crt ] || [ ! -f /etc/nginx/ssl/key.pem ] ; then
	openssl req -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/cert.crt -sha256 -days 3650 -nodes -subj "/C=ES/ST=Madrid/L=Madrid/O=Tfef/OU=Fundacion/CN=${DOMAIN_NAME}"

	chmod 600 /etc/nginx/ssl/key.pem
	chmod 644 /etc/nginx/ssl/cert.crt

fi


echo "Checking nginx configuration...."
nginx -t
echo "Configuration complete"


exec nginx -g "daemon off;"


