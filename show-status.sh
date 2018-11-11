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
    ./check-router.sh "$ip" &
    pids[index]=`$!`
done

for index in ${!ips[*]}; do
    ip="${ips[$index]}"
    pid="${pids[$index]}"
    wait $pid
    status="$?"
    if [ "$status" == "0" ]; then
        echo -en "${GREEN}$ip${NC} "
    else
        echo -en "${RED}$ip${NC} "
    fi
done

wait # wait at least one second

echo

