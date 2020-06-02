#!/bin/bash

currentCpuLoad=$(uptime | cut -d ',' -f 3 | awk '{print $3}')
cpuThreshold=10.00

echo $currentCpuLoad

if (( ${currentCpuLoad%%.*} > ${cpuThreshold%%.*} || ( ${currentCpuLoad%%.*} == ${cpuThreshold%%.*} && ${currentCpuLoad##*.} > ${cpuThreshold##*.} ) )) ; then    
        echo "Under high load. Restarting apache"
        /usr/sbin/service apache2 restart
        echo "Restarted apache at $(date)" >> /root/restartApache.log
        echo "---------------------"
else
        echo "Load is normal."
fi
