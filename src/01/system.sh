#!/bin/bash

path=$1
c_dir=$2
name_dir=$3
c_file=$4
name_file=$5
size=$6

cd $path

for (( i=1; i<=$c_dir; i++ ))
do
  folder_name="${name_dir:0:$i}"
  folder_path="$path/$folder_name"
  mkdir "$folder_path"
  echo "$(date "+%d.%m.%y %T"): create dir - $folder_path" >> script.log
done

random=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c $((size * 1000)))
for folder in "$1"/*
do
  for (( i=1; i<=c_file; i++ ))
  do
    file_n="${name_dir:0:$((i % c_dir))}${name_file}"
    while [[ "$file_n" =~ az ]]
    do
      file_n=$(echo "$file_n" | sed "s/az/za/")
    done
    file_path="$folder/$file_n"
    echo "$random" > "$file_path"
    echo "$(date "+%d.%m.%y %T"): create file - $file_path" >> script.log
    # Проверяем не осталось ли менее 1Гб свободного места на диске
    free_space=$(df -B 1G / | awk '{print $4}' | tail -n +2)
    if (( free_space < 1 )); then
      echo "На диске осталось менее 1Гб свободного места!"
      exit 1
    fi
  done
done

echo "Скрипт завершен" >> script.log
exit 0
