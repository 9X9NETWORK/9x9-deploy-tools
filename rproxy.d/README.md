(NOT TESTED!) rproxy configuration maker
================================

To make ***rproxy*** configuration easier and modulized.

*   rproxy.***{module}***.conf  
    Modullized rproxy configurations.
*   apps.***{appName}***.conf  
    Private label apps related configurations.

NOTE:

> If this is the firt time to ***make install***,
> please don't forget to backup the original **rproxy** copy.

Installation
--------------------------------

    :::bash
    make clean
    make
    make install

for beagle site:

    :::bash
    make beagle install

