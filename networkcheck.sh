#!/usr/bin/zsh

# Shell script to detect network outage and restart the network
# Date: 13 November 2024
# Programmer: Mukul Dharwadkar

HOST=www.google.com
SYS_PATH=/usr/bin
LOGDIR=/home/mukul/Documents/logs/shell
LOGFILE1=networkcheck.log
CMD=$SYS_PATH/dig
IFACE=wlp3s0
#PRINT_DATE=`echo $(date) >> $LOGDIR/$LOGFILE1`
REPAIR_CMD=$(/usr/sbin/ip link set $IFACE down; /usr/sbin/ip link set $IFACE up)

NETWORKCHECK=`$CMD $HOST | grep -i $HOST | tail -1 | awk '{print $5}'`

if [ -z "$NETWORKCHECK" ];
    then 
        date >> $LOGDIR/$LOGFILE1
        $REPAIR_CMD >> $LOGDIR/$LOGFILE1
        echo "Restarted network to repair connectivity" >> $LOGDIR/$LOGFILE1
else
    date >> $LOGDIR/$LOGFILE1
    echo "All OK" >> $LOGDIR/$LOGFILE1
fi