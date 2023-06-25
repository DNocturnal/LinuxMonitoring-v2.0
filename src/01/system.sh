#!/bin/bash

# main.sh /opt/test 4 az 5 az.az 3kb
# echo $1, $2, $3, $4, $5, $6
path=$1
c_dir=$2
name_dir=$3
c_file=$4
name_file=$5
size=$6

function check_directory {
    if ! [ -d "$1" ]; then
        echo "Директории не существует!"
    else
        check_parametr
    fi
}

function check_parametr {
  if [ -z "$c_dir" ] || ! [ "$c_dir" =~ ^[1-9]$|^10$ ]
  then
    echo "Второй параметр должен быть числом!"
    exit 1
  fi

  if [ -z "$name_dir" ] || [ ! "$name_dir" =~ ^[a-z]{1,7}$ ]
  then
    echo "Третий параметр должен содержать не более 7 латинских символов!"
    exit 1
  fi

  if [ -z "$c_file" ] || ! [ "$c_file" =~ ^[1-9]$|^10[0-9]$|^100$ ]
  then
    echo "Четвертый параметр должен быть числом от 1 до 100!"
    exit 1
  fi


  if [ -z "$name_file" ] || [ ! "$name_file" =~ ^[a-z]{1,7}\.[a-z]{1,3}$ ]
  then
    echo "Пятый параметр должен содержать имя файла и расширение, не более 7 и 3 латинских символов соответственно!"
    exit 1
  fi

  if [ -z "$size" ] || ! [ "$size" =~ ^[1-9]$|^[1-9][0-9]$|^100$ ]
  then
    echo "Шестой параметр должен быть числом от 1 до 100!"
    exit 1
  fi
}

check_directory
. ./system.sh

exit 0