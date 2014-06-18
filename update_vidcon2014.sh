#!/bin/bash
# update_vidcon2014.sh: Update vidcon2014 website from bitbucket

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

GIT_HOME=git@bitbucket.org:9x9group/vidcon2014.git
VIDCON2014_HOME=/var/www/9x9/vidcon2014

# If vidcon2014/.git doesn't exist, clone it. Else update it.
if [ -d "$VIDCON2014_HOME/.git" ]; then
	cd $VIDCON2014_HOME
	git pull $GIT_HOME 
else
	rm -rf $VIDCON2014_HOME
 	git clone $GIT_HOME $VIDCON2014_HOME
fi



