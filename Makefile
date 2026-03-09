
ENV_FILE=./srcs/.env


all: setup_folders ${ENV_FILE}
	docker compose -f ./srcs/docker-compose.yaml up -d

re: setup_folders ${ENV_FILE}
	docker compose -f ./srcs/docker-compose.yaml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yaml down
	

clean:
	sudo rm -fr ~/data/*
	rm ${ENV_FILE}

${ENV_FILE}:
	echo 'DOMAIN_NAME=ggasset-.42.fr' > ${ENV_FILE}
	echo 'MYSQL_ROOT_PASSWORD=${cat /dev/urandom | head -c 8}' >> ${ENV_FILE}
	echo 'MYSQL_DATABASE=wordpress_db' >> ${ENV_FILE}
	echo 'MYSQL_USER=wp_user' >> ${ENV_FILE}
	echo 'MYSQL_PASSWORD=${cat /dev/urandom | head -c 8}' >> ${ENV_FILE}
	echo 'WORDPRESS_DB_NAME=wordpress_db' >> ${ENV_FILE}
	echo 'WORDPRESS_DB_USER=wp_user' >> ${ENV_FILE}
	echo 'WORDPRESS_DB_PASSWORD=${cat /dev/urandom | head -c 8}' >> ${ENV_FILE}
	echo 'WORDPRESS_DB_HOST=mariadb' >> ${ENV_FILE}
	echo 'WORDPRESS_TABLE_PREFIX=wp_' >> ${ENV_FILE}

setup_folders:
	-mkdir ~/data/
	-mkdir ~/data/wordpress/
	-mkdir ~/data/mariadb/


.PHONY: all re down clean setup_folders
