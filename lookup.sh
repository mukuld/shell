#!/bin/bash
#################################################################
#   Written by: Mukul Dharwadkar                                #
#   Original Date: 1 November 2010                              #
#   Version No.: 1                                              #
#   Modified on: 		                                		#
#   Purpose: Script to read a file line by line to create an    #
#            array for application & pass each item of the  	#
#            array as a parameter for a function. 	            #
#   Modification Log:                                           #
#################################################################

FILE=HOST_LIST.txt
FILE_PATH=~/Documents/workspace/src/shell
DNS_HOST=17.128.100.12
OUTPUT_FILE=LOOKUP_RESULT.txt
declare -a appArray
export HOST_NAME
i=0
#num=`cat $FILE | wc -l`
# Populate the array with each element of the file
while read line
do
#	echo "i = $i"
#	echo "line = $line"
	appArray[$i]=$line
#	echo "appArray row = ${appArray[$i]}"
	((i++))
done < $FILE_PATH/$FILE
len=${#appArray[*]}
#echo $len
j=0
echo "" > $FILE_PATH/$OUTPUT_FILE
while [ $j -lt $len ]; do
	IP=`nslookup ${appArray[$j]} $DNS_HOST | grep Address | sed 1d | awk '{print $2}'`
	echo ${appArray[$j]},$IP >> $FILE_PATH/$OUTPUT_FILE
#	echo "";	
    let j++
done
cat $FILE_PATH/$OUTPUT_FILE
