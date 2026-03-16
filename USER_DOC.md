
# User document

## Understand what services are provided by the stack.

* This Docker project creates a ***wordpress+php-fpm*** site accessible by ```localhost```, using ***nginx*** as a proxy and ***mariadb*** (mysql) as the wordpress database

## Start and stop the project.

* You may start the project using the commands at the project root: ```make``` to start; ```make down``` to stop the server.

* You may use ```make clean``` at the project root to delete all data

## Access the website and the administration panel.

* Access by entering the address ```localhost``` in a web browser
* Access the wordpress admin panel by entering the address ```localhost/wp-admin```

## Locate and manage credentials.

Credentials for the database may be found at ```./srcs/.env``` or at ```./secrets/``` after running ```make```

## Check that the services are running correctly

You may execute the command ```docker ps``` to check currently running containers
