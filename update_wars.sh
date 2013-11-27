#!/bin/bash

PKG_SERVER="moveout-log.9x9.tv"
PKGS="root cms mgnt"

ERROR="OK"

tempdir=$(mktemp -d)
cd $tempdir

for p in $PKGS; do
  # get current version
  if [ "$1" = "force" ]; then
    v0=0.0.0
  else
    v0=`cat /usr/share/jetty/webapps/$p.version`
  fi
  
  # get version from update server
  v1=`wget -qO- http://$PKG_SERVER/updates/$p/version`
  
  if [ "$v1" = "" ]; then
    #echo "Cannot get version from server for $p"
    ERROR="Cannot get version from server for $p"
    break
  fi
  
  if [ "$v1" = "$v0" ]; then
    echo "Same version for $p: $v1 - no update for $p"
    continue
  fi
  
  #echo $tempdir
  
  wget -q http://$PKG_SERVER/updates/$p/$v1/$p.md5
  wget -q http://$PKG_SERVER/updates/$p/$v1/$p.war
  
  if md5sum --status -c $p.md5; then
    echo "Checksum verified for $p"
    echo $v1 > $p.version
  else
    #echo "Checksum failed for $p"
    ERROR="Checksum failed for $p"
    break
  fi 
  
done

if [ "$ERROR" = "OK" ]; then
    sudo /etc/init.d/monit stop
    sudo /etc/init.d/jetty stop
    sudo cp -p * /usr/share/jetty/webapps/
    sudo /etc/init.d/jetty start
    sleep 1
    sudo /etc/init.d/jetty status
    sudo /etc/init.d/monit start
fi

cd
rm -rf $tempdir
echo $ERROR

