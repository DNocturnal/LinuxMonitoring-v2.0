#!/bin/bash

# 2xx - ok, created, 
# 4xx - bad request, unauthorized, forbidden, not found, 
# 5xx - internal server error, not implemented, bad gateway, service unavailable
# combined format: "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\""
http_status_code=( 200 201 400 401 403 404 500 501 502 503 )
methods=( GET POST PUT PATCH DELETE )
agents=( "Mozilla" "Google Chrome" "Opera" "Safari" "Internet Exploer" "Microsoft Edge" "Crawler and bot" "Library and net tool" )
#1
generate_ip() {
    echo $(( RANDOM % 256 )).$(( RANDOM % 256 )).$(( RANDOM % 256 )).$(( RANDOM % 256 ))
}
#2
generate_code() {
    echo ${http_status_code[$(( RANDOM % 10 ))]}
}
#3
generate_method() {
    echo ${methods[$(( RANDOM % 5 ))]}
}
#6
generate_agents() {
    echo ${agents[$(( RANDOM % 8 ))]}
}
#5
generate_url() {
    echo "http://google.com/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)"
}
create_log() {
    for j in {1..5}
    do 
        local count_entries=$(( RANDOM % 901 + 100 ))
        for (( i=1; i<=count_entries; i++ ))
        do
            local ip=$(generate_ip)
            local code=$(generate_code)
            local method=$(generate_method)
            local date=$(date +"%d/%b/%Y:%H:%M:%S %z" -d "+$j day")
            local url=$(generate_url)
            local user_agent=$(generate_agents)
            local current_date=${date[$((j-1))]}
            local log="$ip - - [$date] \"$method $url HTTP/1.1\" $code 0 \"-\" \"$user_agent\""
             
            echo $log >> access_log$j.log
        done
    done
}

create_log