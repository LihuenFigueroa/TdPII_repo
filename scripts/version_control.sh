#!/bin/bash

program_name=git log -1 | sed '5!d' | cut -d " " -f 5,6,7,8,9,10,11,12,13,14,15

cd programs

is_created= find . -type d -name $program_name

if [[ -z $is_created ]]; then
    mkdir "$program_name"

cd $program_name

echo 'funciona xd' > funciona



