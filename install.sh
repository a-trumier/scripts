#!/bin/bash

# check if this is run as root first
if [[ $EUID -ne 0 ]]; then
    echo "Error: Must be run as root" 
    exit 1
fi

VERBOSE=0
PLACE_DIR="/usr/bin"
CLEAN=0

while [ $(($#)) -ne 0 ]; do
    case $1 in
        "--verbose" | "-v")
            VERBOSE=1
            shift;;
        "--place-dir" | "-p")
            shift
            PLACE_DIR=$1
            shift;;
        "--clean" | "-c")
            CLEAN=1
            shift;;
        "--help" | "-h")
            echo "See README.md for help."
            exit 0;;
        *)
            echo "Error: Invalid flag $1"
            exit 1;;
    esac
done

echo "Starting..."

if [ $((VERBOSE)) -eq 1 ]; then
    if [ $((CLEAN)) -eq 1 ]; then
        echo "Starting clean..."
    else
        echo "Starting copy..."
    fi
fi

FILES=`ls`


for f in $FILES; do
    if [ -f $f ]; then
        SUFFIX=`echo $f | tail -c 4`
        if [ $SUFFIX == ".sh" -a $f != "make_symlinks.sh" ]; then
            SIZE=${#f}

            if [ $((CLEAN)) -eq 1 ]; then
                if [ $((VERBOSE)) -eq 1 ]; then
                    echo rm -f $PLACE_DIR/${f: 0: $((SIZE)) - 3}
                fi
                rm -f $PLACE_DIR/${f: 0: $((SIZE)) - 3}
            else
                if [ $((VERBOSE)) -eq 1 ]; then
                    echo cp $f $PLACE_DIR/${f: 0: $((SIZE)) - 3}
                fi
                cp $f $PLACE_DIR/${f: 0: $((SIZE)) - 3}
                chmod a+rx $PLACE_DIR/${f: 0: $((SIZE)) - 3}
            fi
        fi
    fi
done

echo "Complete."
