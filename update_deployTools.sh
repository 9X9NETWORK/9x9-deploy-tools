#!/bin/bash
# update_deployTools: Get the latest deploy tools

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

DEPLOYTOOLS_GIT=git@bitbucket.org:9x9group/deploytools.git
DEPLOYTOOLS_HOME=/home/ubuntu/bin

# Sync the latest deploy tools
cd $DEPLOYTOOLS_HOME
git pull $DEPLOYTOOLS_GIT

