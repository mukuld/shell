cat NSConfig |grep App_Server |grep 17 |cut -d'-' -f2 | cut -d'_' -f3 > servicename
cat NSConfig |grep App_Server |grep 17  |cut -d'(' -f2 |cut -d':' -f1 > hosts
cat NSConfig |grep App_Server |grep 17  |cut -d':' -f2 |cut -d')' -f1 |cut -d' ' -f2 > ports
numhosts=`cat hosts|wc -l`
index=1
while [	$index -le $numhosts ]
do
servicename=`tail -$index servicename|head -1`
host=`tail -$index hosts|head -1`
port=`tail -$index ports|head -1`
url=http://$host:$port/WebObjects/$servicename.woa/ra/whoami
name=`curl -m 1 -s $url`
echo $name
if [ `echo $name | wc -m` -lt 5 ]
then 
echo PROBLEM -$servicename $host and $port timed out
index=`expr $index + 1`
elif [ $name == $servicename ]
then
index=`expr $index + 1`
else
echo PROBLEM -$servicename $host and $port says it is $name
index=`expr $index + 1`
fi
done

