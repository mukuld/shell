#!/bin/zsh

HOME=/var/www/html
LOGDIR=/home/mukul/Documents/logs/shell
WORKDIR=$HOME/NewSite
LOGFILE1=newsitegitpull.log
cd $WORKDIR
echo $(date) >> $LOGDIR/$LOGFILE1
#sudo git pull >> $LOGDIR/$LOGFILE1
git pull >> $LOGDIR/$LOGFILE1
