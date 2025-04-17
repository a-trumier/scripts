#!/bin/bash

# Script that changes the name of every file in a directory with spaces to the
# same name with underscores.
# Alex Trumier <adtrumier@gmail.com>

if [ $(($#)) -ne 1 ]; then
    echo "Usage: scumbag_destroyer.sh <directory>"
    exit 1
fi

if [ ${1:0:1} != "/" ] | [ ${1:0:1} != "~" ]; then
    PATH_TO_FILES=$PWD/$1
else
    PATH_TO_FILES=$1
fi

FILES=`ls $PATH_TO_FILES -pc -1`
IFS=$'\n'
for x in $FILES; do
    NAME=`echo $x | tr -s " " "_"`
    if [ $x != $NAME ]; then
        echo Renaming $x to $NAME
        mv $PATH_TO_FILES/$x $PATH_TO_FILES/$NAME
    fi
done 
