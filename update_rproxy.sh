#!/bin/bash

CWD=$(dirname "$(readlink -f "$0")")

echo "===`hostname`==="
date

source "$CWD/update_deployTools.sh"

cd "$CWD/rproxy.d"
make clean install

date

