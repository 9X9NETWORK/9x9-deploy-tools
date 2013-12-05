#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

CMS_HOME=/var/www/9x9/cms
CMS_GIT=git@bitbucket.org:9x9group/9x9_cms.git

# Check cms directory
[ ! -d "$CMS_HOME/.git" ] && rm -rf $CMS_HOME && git clone $CMS_GIT $CMS_HOME

# Update cms
cd $CMS_HOME
git pull



