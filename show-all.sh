#!/bin/bash
#
# Arguments:
# - no arguments: ping and ssh
# - ssh: route to Internet exists
# - ping: router can be pinged
#

cd "`dirname \"$0\"`"

while true; do
    echo -n `date '+%H:%0M:%0S'`" "
    ./show-status.sh "$@"
done

