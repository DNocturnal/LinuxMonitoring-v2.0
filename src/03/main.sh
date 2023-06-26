#!bin/bash

# Функция для очистки системы по лог файлу
clear_system_by_log_file() {
    if [ -f $1 ]; then
        while read line; do
            path=$(echo $line | awk '{print $1}')
            if [ -d $path ]; then
                rm -r $path
            else
                rm $path
            fi
        done < $1
    else
        echo "Файл $1 не существует"
    fi
}

# Функция для очистки системы по дате и времени создания
clear_system_by_date() {
    start_time=$1
    end_time=$2

    if [ -z "$start_time" ]; then
        echo "Введите время начала (YYYY-MM-DD HH:MM): "
        read start_time
    fi

    if [ -z "$end_time" ]; then
        echo "Введите время конца (YYYY-MM-DD HH:MM): "
        read end_time
    fi

    start_timestamp=$(date -d "$start_time" +%s)
    end_timestamp=$(date -d "$end_time" +%s)

    files=$(find /path/to/dir -type f -newermt "$start_time" ! -newermt "$end_time")
    for file in $files; do
        rm $file
    done

    dirs=$(find /path/to/dir -type d -empty)
    for dir in $dirs; do
        rmdir $dir
    done
}

# Функция для очистки системы по маске имени (символы, нижнее подчёркивание и дата)
clear_system_by_mask() {
    pattern=$1

    if [ -z "$pattern" ]; then
        echo "Введите маску имени (например, *_2023-06-01): "
        read pattern
    fi

    files=$(find /path/to/dir -name "$pattern")
    for file in $files; do
        rm $file
    done

    dirs=$(find /path/to/dir -type d -name "$pattern" -empty)
    for dir in $dirs; do
        rmdir $dir
    done
}

if [ $# -ne 2 ]; then
    echo "Использование: $0 <способ очистки> <параметр>"
    echo "Выберете способ очистки файловой системы:"
    echo "  1 - очистка по log файлу"
    echo "  2 - очистка по дате и времени создания"
    echo "  3 - очистка по маске имени"
    exit 1
fi

case "$1" in
    1)
        clean_by_log_file "$2"
        ;;
    2)
        clean_by_date "$2" "$3"
        ;;
    3)
        clean_by_name "$2"
        ;;
    *)
        echo "Неверный способ очистки: $1"
        exit 1
esac