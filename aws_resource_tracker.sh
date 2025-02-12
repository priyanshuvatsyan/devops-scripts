#!/bin/bash

###################
#Author : Priva
#Date 11th feb 25
#this script will report the aws resource usage
#
#resources we are going to track
#aws s3
#aws ec2
#aws Lembda
#aws IAM user
################

set -x

logfile="/home/ubuntu/awsOutput.log"

# list s3 buckets
aws s3 ls >> "$logfile" 2>&1

#list ec2 instances
#aws ec2 describe-instances  #will give all info about the instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> "$logfile" 2>&1

#fetching just the instance ids, the data is in json form and jq is used to get the
#data from json format

#list lembda
aws lambda list-functions >> "$logfile" 2>&1


# list iam user
aws iam list-users >> "$logfile" 2>&1

