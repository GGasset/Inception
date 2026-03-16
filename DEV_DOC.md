
# Developer document

## Set up the environment from scratch (prerequisites, configuration files, secrets).

* Run ```make``` at the project root 

## Build and launch the project using the Makefile and Docker Compose.

* Run ```make``` at the project root

## Use relevant commands to manage the containers and volumes.

|command|use|
|---|---|
|```docker volume ls```|***Lists all active docker volumes***|
|```docker volume rm [name]```|***Removes the specified volume***|
|```docker volume prune```|***Removes all inactive volumes***|

## Identify where the project data is stored and how it persists.

* Project data is stored at host folder ~/data/
* It persists as long as is not removed bya ```docker volume rm``` (and equivalents) or is manually removed using the command ```rm```
