#!/bin/bash
# Alex Trumier <adtrumier@gmail.com>

if [ "$#" -lt 1 ]; then
    echo "Usage: cless <filenames>"
    exit 1
fi

FILELIST=""

while [ $(($#)) -ne 0 ]; do
    if [ ! -f $1 ]; then
        echo "Error: $1 not a file."
        shift
        continue
    fi
    cat $1 | less
    shift
done
