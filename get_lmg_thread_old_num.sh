#!/bin/bash
curl -s https://a.4cdn.org/g/catalog.json | jq "[.[].threads[] | {no: .no?, sub: .sub?}]"  | grep -B1 "lmg" | grep no |  cut -d":" -f2 | tr -d ' ,' | xargs -I{} echo -n " >>{}"
