#!/bin/bash
# update_flipr6.sh: Update flipr6 website from bitbucket

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

GIT_HOME=git@bitbucket.org:9x9group/flipr6.git
FLIPR6_HOME=/var/www/9x9/flipr6

if [ -d "$FLIPR6_HOME/.git" ]; then
	cd $FLIPR6_HOME
	git pull $GIT_HOME
else
	rm -rf $FLIPR6_HOME
	git clone $GIT_HOME $FLIPR6_HOME
fi

