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
REPAIR_CMD() {
    eecho "\nRestarting network interface $IFACE..."
    /usr/sbin/ip link set $IFACE down
    sleep 1
    /usr/sbin/ip link set $IFACE up
    echo "Network interface $IFACE restarted successfully."

}

# Run network check
NETWORKCHECK=$($CMD +short $HOST)

# Log directory check (create if it doesn't exist)
[ ! -d "$LOGDIR" ] && mkdir -p "$LOGDIR"

if [ -z "$NETWORKCHECK" ];
    then     {
        echo "No IP returned for $HOST. Possible network outage detected at $(date)."
        REPAIR_CMD
        echo "Network repair attempt completed at $(date)."
    } >> "$LOGDIR/$LOGFILE1"
else
    echo "Network is OK. $HOST resolved to $NETWORKCHECK at $(date)." >> "$LOGDIR/$LOGFILE1"
fi