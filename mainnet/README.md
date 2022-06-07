## SUPPORTED PLATFORMS
We support running a full node on Ubuntu 22.04 LTS.

## MINIMUM HARDWARE REQUIREMENTS

* 4 cores of CPU and 16 gigabytes of memory (RAM).
* fixed size hard disk,2TB; Elastic Volumes,1TB.


## SOFTWARE PREREQUISITES

* install docker 

https://docs.docker.com/engine/install/#server

* install docker compose-plugin

https://docs.docker.com/compose/install/compose-plugin/#installing-compose-on-linux-systems



##  STORE THE NODE DATA IN A DIFFERENT DIRECTORY(optional)

The default node data directory(./node-data) is in the same directory as the docker-compose.yml file.
Mount a new host folder,replace the path "./node-data" in docker-compose.yml with new directory.

## RUNNING FULL NODE

1. Building docker image locally(optional)
```
make build 
```

2. Running node(If the docker image does not exist, pull the image from Docker Hub automaticlly. )
```
make start
```

3. Stopping the full node 
```
make stop 
```

## CHECK THE LAST SYNCED BLOCK NUMBER
If you change the default data directory for node, replace the path "./node-data" with your new directory.
or run the command in the same directory as the docker-compose.yml file.
```
tail ./node-data/node0/stdout-cmpd.txt -f | grep Committed

```

