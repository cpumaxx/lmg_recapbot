#!/bin/bash

## Script to figure out if a given post number and image is a Miku or not

MIKU=$2
POSTNO=$1
GPULAYERS=60

MODEL=/opt/text-generation-webui/models/llava/llava-v1.6-34b.Q4_K_M.gguf
MMPROJ=/opt/text-generation-webui/models/llava/mmproj-model-f16.gguf

curl -s https://i.4cdn.org/g/$MIKU -o /tmp/$MIKU 2>&1 > /dev/null

ISMIKU=`llava-cli -m $MODEL --mmproj $MMPROJ -c 4096 --temp 0.1 -e -p "<|im_start|>system\nAnswer the questions.<|im_end|><|im_start|>user\n<image>\nIs this an image of Hatsune Miku, Hatsune Miku in different clothes, a cosplay of Hatsune Miku or someone appearing with Hatsune Miku's distinguishing features?. Start your answer with Yes or No.<|im_end|><|im_start|>assistant\n" -ngl GPULAYERS --image /tmp/$MIKU 2>&1 | grep -iE '^yes|^no' | tee -a ~/ismiku.log | grep -i "^yes"`

if [ -n "$ISMIKU" ]; then echo -n ">>$POSTNO "; fi

rm /tmp/$MIKU
