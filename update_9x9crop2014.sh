#!/bin/bash
# update_9x9crop2014.sh: Update flipr.tv corp site
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

CORP_HOME=/var/www/9x9/9x9crop2014
CORP_GIT=git@bitbucket.org:9x9group/9x9crop2014.git

[ ! -d "$CORP_HOME/.git" ] && rm -rf $CORP_HOME && git clone $CORP_GIT $CORP_HOME

cd $CORP_HOME
git pull


