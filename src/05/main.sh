#!/bin/bash

# Скрипт запускается с 1 параметром, который принимает значение 1, 2, 3 или 4. В зависимости от значения параметра вывести:

# Все записи, отсортированные по коду ответа
# Все уникальные IP, встречающиеся в записях
# Все запросы с ошибками (код ответа - 4хх или 5хх)
# Все уникальные IP, которые встречаются среди ошибочных запросов

request_code() {

}
uniq_ip() {

}
select_error() {

}
uniq_ip_error() {

} 

if [ $1 -eq 1]; then
    request_code
elif [ $1 -eq 2 ]; then 
    uniq_ip
elif [ $1 -eq 3 ]; then 
    select_error
elif [ $1 -eq 4 ]; then 
    uniq_ip_error
else
    echo "Error $1 parametr! Select 1, 2, 3 or 4"
fi
