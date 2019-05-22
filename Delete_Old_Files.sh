#!/bin/bash -x
#===============================================================
#| Written by: Arundev                                          |
#| Original Date: 14th Dec 2010                                 |
#| Version No.: 1                                               |
#| Purpose: This script is intended to delete old back up files |
#|         during deployment and thus keep only the latest      |
#|         three files in Backups folder                        |
#| Usage  : Delete_Old_Files filename                           |
#|                                                              | 
# ==============================================================
DirPath=~/Backups
FileNumKeep=3
export APPNAME=$1
FileNumAll=`ls -ct1 $DirPath | grep $APPNAME | wc -l`
if [ "$FileNumAll" -le "$FileNumKeep" ]; then
echo "Only $FileNumAll Backup files for $APPNAME, so no files deleted !!!"| sed -e 's/[ ][ ]*/ /g'
     exit
fi

FileNumRemove=$(expr $FileNumAll - $FileNumKeep)
ls -ct1 $DirPath | grep $APPNAME | tail -$FileNumRemove | while read File;

do
rm "$DirPath/${File}";
echo "Deleted old file ------->  $File  from Backup folder"
done
echo "Keep Only the latest 3 files"
