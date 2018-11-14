#!/bin/bash

cd "`dirname \"$0\"`"

for ip in `cat ips.txt`; do
    if ping -c 1 $ip; then
        echo "updated $ip"
        ssh-keygen -R $ip
        ssh-keyscan $ip 2>>/dev/null >>~/.ssh/known_hosts
    fi
done

