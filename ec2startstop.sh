#!/bin/bash
ID=i-0c3f6d8c11ebda64c
STATUS=$(aws ec2 describe-instances \--query "Reservations[*].Instances[*]. [State.Name]" --o text)

if [ $STATUS = "running" ]
then
	echo "your instance is running"
else
	echo "starting your instance"
aws ec2 start-instances --instance-ids $ID
fi
