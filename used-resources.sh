#!/bin/bash
# Author: Mukul Dharwadkar
# Date: Dec 10 2019.
# Used to monitor disk space and memory utilization of an EC2 instance.

LOGFILE=/home/ec2-user/data/logs/monitoring.log
INST=$(/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id) > /dev/null 2>&1
USEDMEMORY=$(/bin/free -m | awk 'NR==2{printf "%.2f\t", $3*100/$2 }')
USEDDISK=$(/bin/df -m | awk 'NR==6{printf "%.1f\t", $5}')
aws cloudwatch put-metric-data --metric-name memory-usage --dimensions Instance=$INST --namespace "Custom: Utilization" --value $USEDMEMORY
aws cloudwatch put-metric-data --metric-name disk-usage --dimensions Instance=$INST --namespace "Custom: Utilization" --value $USEDDISK
