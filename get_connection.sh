#!/bin/bash
BASEDIR=$(dirname $0)

netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; print "" }' > $BASEDIR/logs.txt
