#!/bin/bash
# update_9x9receiver.sh: init & deploy 9x9receiver

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

RECEIVER_HOME=/var/www/9x9/cast
RECEIVER_GIT=git@bitbucket.org:9x9group/9x9_receiver.git


# Check & update receiver local repository 
[ ! -d "$RECEIVER_HOME/.git" ] && rm -rf $RECEIVER_HOME && git clone $RECEIVER_GIT $RECEIVER_HOME

cd $RECEIVER_HOME
git pull
