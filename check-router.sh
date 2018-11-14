#!/bin/bash
set -e

cd "`dirname \"$0\"`"

export IP="$1"
export PASSWORD="`cat password.txt`"
shift
args="$@"

echo x${args}x

function chosen() {
    echo "$args" | grep "$1" || [ -z "$args" ]
    return $?
}

# check the router status
if chosen ping; then
     ./check-router-ping.sh "$IP"
fi
if chosen ssh; then
    ./check-router-ssh.sh "$IP" "$PASSWORD"
fi
