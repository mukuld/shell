#!/bin/bash
FILE=RRS_APP_LIST.txt
declare -a appArray
i=0
#num=`cat $FILE | wc -l`
while read line
do
#	echo "i = $i"
#	echo "line = $line"
	appArray[$i]=$line
#	echo "appArray row = ${appArray[$i]}"
	((i++))
done < $FILE
len=${#appArray[*]}
echo $len
j=0
while [ $j -lt $len ]; do
	while true; do
	read -p "Do you wish to install : ${appArray[$j]}? (yes/no)?" yn
     	case $yn in
        	[Yy]* ) 
			echo "Installing App - ${appArray[$j]}"; 
		#	sh iDeploy_RJV.sh ${appArray[$j]} ${VERSION} 
			break;;
        	[Nn]* ) echo "Not Installing App - ${appArray[$j]}"; break;;
        	* ) echo "Please answer yes or no.";;
    	esac
    done
    echo "";	
    let j++
done