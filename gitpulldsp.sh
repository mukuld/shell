#!/bin/bash

HOME=/home/ec2-user/data
LOGDIR=$HOME/logs/shell
WORKDIR=$HOME/dilippandit
LOGFILE1=gitpulldsp.log
cd $WORKDIR
echo $(date) >> $LOGDIR/$LOGFILE1
git pull >> $LOGDIR/$LOGFILE1
