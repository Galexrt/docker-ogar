#!/bin/bash

settingsConfiguration() {
    given_settings=($(env | sed -n -r "s/SETTING_([0-9A-Za-z_]*).*/\1/p"))
    for setting_key in "${given_settings[@]}"; do
        key="SETTING_$setting_key"
        setting_var="${!key}"
        if [ -z "$setting_var" ]; then
            echo "Empty var for key \"$setting_key\"."
            continue
        fi
        echo "$setting_key = $setting_var" >> /healthchecks/hc/settings.py
        echo "Added \"$setting_key\" (value \"$setting_var\") to settings.py"
    done
}

settingsConfiguration

cd "$DATA_PATH" || { echo "Can't access the data path \"$DATA_PATH\""; exit 1; }

node "$DATA_PATH/src/index.js"
