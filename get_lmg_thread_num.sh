#!/bin/bash
curl -s https://a.4cdn.org/g/catalog.json | jq "[.[].threads[] | {no: .no?, sub: .sub?}]"  | grep -B1 "lmg" | grep no | head -2 | tail -1 | cut -d":" -f2 | tr -dc '0-9'
