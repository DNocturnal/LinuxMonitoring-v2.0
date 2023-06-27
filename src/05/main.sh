#!/bin/bash

rm -rf access*.log Request_Code.log Select_Error.log Unique_IP.log IP_Select_Error.log

if [ $# -ne 1 ] || [ $1 -gt 4 ] || [ $1 -lt 1 ]; then 
    echo -e '\033[35mError! Input './main.sh x' 
        \033[31mwhere x in {1..4}'
    exit 1
fi

./../04/main.sh
files=($(find . -type f -name '*access*' -printf '%p\n'))

request_code() {
    awk '{print $0}' "${files[@]}" | sort -k9 >> Request_Code.log
}

select_error() {
    awk '$9 ~ /^4/ || $9 ~ /^5/ {print $0}' "${files[@]}" >> Select_Error.log
}

uniq_ip() {
    awk '{print $1}' "${files[@]}" | sort -u >> Unique_IP.log
}

uniq_ip_error() {
    awk '$9 ~ /^4/ || $9 ~ /^5/ {print $1}' "${files[@]}" | sort -u >> IP_Select_Error.log
} 

case "$1" in
1)
    request_code ;;
2)
    uniq_ip ;;
3)
    select_error ;;
4)
    uniq_ip_error ;;
esac

