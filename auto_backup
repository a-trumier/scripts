#!/bin/bash
# Alex Trumier <adtrumier@gmail.com>

source .env

EXCLUDE='--exclude=.mozilla --exclude=.cache --exclude=.cargo --exclude=.config/Code --exclude=private_libraries --exclude=common'

echo rsync $EXCLUDE -aXSAUH --progress --preallocate ~ $IP_AND_DIR

rsync $EXCLUDE -aXSAUH --progress --preallocate ~ $IP_AND_DIR
