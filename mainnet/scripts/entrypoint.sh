#! /bin/sh

# exit script on any error
set -e


initialize() {
	NODE_DIR=$1
	BINARY=$2

	if [ $# != 2 ]; then
		echo "expected 2 arguments for initialize"
		exit 1
	fi

	if [ ! -f "$NODE_DIR/config/genesis.json" ]; then
		echo "no existing genesis file found, initializing.."
		$BINARY init "${MONIKER:-nonamenode}" --home="$NODE_DIR" --chain-id="${CHAIN_ID:-256256}"
		chmod 777 $NODE_DIR
		cd "${NODE_DIR}/config"
		rm -rf app.toml config.toml genesis.json 

		cp -r /tmp/config/*  ./
		cp -r /tmp/clicfg/ ../
	fi
}


initialize "/cmp/node$ID" cmpd
cd "/cmp/node$ID"
exec supervisord --nodaemon --configuration /etc/supervisor/supervisord.conf