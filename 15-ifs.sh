#!/bin/bash

file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"


if [ ! -f $SOURCE_DIR ]
then
    echo -e "$R Source directory: $SOURCE_DIR does not exists. $N"
fi

while IFS=":" read -r f1 f2 f3 f4 f5 f6 
do
    echo "f1: $f1"
    echo "f2: $f2"
    echo "f3: $f3"
    echo "f4: $f4"
    echo "f5: $f5"
    echo "f6: $f6"
done < $file