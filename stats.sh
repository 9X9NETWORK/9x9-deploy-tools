#!/bin/bash -x

jettypid=`sudo cat /var/run/jetty.pid`
BASH_XTRACEFD=1
date
sudo jstat -gc $jettypid 200 5
sudo jstat -gccause $jettypid 200 5
sudo jmap $jettypid 
#sudo jmap -finalizerinfo $jettypid
ps --sort=pcpu -eLo pcpu,pid,lwp,nlwp,ruser,stime,etime,size,vsize,ucmd
sudo -u jetty /usr/bin/jstack -J-d64 $jettypid
top -Hbn2
vmstat
iostat
sudo netstat -nap
echo
