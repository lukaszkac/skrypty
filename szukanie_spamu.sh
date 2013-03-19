#!/bin/bash
mailq | grep $1 | awk '{print $1}' | grep -E 'nazwa.pl|serwery.pl' | awk -F @ '{print $2}'| awk -F "$1." '{print $2}'|sort | uniq -c |sed -e 's@[[:space:]]*@@'| egrep -v '^[1-9][[:space:]]'
