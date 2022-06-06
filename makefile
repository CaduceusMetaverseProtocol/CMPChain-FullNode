
build :
	docker build -f ./Dockerfile . -t cadcuceus/cmp-chain-mainnet-node

start :
	docker compose up -d 

stop :
	docker compose down 
