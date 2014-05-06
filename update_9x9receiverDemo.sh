#!/bin/bash
# update_9x9recieverDemo.sh: update cast demo files
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

CAST_DEMO_HOME=/var/www/9x9/cast_demo
CAST_DEMO_S3=s3://cast_demo

[ ! -d "$CAST_DEMO_HOME" ] && mkdir $CAST_DEMO_HOME

s3cmd sync $CAST_DEMO_S3 $CAST_DEMO_HOME
