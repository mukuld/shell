#!/bin/bash
#################################################################
#   Written by: Mukul Dharwadkar                                #
#   Original Date: 1 November 2010                              #
#   Version No.: 1                                              #
#   Modified on: 		                                #
#   Purpose: Script to read a file line by line & pass the      #
#            read line as a parameter for a function.           #
#   Modification Log:                                           #
#################################################################

FILE="RRS_APP_LIST.txt"
ENV=`whoami`
BASE_PATH="/ngs/app/"$ENV
APP_PATH=$BASE_PATH"/Library/WebObjects/Applications"
PLATFORM=`uname -s`

# Function to read the lines
processLine(){
  line="$@" # get all args
  #  just echo them, but you may need to customize it according to your need
  # for example, F1 will store first field of $line, see readline2 script
  # for more examples
  # F1=$(echo $line | awk '{ print $1 }')
  echo $line
}

# Make sure that the file exists and is readable
if [ ! -f $FILE ]; then
  	echo "$FILE : does not exists"
  	exit 1
   elif [ ! -r $FILE ]; then
  	echo "$FILE: can not read"
  	exit 2
fi

# read $FILE using the file descriptors

BAKIFS=$IFS
#IFS=$(echo -en "\n\b")
exec 3<&0
exec 0<"$FILE"
while read -r line
do
	# use $line variable to process line in processLine() function
	processLine $line
done
exec 0<&3
 
# restore $IFS which was used to determine what the field separators are
IFS=$BAKIFS
exit 0
