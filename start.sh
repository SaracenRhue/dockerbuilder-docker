#!/bin/bash

apk update && apk upgrade
apk add git wget python3 py3-pip
pip3 install pyyaml

config="./config" # set path

# download config if folder is empty
if [ -z "$(ls -A $config)" ]; then
    cd $config
    https://raw.githubusercontent.com/SaracenRhue/dockerbuilder-docker/main/config/config.yml
    cd ../
fi

chmod 777 $config # set permissions to everyone
sleep 5

python3 ./main.py