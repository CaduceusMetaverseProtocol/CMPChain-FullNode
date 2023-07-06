## SUPPORTED PLATFORMS
We support running a full node on Ubuntu 22.04 LTS.

## MINIMUM HARDWARE REQUIREMENTS

* 8 cores of CPU and 16 gigabytes of memory (RAM).
* fixed size hard disk, 2TB or elastic volumes, 1TB.


## SOFTWARE PREREQUISITES

* install docker 

https://docs.docker.com/engine/install/#server

* install docker compose-plugin

https://docs.docker.com/compose/install/linux/#install-using-the-repository




##  STORE THE NODE DATA IN A DIFFERENT DIRECTORY(optional)

The default node data directory(./node-data) is in the same directory as the docker-compose.yml file.
Mount a new host folder,replace the path "./node-data" in docker-compose.yml with new directory.

## RUNNING FULL NODE

* Build docker image locally(optional)
```
make build 
```

* Run node(If the docker image does not exist, pull the image from Docker Hub automaticlly.)
* The ENABLE-SYNC-FRAME node startup parameter in docker-compose is disabled by default.

1. If enabled, it validates and saves consensus Event data, allowing it to serve as a source peer node for other nodes to synchronize consensus data.
2. By default, it is disabled, it validates but does not save consensus Event data, therefore it cannot be used as a source peer node for other nodes to synchronize consensus data. Using this mode will greatly save disk space.

```
docker compose up -d
```


* Stop the full node 
```
docker compose down
```


* Download the latest node data archive file(recommend, Default automatic snapshot time is 20:00 UTC)
```
nohup sudo curl -SL https://dl.caduceus.foundation/downloads/light-node-data-$(date -u +'%Y%m%d').tar.gz -O ./light-node-data.tar.gz &

or
 
nohup sudo curl -SL https://dl.caduceus.foundation/downloads/light-node-data-$(date  -u -d yesterday  +'%Y%m%d').tar.gz -O ./light-node-data.tar.gz &

```
```

sudo tar -xzvf ./light-node-data-${YYYYMMDD}.tar.gz 

replace the YYYYMMDD with the date in the downloaded file name.
```
```
docker-compose down
```
```
sudo cp -r ./node-data/node0 ./node-data/node0.bak
```
```
mv ./node-data/node0/data  ./node-data/node0/data.bak
mv ./data/ ./node-data/node0/
sudo cp ./node-data/node0/data.bak/priv_validator_state.json ./node-data/node0/data 
```
```
docker-compose up -d
```



## CHECK THE LAST SYNCED BLOCK NUMBER
If you change the default data directory for node, replace the path "./node-data" with your new directory.
or run the command in the same directory as the docker-compose.yml file.
You maybe need to wait about serval minutes, and then the node will sync blocks and generate committed logs. 
```
tail ./node-data/node0/stdout-cmpd.txt -f | grep Committed

```

## TEST RPC
curl -X POST -H 'Content-Type: application/json' --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["latest", true],"id":1}' http://127.0.0.1:26658

