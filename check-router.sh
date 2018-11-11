#!/bin/bash
cd "`dirname \"$0\"`"

ip="$1"

# color codes from https://stackoverflow.com/a/5947802
RED='\033[0;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

function test-router() {
    ping -c 1 "$ip" 1>&2
}

if test-router; then
    echo -en "${GREEN}$ip${NC} "
else
    echo -en "${RED}$ip${NC} "
fi


