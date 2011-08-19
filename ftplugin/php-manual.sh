#! /bin/bash

KEYWORD=`echo $1 | sed 's/_/-/g'`
x-www-browser "http://php.net/manual-lookup.php?pattern=$KEYWORD"
