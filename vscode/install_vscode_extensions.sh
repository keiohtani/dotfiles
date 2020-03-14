#!/bin/bash 
FILE=extensions.txt
BASE_DIR=$(dirname $0)

for i in `cat $BASE_DIR/$FILE`
do
    code --install-extension $i
done
