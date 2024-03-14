#!/bin/bash

echo; echo
echo -n "--Miku (free space): "
curl -s https://a.4cdn.org/g/thread/$1.json | jq -c '.posts[] | { "no" : .no, "tim" : .tim, "ext" : .ext } | select( .tim != null )' | sed 's/{"no"://g' | sed 's/"tim"://g' | sed 's/,"ext":"//g' | sed 's/"}//g' | tr ',' ' '  | xargs -n2 /usr/local/bin/ismiku.sh
echo

