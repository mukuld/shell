#!/bin/bash
NAME=$1
if [ -z $2 ]; then
	LOC="Cupertino"
else
	LOC=$2
fi

#echo "Please enter your name & location"
echo $NAME
echo $LOC