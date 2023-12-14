#/bin/bash

ID=($id -u)

TIMESTAMP=$(date +%F-%H-%M-%S) 

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2...... failed"
        exit 1
    else 
        echo "$2..... is success"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: you are not in to the root user"
    exit 1
else
    echo "you are in root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing Git"