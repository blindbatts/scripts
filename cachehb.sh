#!/bin/bash
adminmail=edit@me.com
subject="UnityCacheServer Restarted!"
log=/var/log/unitycache.log

pidof  node6 >/dev/null
if [[ $? -ne 0 ]] ; then
        echo "Restarting UnityCacheServer:     $(date)" >> $log
        /cache/CacheServer/start.sh &
fi

cat $log | mailx -s "$subject" "$adminmail"
exit 0



