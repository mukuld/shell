#!/bin/zsh

HOME=/home/ec2-user/data
LOGDIR=$HOME/logs/shell
WORKDIR=$HOME/www/nandini
LOGFILE1=ndgitpull.log
cd $WORKDIR
echo $(date) >> $LOGDIR/$LOGFILE1
sudo git pull >> $LOGDIR/$LOGFILE1
