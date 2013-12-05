#!/bin/bash
# update_ubuntuCrontab.sh: Update crontab content of ubuntu.
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

CRONTAB_CONTENT=/home/ubuntu/bin/ubuntu.crontab
CRONTAB=/var/spool/cron/crontabs/ubuntu

sudo su - -c "cat $CRONTAB_CONTENT > $CRONTAB"
