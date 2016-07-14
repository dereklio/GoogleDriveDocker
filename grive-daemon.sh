#!/usr/bin/env bash

export TERM=xterm

cd $CONFIG_DIR

GRIVE="/usr/bin/grive -p $SYNC_DIR"
FLAG=/tmp/grive.flag

while true
do
    if [ ! -f $CONFIG_DIR/.grive ]
    then
        if [ ! -f $FLAG ]
        then
            touch $FLAG
            echo Please run the following command to sign in to Google Drive
            echo docker exec -it DOCKER_IMAGE_NAME auth
        fi
    else
        $GRIVE
    fi

    sleep $GRIVE_SYNC_INTERVAL
done
