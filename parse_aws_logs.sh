#!/bin/bash

LOCATION=/Users/dharmuku/Documents/temp/demo
EXIT_CODE=$?
FILES=`ls | wc -l`
PATTERN1="/python--backups/"
PATTERN2="S3Console"

#ECHO ${FILES}

for ((i = 0; i < ${FILES}; i++))
do
   FILE_NAME=$(ls | tail -${i} | head -1)
 #  ECHO ${FILE_NAME} 
   grep -i ${PATTERN1} ${LOCATION}/${FILE_NAME} | grep -v ${PATTERN2} > /dev/null 2>&1
   EXIT_CODE=$?
#   ECHO ${EXIT_CODE}
   if [ "${EXIT_CODE}" == 0 ]; then
	echo "This file with name ${FILE_NAME} is using old style S3 buckets..."
   fi
done
