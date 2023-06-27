#!/bin/bash

# combined format goaccess: %h %^[%d:%t %^] "%r" %s %b
# date: %d/%b/%Y
# time: %H:%M:%S
./../05/main.sh $1
sleep
goaccess -f access_2.log