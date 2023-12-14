#/bin/bash

ID=($id -u)

TIMESTAMP=$(date +%F-%H-%M-%S) 
R="\e[31m"
G="\e[32m"
N="\e[0m"


LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "ERROR:: $2...... $R failed $N installing"
        exit 1
    else 
        echo -e "$2..... is $G success"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: you are not in to the root user $N"
    exit 1
else
    echo -e "$G you are in root user $N"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing Git"