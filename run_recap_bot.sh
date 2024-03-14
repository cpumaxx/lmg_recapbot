#!/bin/bash

## Main script to create a recap

echo "►Recent Highlights from the Previous Thread: `./get_lmg_thread_old_num.sh`" | tee -a  ~/lmg_recap.log

THREAD=`./get_lmg_thread_num.sh`
MODEL=/opt/text-generation-webui/models/miqu-70b-q5/miqu-1-70b.q5_K_M.gguf

cp ./thread_summary.prompt /tmp/thread.json

curl -s https://a.4cdn.org/g/thread/$THREAD.json | jq '[.posts[] | { "no" : .no, "com" : .com }][2:999]' | sed 's/".*ecap.*"/"com": ""/g' | sed 's/".*Recent Highlights.*"/"com": ""/g' | jq . -cr | sed "s/<br>/ /g" | perl -MHTML::Entities -pe 'decode_entities($_);' | perl -pe 's{\n}{ }g' | perl -pe 's{>}{>\n}g' | perl -pe 's{<}{\n<}g' | grep -v '<' | grep -v '^\s*$' |  tr -d "\n" >> /tmp/thread.json

/usr/src/llama.cpp.master_clean/main --log-disable --log-file /tmp/recapbot.log -m $MODEL --no-display-prompt -c 32768 -t 55 -f /tmp/thread.json 2>/dev/null | tee -a ~/lmg_recap.log

rm /tmp/thread.json

./get_lmg_thread_mikus.sh $THREAD | tee -a ~/lmg_recap.log
