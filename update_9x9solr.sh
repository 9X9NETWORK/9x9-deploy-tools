#!/bin/bash
# update_solr.sh: Update solr config

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

SOLR_HOME=/usr/share/solr
SOLR_GIT=git@bitbucket.org:9x9group/9x9_solr.git

[ ! -d "$SOLR_HOME/.git" ] && sudo rm -rf $SOLR_HOME && sudo mkdir -p $SOLR_HOME && sudo chown ubuntu:ubuntu $SOLR_HOME && git clone $SOLR_GIT $SOLR_HOME

cd $SOLR_HOME
git pull

sudo /etc/init.d/jetty restart

