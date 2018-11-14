#!/bin/bash
cd "`dirname \"$0\"`"

while true; do
    echo -n `date '+%H:%0M:%0S'`" "
    ./show-status.sh "$@"
done

