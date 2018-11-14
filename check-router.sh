#!/bin/bash
set -e

cd "`dirname \"$0\"`"

export IP="$1"
export PASSWORD="`cat password.txt`"

function chosen() {
    echo "$@" | grep "$1" || [ -z "$1" ]
}

# check the router status
if chosen ping; then
     ./check-router-ping.sh "$IP"
fi
if chosen ssh; then
    ./check-router-ssh.sh "$IP" "$PASSWORD"
fi
