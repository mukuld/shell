# Written by Mukul Dharwadkar
# Script to extract primary key and Transaction reference from xml file
#! bin/bash -x

filename="test-1.xml"
declare -i COUNT=`grep "*PAYLOAD" $filename | wc -l`
for (( i=1; i<=$COUNT; i++ ))
do
PRIMARYKEY=`cat $filename|grep "APPSEQNO"|sed "s/.*$APPSEQNO\$ ://"| sed "s/APPSPECIFICINFO .*::\ //"|head -$i|tail -1`
TRAN_REF=`cat $filename|grep "ZVANTREF" | cut -d "<" -f68 | cut -d ">" -f2|head -$i|tail -1`

echo $PRIMARYKEY, $TRAN_REF 
#echo "Primary key is: "$PRIMARYKEY
#echo "TranRef is: "$TRAN_REF
done 
