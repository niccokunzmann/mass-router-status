#!/bin/bash
cd "`dirname \"$0\"`"

ip="$1"

ping -c 1 "$ip" 1>&2


