#!/bin/bash

config="./config" # set path

# download config if folder is empty
if [ -z "$(ls -A $config)" ]; then
    cd $config
    wget https://raw.githubusercontent.com/SaracenRhue/dockerbuilder-docker/main/config/config.yml
    cd ../
fi

chmod 777 $config # set permissions to everyone
sleep 5