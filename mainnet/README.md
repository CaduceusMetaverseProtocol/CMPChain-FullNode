## SUPPORTED PLATFORMS
We support running a full node on Linux.

## MINIMUM HARDWARE REQUIREMENTS

* 4 cores of CPU and 8 gigabytes of memory (RAM).
* 500 GB of free disk space, solid-state drive(SSD).

## PRE-INSTALL docker-compose

https://docs.docker.com/compose/install/


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