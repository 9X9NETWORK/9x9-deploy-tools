#!/bin/bash

HOST=`hostname`

uptime | curl -X PUT -d @- http://channelwatch.9x9.tv/jstat/j.php?f=$HOST-uptime
free -b | grep Mem | curl -X PUT -d @- http://channelwatch.9x9.tv/jstat/j.php?f=$HOST-free
sudo /usr/bin/jstat -gc -t `sudo cat /var/run/jetty.pid` | grep -v S0C| curl -X PUT -d @- http://channelwatch.9x9.tv/jstat/j.php?f=$HOST-gc
sudo /usr/bin/jstat -gcutil -t `sudo cat /var/run/jetty.pid` | grep -v S0| curl -X PUT -d @- http://channelwatch.9x9.tv/jstat/j.php?f=$HOST-gcutil
