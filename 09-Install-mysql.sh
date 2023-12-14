#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 #you can give other than 0
else
    echo "You are in root user"
fi

yum install mysql -y 