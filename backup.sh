#!/bin/bash
# Alex Trumier <adtrumier@gmail.com>

if [ $# -ne 4 ]; then
    echo "Usage: backup <local directory> <user> <ip address of backup server> <backup directory>"
    exit 1
fi

EXCLUDE_DIRS='--exclude=".mozilla" --exclude=".cache" --exclude=".cargo" --exclude=".config/Code" --exclude="private_libraries" --exclude="common"'

EXTEND=$2@$3:$4

rsync $EXCLUDE_DIRS -aXSAUH --progress --preallocate $1 $EXTEND
