#!/bin/bash
# update_apnsP12.sh: Update these MSOs' p12 files that APNS used.

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

P12_HOME=/var/opt/p12files
P12_GIT=git@bitbucket.org:9x9group/p12files.git

# Check & update p12 files that APNS used
if [ ! -d "$P12_HOME/.git" ]; then
	sudo rm -rf $P12_HOME
	[ ! -d "$(dirname $P12_HOME)" ] && sudo mkdir -p $(dirname $P12_HOME)
	sudo chown ubuntu:ubuntu $(dirname $P12_HOME)
	git clone $P12_GIT $P12_HOME
fi

cd $P12_HOME
git pull

