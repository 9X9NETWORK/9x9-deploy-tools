#!/bin/bash

time=$(date +"%Y%m%d%H%M%S")
jettypid=`sudo cat /var/run/jetty.pid`
sudo -u jetty kill -QUIT $jettypid
#ps -eLo pid,lwp,nlwp,ruser,pcpu,stime,etime,args | grep $jettypid > /mnt/tmp/lwpthread_$time.txt
ps -eLo pcpu,pid,lwp,nlwp,ruser,stime,etime,size,vsize,ucmd --sort=pcpu > /mnt/tmp/${time}_lwpthread.txt
sudo -u jetty /usr/bin/jstack -J-d64 $jettypid > /mnt/tmp/${time}_jstack.txt 2>&1
cp /var/log/jetty/out.log /mnt/tmp/${time}_threaddump.txt


