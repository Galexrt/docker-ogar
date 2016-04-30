#!/bin/bash

DATA_PATH=/data

if [ ! -z "$SERVER_PORT" ]; then
    sed -i 's/serverPort = .*$/serverPort = '"$SERVER_PORT"'/g' "$DATA_PATH/gameserver.ini"
fi
if [ ! -z "$SERVER_GAMEMODE" ]; then
    if [[ "$SERVER_GAMEMODE" == "0" && "$SERVER_GAMEMODE" == "1" ]]; then
        echo "SERVER_GAMEMODE is invalid, defaulting to 0"
        SERVER_GAMEMODE="0"
    fi
    sed -i 's/serverGamemode = .*$/serverGamemode = '"$SERVER_GAMEMODE"'/g' "$DATA_PATH/gameserver.ini"
fi
if [ ! -z "$SERVER_BOTS" ]; then
    sed -i 's/serverPort = .*$/serverPort = '"$SERVER_BOTS"'/g' "$DATA_PATH/gameserver.ini"
fi
if [ ! -z "$SERVER_BOTS" ]; then
    sed -i 's/serverPort = .*$/serverPort = '"$SERVER_BOTS"'/g' "$DATA_PATH/gameserver.ini"
fi

echo "$DATA_PATH"

node "$DATA_PATH/src/index.js"
