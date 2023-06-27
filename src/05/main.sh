#!/bin/bash

# Все уникальные IP, встречающиеся в записях

# Все уникальные IP, которые встречаются среди ошибочных запросов

./../04/main.sh

request_code() {
    for i in {1..5}
    do
        awk '{print $0}' access_log$i.log | sort -k9 >> Request_Code_$i.log
    done 
}

select_error() {
    for i in {1..5}
    do
        awk '$9 ~ /^4/ || $9 ~ /^5/ {print $0}' access_log$i.log >> Select_Error_$i.log
    done 
}

uniq_ip() {
    for i in {1..5}
    do
        awk '{print $1}' access_log$i.log >> Unique_IP_$i.log
    done 
}
uniq_ip
# uniq_ip_error() {

# } 

# if [ $1 -eq 1]; then
#     request_code
# elif [ $1 -eq 2 ]; then 
#     uniq_ip
# elif [ $1 -eq 3 ]; then 
#     select_error
# elif [ $1 -eq 4 ]; then 
#     uniq_ip_error
# else
#     echo "Error $1 parametr! Select 1, 2, 3 or 4"
# fi
