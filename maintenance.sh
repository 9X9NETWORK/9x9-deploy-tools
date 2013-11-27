#!/bin/bash

SERVER_PKG="moveout-log.9x9.tv"
PKGS="root cms mgnt"

function mantainence_on {
  if [ -f /usr/share/jetty/webapps/root/index.jsp ]; then
    echo "Currently in maintainence mode"
    exit 1
  fi

  tempdir=$(mktemp -d)
  cd $tempdir
  
  wget -q http://$SERVER_PKG/updates/maintenance/index.jsp

  for p in $PKGS; do
    sudo mv /usr/share/jetty/webapps/$p.war /usr/share/jetty/webapps/$p.war.mantainence
  done

  sudo mkdir /usr/share/jetty/webapps/root
  sudo mv index.jsp /usr/share/jetty/webapps/root/

  cd
  rm -rf $tempdir
  sudo /etc/init.d/jetty restart

}

function mantainence_off {
  if [ -f /usr/share/jetty/webapps/root.war ]; then
    echo "Currently not in maintainence mode"
    exit 1
  fi

  sudo rm -rf /usr/share/jetty/webapps/root

  FORCE=0
  for p in $PKGS; do
    if [ -f /usr/share/jetty/webapps/$p.war.mantainence ]; then
      sudo mv /usr/share/jetty/webapps/$p.war.mantainence /usr/share/jetty/webapps/$p.war
    else
      FORCE=1
    fi
  done

  if [ "$FORCE" = "1" ]; then
    /home/ubuntu/bin/update_wars.sh force
  else
    sudo /etc/init.d/jetty restart
  fi
}

if [ "$1" = "on" ]; then
  mantainence_on
  exit 0
fi

if [ "$1" = "off" ]; then
  mantainence_off
  exit 0
fi

echo "Usage: $0 on|off"
exit 1


