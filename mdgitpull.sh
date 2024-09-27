#!/bin/zsh

HOME=/home/ec2-user/data
LOGDIR=$HOME/logs/shell
WORKDIR=$HOME/www/html5
LOGFILE1=mdgitpull.log
cd $WORKDIR
echo $(date) >> $LOGDIR/$LOGFILE1
sudo git pull >> $LOGDIR/$LOGFILE1
