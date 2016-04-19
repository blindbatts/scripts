#!/bin/bash

pidof  node >/dev/null
if [[ $? -ne 0 ]] ; then
        echo "Restarting UnityCacheServer:     $(date)" >> /var/log/unitycache.txt
        /cache/CacheServer/start.sh &
fi
