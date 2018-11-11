#!/bin/bash
set -e

cd "`dirname \"$0\"`"

export IP="$1"
export PASSWORD="`cat password.txt`"

./check-router-ssh.sh "$IP" "$PASSWORD"
#./check-router-ping.sh "$IP"

