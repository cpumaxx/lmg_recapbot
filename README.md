# Project Title

lmg recap bot

## Description

4chan /g/lmg thread recap bot. Just a bunch of shell scripts tying together llama.cpp tools and common unix utilities

## Getting Started

### Dependencies

llama.cpp compiled main and llava-cli binaries in path

Local models for inference and visual identification

jq

curl

perl with HTML::Entitites

grep/sed/cut/tr/xargs/etc

### Installing

Put all the files from this repo anywhere you have rw access

It'll download the temporary pics into the cwd

make sure you download the llama.cpp and llava GGUFs of your choice and tweak the cli parameters in the scripts

this project has only been tested with the ones in the scripts

Help with any of the llama/llava bits is beyond the scope of this project

### Executing program

./run_recap_bot.sh

## Authors

Contributors names and contact info

cpumaxx anon

## Version History

* 0.1
    * Initial Release

## License

This project is licensed under the AGPL3.0 github repo nao License
