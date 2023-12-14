#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 #you can give other than 0
else
    echo "You are in root user"
fi

yum install mysqlhhh -y 

if [ $? -ne 0 ]
then
    echo "ERROR:: my sql is not installed"
    exit 1
else
    echo "Mysql is installed successfully"
fi