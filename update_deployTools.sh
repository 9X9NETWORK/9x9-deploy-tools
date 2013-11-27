#!/bin/bash
# initDeploy: Get the latest deploy tools, then run init deploy scripts

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

DEPLOYTOOLS_GIT=git@bitbucket.org:9x9group/deploytools.git
DEPLOYTOOLS_HOME=/home/ubuntu/bin

# Sync the latest deploy tools
git pull $DEPLOYTOOLS_GIT $DEPLOYTOOLS_HOME

