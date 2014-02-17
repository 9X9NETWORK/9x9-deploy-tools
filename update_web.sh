#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

DEST=/var/www/9x9/web
REPO=git@bitbucket.org:9x9group/web-5.0.git

if test ! -d "$DEST/.git"; then
    git clone $REPO $DEST
fi

cd $DEST
git pull

