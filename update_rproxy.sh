#!/bin/bash

echo "===`hostname`==="
date

cd /tmp
rm -f rproxy
wget http://moveout-log.9x9.tv/rproxy/rproxy

if [ -s rproxy ]; then
  sudo cp -p rproxy /etc/apache2/conf.d/
  sudo /etc/init.d/apache2 reload
else
  echo "wget failed"
fi

date
