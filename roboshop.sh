#!/bin/bash

AMI=ami-03265a0778a880afb
SECURITYGROUP_ID=sg-0abbe9ab46109976d
#REGION=us-east-1
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "cart" "catalogue" "user" "web" "shipping" "payment" "dispatch")

for i in "${INSTANCES[@]}"
do
    echo "instance is: $i"
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    aws ec2 run-instances --image-id ami-03265a0778a880afb --instance-type $INSTANCE_TYPE --security-group-ids  sg-0abbe9ab46109976d --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"

done


