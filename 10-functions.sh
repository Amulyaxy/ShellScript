#/bin/bash

ID=($id -u) 

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "ERROR:: installation failed"
        exit 1
    else 
        echo "Installation is success"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: you are not in to the root user"
    exit 1
else
    echo "you are in root user"
fi

yum install mysql -y

VALIDATE

yum install git -y

VALIDATE