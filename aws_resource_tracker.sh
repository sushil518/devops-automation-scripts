#!/bin/bash

############################################

# Author: Sushilkumar
# Date: 19th-Jan-2023
#
# version: v1
# reference : AWS CLI Command Reference
# This script will report the AWS resource usage
############################################

# List s3 buckets

aws s3 ls

# List EC2 Instances
aws ec2 describe-instance

# list Lamba

aws lambda list-functions

# list IAM users
aws iam-users
