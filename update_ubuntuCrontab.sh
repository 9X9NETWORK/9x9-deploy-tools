#!/bin/bash
# update_ubuntuCrontab.sh: Update crontab content of ubuntu.
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

CRONTABL_HOME=/var/spool/cron/crontabs
CRONTABL_CONTENT=/home/ubuntu/bin/ubuntu.crontab
CRONTABL=ubuntu

sudo cat $CRONTABL_CONTENT > $CRONTABL_HOME/$CRONTAB
