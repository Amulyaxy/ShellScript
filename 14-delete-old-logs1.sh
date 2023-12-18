#!/bin/bash

SOURCE_DIR="tmp/shellscript-logd"

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R Source directory: $SOURCE_DIR does not exists. $N"
fi

FILES_TO_DELETE=$(find . -type f -mtime +7 -name "*.log")

while IFS= read -r line
do 
    echo "Deletin file: $line"

done <<< $FILES_TO_DELETE