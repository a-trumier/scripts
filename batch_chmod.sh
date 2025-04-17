#!/bin/bash

# Simple bash program to change all files in a directory with an extension to 
# the modstring specified. Can either be in octal or u+x format.
# Alex Trumier <adtrumier@gmail.com>

if [ $(($#)) -ne 3 ]; then
    echo "Usage: batch_chmod <directory> <suffix> <new mode>"
    exit 1
fi

if [ ${1:0:1} != "/" ] | [ ${1:0:1} != "~" ]; then
    PATH_TO_FILES=$PWD/$1
else
    PATH_TO_FILES=$1
fi

STUFF=`ls $PATH_TO_FILES -pc -1`
SIZE_OF_SUFF=${#2}

for x in $STUFF; do
    SUFF=`echo $x | tail -c $((SIZE_OF_SUFF + 1))`
    if [ $SUFF == $2 ]; then
        echo Changing $x modstring to $3
        chmod $3 $x
    fi
done
