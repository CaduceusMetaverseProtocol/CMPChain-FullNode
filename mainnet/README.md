## SUPPORTED PLATFORMS
We support running a full node on Ubuntu 22.04 LTS.

## MINIMUM HARDWARE REQUIREMENTS

* 4 cores of CPU and 8 gigabytes of memory (RAM).
* 500 GB of free disk space, solid-state drive(SSD).

## SOFTWARE PREREQUISITES

* install docker 

https://docs.docker.com/engine/install/#server

* install docker compose-plugin

https://docs.docker.com/compose/install/compose-plugin/#installing-compose-on-linux-systems


## RUNING FULL NODE

* Building docker image locally
```
make build 
```

* Runing node(If the docker image does not exist, Pull the image from Docker Hub.)
```
make start
```

* Stoping the full node 
```
make stop 
```