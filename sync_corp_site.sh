#!/bin/bash

echo "===`hostname`==="
date
cd /var/www/9x9/corp_s3/
s3cmd sync --delete-removed s3://9x9pm/crop_site_demo/ .
date

