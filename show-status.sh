#!/bin/bash

cd "`dirname \"$0\"`"

sleep 1 & # wait at least one second

# color codes from https://stackoverflow.com/a/5947802
RED='\033[0;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

ips=(`cat ips.txt`)
pids=()

for index in ${!ips[*]}; do
    ip="${ips[$index]}"
    (
        ./check-router.sh "$ip" &>>/dev/null 
    ) &
    pids[$index]=$!
done

for index in ${!ips[*]}; do
    ip="${ips[$index]}"
    short_ip="`echo "$ip" | grep -oE '[0-9]+\.[0-9]+$'`"
    pid="${pids[$index]}"
    if wait $pid; then
        echo -en "${GREEN}$short_ip${NC} "
    else
        echo -en "${RED}$short_ip${NC} "
    fi
done

wait # wait at least one second

echo

