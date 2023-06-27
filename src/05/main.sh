#!/bin/bash

for i in {1..5}
do
   rm -rf access_log$i.log Request_Code_$i.log Select_Error_$i.log Unique_IP_$i.log IP_Select_Error_$i.log
done

if [ $# -ne 1 ] || [ $1 -gt 4 ] || [ $1-lt 1 ]; then 
    echo -e '\033[35mError! Input './main.sh x' 
        \033[31mwhere x in {1..4}'
    exit 1
fi

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
        awk ' {print $1}' access_log$i.log | sort -u >> Unique_IP_$i.log
    done 
}

uniq_ip_error() {
    for i in {1..5}
    do
        awk '$9 ~ /^4/ || $9 ~ /^5/ {print $1}' access_log$i.log | sort -u >> IP_Select_Error_$i.log
    done 
} 

if [ $1 -eq 1 ]; then
    request_code
elif [ $1 -eq 2 ]; then 
    uniq_ip
elif [ $1 -eq 3 ]; then 
    select_error
elif [ $1 -eq 4 ]; then 
    uniq_ip_error
fi

for i in {1..5}
do
    rm -rf access_log$i.log
done 