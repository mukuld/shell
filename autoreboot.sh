#!/usr/bin/zsh
LOGDIR=/home/mukul/Documents/logs/shell
LOGFILE1=autoreboot-update.log
LOGFILE2=autoreboot-upgrade.log

# Automatically pull down updates from APT repositories and answer yes to all questions.
# Automatically upgrade the pulled down packages and answer yes to all questions.
# Once complete, reboot the system everyday at 4 am local time.

/usr/bin/apt update -y >> $LOGDIR/$LOGFILE1 && /usr/bin/apt upgrade -y >> $LOGDIR/$LOGFILE2 && /usr/sbin/shutdown -r


