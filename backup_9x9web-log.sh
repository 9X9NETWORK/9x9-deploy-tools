#!/bin/bash
# backup_weblog.sh: Backup apache's & jetty's logs

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# Backup jetty logs
s3cmd put /var/log/jetty/$(date -d 'yesterday' +%Y_%m_%d)* s3://9x9web-log/$(hostname)/jetty/

# Backup apache2 logs
cd /var/log/apache2
find . -type f -name 'rproxy*' -newermt $(date -d 'yesterday' +%F) ! -newermt $(date -d 'today' +%F) -exec s3cmd put {} s3://9x9web-log/$(hostname)/apache2/$(date -d 'yesterday' +%F)/ \;

