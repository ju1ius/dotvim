#! /bin/bash

FUNCTION=`echo $1 | sed 's/_/-/g'`
#chromium-browser file:///home/ju1ius/.vim/doc/php/function.$function.html
chromium-browser http://php.net/$fuNCTION
