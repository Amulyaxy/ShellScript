#!/bin/bash

AMI=ami-03265a0778a880afb
SECURITYGROUP_ID=sg-0abbe9ab46109976d
#REGION=us-east-1
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "cart" "catalogue" "user" "web" "shipping" "payment" "dispatch")
ZONE_ID=Z04066242LG1OKYDJUBEZ
DOMAIN_NAME="awsdevops.website"

for i in "${INSTANCES[@]}"
do
    echo "instance is: $i"
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    aws ec2 run-instances --image-id ami-03265a0778a880afb --instance-type $INSTANCE_TYPE --security-group-ids  sg-0abbe9ab46109976d --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text
    echo "$i: $IP_ADDRESS"



#Create route 53 record make sure delete exisiting records
aws route53 change-resource-record-sets \
    --hosted-zone-id $ZONE_ID \
    --change-batch '
    {
        "Comment": "Creating a record set for cognito endpoint"
        ,"Changes": [{
        "Action"              : "CREATE"
        ,"ResourceRecordSet"  : {
            "Name"              : "'$i'.'$DOMAIN_NAME'"
            ,"Type"             : "A"
            ,"TTL"              : 1
            ,"ResourceRecords"  : [{
                "Value"         : "'$IP_ADDRESS'"
            }]
        }
        }]
    }
        '
done


