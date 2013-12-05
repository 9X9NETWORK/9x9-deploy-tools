#!/bin/bash
# update_ubuntuCrontab.sh: Update crontab content of ubuntu.
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

CRONTAB_CONTENT=/home/ubuntu/bin/ubuntu.crontab
CRONTAB=/var/spool/cron/crontabs/ubuntu

# Update crontab
sudo cp -f $CRONTAB_CONTENT  $CRONTAB
sudo chown ubuntu:crontab $CRONTAB
sudo chmod 600 $CRONTAB

