#!/bin/bash

# Функция для очистки системы по лог файлу
log() {
    echo 'введите логфайл'
    read a
    if [ -f $a ]; then
        while read line; do
            path=$(echo $line | awk '{print $1}' )
            if [ -d $path ]; then
                 rm -rf $path
            else
                 rm -rf $path
            fi
        done < $a
    else
        echo "Файл $a не существует"
    fi
}

# Функция для очистки системы по дате и времени создания
date() {
    start_time=$2
    end_time=$3

    if [ -z "$start_time" ]; then
        echo -e "\033[34mВведите время начала (YYYY-MM-DD HH:MM:SS): "
        read start_time
    fi

    if [ -z "$end_time" ]; then
        echo -e "\033[34mВведите время конца (YYYY-MM-DD HH:MM:SS): "
        read end_time
    fi

     find /* -type f -newermt "$start_time" ! -newermt "$end_time" -delete

}

# Функция для очистки системы по маске имени (символы, нижнее подчёркивание и дата)
mask() {
    pattern=$2

    if [ -z "$pattern" ]; then
        echo -e "\033[34mВведите маску имени (например, *_2022-01-01): "
        read pattern
    fi

    files=$(find / -name "*$pattern*")
    for file in $files; do
         rm -rf $file
    done

    dirs=$(find / -type d -name "*$pattern*" -empty)
    for dir in $dirs; do
         rmdir $dir
    done
}

if [ $# -ne 1 ]; then
    echo -e "\033[35mВведите 1 параметр: $0 {1..3}"
    exit 1
fi

case "$1" in
    1)
        log "$2"
        ;;
    2)
        date "$2" "$3"
        ;;
    3)
        mask "$2"
        ;;
    *)
        echo -e "\033[35mНеверный способ очистки: $1"
        exit 1
esac