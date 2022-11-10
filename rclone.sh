#!/bin/bash

#this file use to know are this f** process is running
PIDFILE="/home/beny.putra/rclonebackup.pid"

#if yes this script will be assasinated
[[ -s $PIDFILE ]] && exit

#if not running, we will wake the script and order it to running
echo $BASHPID > $PIDFILE

#Now add rclone command in this line
/usr/bin/rclone sync --progress 1_driveme: 3_drivekume:
/usr/bin/rclone sync --progress 3_drivekume: 2_onedrive:

#then we'll need to remove PIDFILE
rm $PIDFILE

