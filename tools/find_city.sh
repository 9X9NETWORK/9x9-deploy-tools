#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 log_file"
  exit
fi

log=$1

DIR=`dirname $0`

cat $log | awk '{print $1}' | sort | grep -v "^-"| uniq -c | $DIR/geocity.php 
