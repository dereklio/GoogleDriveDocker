#!/usr/bin/env bash

export TERM=xterm

cd $CONFIG_DIR

GRIVE="/usr/bin/grive -p $SYNC_DIR"

$GRIVE -a
