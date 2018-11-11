#!/bin/bash

cd "`dirname \"$0\"`"

for ip in `cat ips.txt`;do
    ./check-router.sh "$ip" &
    sleep 0.01
done

sleep 1 &

wait

echo

