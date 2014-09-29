#!/bin/bash
while read line
do
    name=$line
    ip=$(echo "$name" | awk '{ print $1 }')
    con=$(echo "$name" | awk '{ print $2 }')
    content=$(wget ipinfo.io/$ip -q -O -)
    as_name=$(echo $content | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["org"]';)
done < $1
