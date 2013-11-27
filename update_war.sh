#!/bin/bash

# get current version
if [ "$1" = "force" ]; then
  v0=0.0.0
else
  v0=`cat /usr/share/jetty/webapps/version`
fi

# get version from update server
v1=`wget -qO- http://moveout-log.9x9.tv/updates/version`

if [ "$v1" = "" ]; then
  echo "Cannot get version from server"
  exit 1
fi

if [ "$v1" = "$v0" ]; then
  echo "Same version: $v1"
  exit 0
fi

tempdir=$(mktemp -d)
#echo $tempdir

cd $tempdir
wget -q http://moveout-log.9x9.tv/updates/$v1/root.md5
wget -q http://moveout-log.9x9.tv/updates/$v1/root.war

if md5sum --status -c root.md5; then
  echo "Checksum verified"
  sudo /etc/init.d/monit stop
  sudo /etc/init.d/jetty stop
  sudo cp -p root.* /usr/share/jetty/webapps/
  sudo /etc/init.d/jetty start
  sleep 1
  sudo /etc/init.d/jetty status
  sudo /etc/init.d/monit start
  sudo sh -c "echo $v1 > /usr/share/jetty/webapps/version"
  echo "Update completed"
else
  echo "Checksum failed"
fi 

cd
rm -rf $tempdir


