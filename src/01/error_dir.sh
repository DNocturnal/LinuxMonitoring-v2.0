#!/bin/bash

if ! [ ${1: -1} == '/' ]; then
    echo "Некорректный путь!"
elif ! [ -d "$1" ]; then
    echo "Директории не существует!"
else
    . ./error_param.sh
fi

