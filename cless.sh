#!/bin/bash
# Alex Trumier <adtrumier@gmail.com>

if [ "$#" -ne 1 ]; then
    echo "Usage: cless <filename>"
    exit 1
fi

if [ ! -f $1 ]; then
    echo "Error: Given argument is not a file."
    exit
fi

cat $1 | less
