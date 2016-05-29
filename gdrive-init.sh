#!/usr/bin/env bash

GRIVE=/usr/bin/grive
WATCH="/usr/bin/watch -tn 60"

CONFIG_FILE=/data/.grive

if [ ! -f $CONFIG_FILE ]
then
    $GRIVE -a
fi

$WATCH $GRIVE
