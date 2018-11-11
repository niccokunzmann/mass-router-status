#!/bin/bash

cd "`dirname \"$0\"`"

for ip in `cat ips.txt`; do
    ssh-keygen -R $ip
    ssh-keyscan $ip 2>>/dev/null >>~/.ssh/known_hosts
done

