#! /bin/bash

KEYWORD=`echo $1 | sed 's/_/-/g'`
x-www-browser "http://docs.python.org/search.html?q=$KEYWORD"
