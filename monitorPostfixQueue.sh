#!/bin/bash

queueThreshold=1000

queuelength=`/usr/sbin/postqueue -p | tail -n1 | awk '{print $5}'`
queuecount=`echo $queuelength | grep "[0-9]"`
alertEmail="EMAIL_TO_ALERT"


if [ "$queuecount" == "" ]; then
	echo "No mail queue";
elif [ "$queuecount" -gt "$queueThreshold" ]
        echo "$queuelength is above threshold";
	echo "Email threshold exceeded with queue $queuelength on $HOSTNAME" | mail -s "Email threshold exceeded" $alertEmail
else
	echo "Queue is $queuelength";
fi
