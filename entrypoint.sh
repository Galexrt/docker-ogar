#!/bin/bash

if [ "$DEBUG" == "True" ] || [ "$DEBUG" == "true" ]; then
    set -xe
    sed -i 's/LogLevel.*/LogLevel = 10/g' "$SINUS_DIR/config.ini"
fi

CONFIG="$DATA_PATH/"

settingsConfiguration() {
    given_settings=($(env | sed -n -r "s/SETTING_([0-9A-Za-z_]*).*/\1/p"))
    for setting_key in "${given_settings[@]}"; do
        key="SETTING_$setting_key"
        setting_var="${!key}"
        if [ -z "$setting_var" ]; then
            echo "Empty var for key \"$setting_key\"."
            continue
        fi
		set +ex
		sed -i 's/'"$setting_key"' =.*/'"$setting_key"' = '"$setting_var"'/' "$CONFIG"
		if (( $? > 0 )); then
        	echo "$setting_key = $setting_var" >> "$CONFIG"
		fi
        echo "Added \"$setting_key\" (value \"$setting_var\") to gameserver.ini"
    done
}

settingsConfiguration

cd "$DATA_PATH" || { echo "Can't access the data path \"$DATA_PATH\""; exit 1; }

node "$DATA_PATH/src/index.js"
