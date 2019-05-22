#!/bin/bash
echo "Please select the system in which you want to log in:
      BZ Production primary	: 1
      BZ Production secondary	: 2
      Corp Production primary	: 3
      Corp Production seconday	: 4
      BZ UAT			: 5
      Corp UAT			: 6
      Exit			: 0"
read inp
#ECHO Logging in to BZ Production NS 17.151.47.12
#ssh concierge:823apple@17.151.47.12

if [ $inp -eq 1 ]
then
echo "Logging in to BZ Production primary system"
ssh concierge@17.151.47.12
elif [ $inp -eq 2 ]
then
echo "Logging in to BZ Production secondary system"
ssh concierge@17.151.47.11
elif [ $inp -eq 3 ]
then
echo "Logging in to Corp Production primary system"
ssh retail@17.34.104.11
elif [ $inp -eq "4" ]
then
echo "Logging in to Corp Production secondary system"
ssh retail@17.34.104.10
elif [ $inp -eq "5" ]
then
echo "Logging in to BZ UAT system"
ssh retail@17.112.168.5
elif [ $inp -eq "6" ]
then
echo "Logging in to Corp UAT system"
ssh retail@17.108.43.7
elif [ $inp -eq "0" ]
then
echo "Exiting..."
else
echo "Incorrect input"
fi
