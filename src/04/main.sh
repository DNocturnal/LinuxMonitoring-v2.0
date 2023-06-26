#!bin/bash

# 2xx - ok, created, 
# 4xx - bad request, unauthorized, forbidden, not found, 
# 5xx - internal server error, not implemented, bad gateway, service unavailable

http_status_code=(200, 201, 400, 401, 403, 404, 500, 501, 502, 503)
method=("GET", "POST", "PUT", "PATCH", "DELETE")
agents=( "Mozilla", "Google Chrome", "Opera", "Safari", "Internet Exploer", "Microsoft Edge", "Crawler and bot", "Library", "net tool")
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
    echo ${method[$(( RANDOM % 5 ))]}
}
#4
generate_date() {
    echo $(date + "%d.%m.%y-%H:%M:%S")
}
#5
generate_url() {
    echo "http://google.com/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)"
}
#6
generate_agents() {
    echo ${agents[$(( RANDOM % 9 ))]}
}

create_log() {
    
}


for i in {1..5}
do
    create_log 
done