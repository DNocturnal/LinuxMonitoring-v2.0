#!/bin/bash

if [ $1 -ne 1 ]; then 
 echo -e '\033[35mError! Input './main.sh 1', the three remaining log files will be generated automatically! '
 exit 1
fi   
    source ../05/main.sh

    uniq_ip
    select_error
    uniq_ip_error


sudo goaccess access*.log --log-format=COMBINED --real-time-html -o all_stats.html
