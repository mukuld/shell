# Written by Mukul Dharwadkar
# Script to extract primary key and Transaction reference from xml file
#! bin/bash -x

filename="test.xml"

PRIMARYKEY=`cat $filename|grep "APPSEQNO"|sed "s/.*$APPSEQNO\$ ://"| sed "s/APPSPECIFICINFO .*::\ //"`
TRAN_REF=`cat $filename|grep "ZVANTREF" | cut -d "<" -f68 | cut -d ">" -f2`

echo $PRIMARYKEY, $TRAN_REF 
#echo "Primary key is: "$PRIMARYKEY
#echo "TranRef is: "$TRAN_REF 
